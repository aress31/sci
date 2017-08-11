#    Copyright (C) 2016 Alexandre Teyar

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
#    limitations under the License.

import fnmatch
import os
import re

from utils import register_operation


def generate_dir_metadata(d_path):
    """
    Extract the information concerning the methods inside of a .smali
    file ([class_name, method name, reg number, [variables], class name]).
    """
    dir_metadata = {}

    for root, dirs, files in os.walk(d_path):
        for f_name in fnmatch.filter(files, "*.smali"):
            file_path = os.path.join(root, f_name)
            dir_metadata[file_path] = generate_file_metadata(file_path)

    return dir_metadata


def generate_file_metadata(file_path):
    """
    Extract the information concerning the methods inside of a .smali
    file ([class_name, method name, reg number, [variables], class name]).
    """
    with open(file_path, 'r') as file:
        file_metadata = {}
        methods = []
        regs = []
        returned_reg = {}
        payload = []
        monitor_function = False
        inside = False

        for line in file:
            if (line.find(".class ") == 0):
                words = line.split()
                class_name = words[-1]

            # We ignore the abstract methods
            elif ((line.find(".method ") == 0) and
                  (line.find("abstract ") < 0)):
                # We get the method name
                words = line.split()
                method_name = words[-1]

                # We get the returned reg type from the method name
                words1 = method_name.split(')')
                returned_reg["reg_type"] = words1[-1]

                inside = True

            # We check if any code has previsouly been injected to the method
            elif ((line.find("has been injected on ") > 0) and (inside)):
                words = line.split()
                payload.append(words[1])

            # monitor-enter, monitor-exit and return-wide screw the things up!
            elif (((line.find("monitor-enter ") > 0) or
                   (line.find("return-wide ") > 0)) and (inside)):
                monitor_function = True

            elif ((line.find("return", 0, 20) > 0) and (inside)):
                words = line.split()

                if (len(words) > 1):
                    returned_reg["reg"] = words[-1]
                    regs.extend([words[-1]])
                # return-void case
                else:
                    returned_reg["reg"] = "v-1"

            elif ((line.find(".end method") == 0) and (inside)):
                regs = sorted(set(regs))
                # In the case where the method contains no return statement
                if (len(returned_reg) < 2):
                    returned_reg["reg"] = "v-1"

                # Store the data related to the current methods
                methods.append([class_name, method_name, regs,
                                returned_reg, monitor_function, payload])

                # Reset the vars for the next method
                regs = []
                returned_reg = {}
                payload = []
                monitor_function = False
                inside = False

            elif (inside):
                regs.extend(get_var_from_line(line))

            else:
                continue

        # dict containing data related to all the methods present in the file
        file_metadata[file_path] = methods

    return file_metadata[file_path]


def get_data(method_name, file_metadata):
    """
    Return the method data containing in the file metadata.
    """
    for data in file_metadata:
        if (method_name == data[1]):
            return data


def get_var_from_line(line):
    """
    Search for any register present inside of an instruction line.
    """
    regs = []
    pattern = r"^{?,?[vp]\d+,?}?,?$"
    words = line.split()

    for word in words:
        match = re.match(pattern, word)
        if match:
            regs.append(
                register_operation.clean_reg_name(word, [',', '{', '}']))

    return regs
