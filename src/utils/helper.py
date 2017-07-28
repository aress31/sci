#    Copyright (C) 2015 Alexandre Teyar

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
#    limitations under the License.

import errno
import os
import shutil


def copy_dir(src, dest):
    """
    Remove the destination directory if it exists and then copy the source.
    """
    if os.path.exists(dest):
        shutil.rmtree(dest)
    try:
        shutil.copytree(src, dest)

    except OSError as error:
        # If the error was caused because the source wasn't a directory
        if (error.errno == errno.ENOTDIR):
            shutil.copy(src, dest)


def move_file(src, dest):
    """
    Remove the destination file if it exists and then move the source.
    """
    if os.path.exists(dest):
        os.remove(dest)

    shutil.move(src, dest)


def get_file_info(payload, f_metadata):
    """
    Print out information about the processed file.
    """
    app_path = os.path.abspath(payload.args.app_path)
    head, tail = os.path.split(app_path)
    app_name = os.path.splitext(tail)[0]

    edited_methods = 0

    with open("./logs/" + app_name, 'w') as file:
        for data in f_metadata:
                if (payload.args.payload in data[5]):
                    file.write(data[0] + '->' + data[1] + '\n')
                    edited_methods += 1

    return edited_methods, os.path.abspath(file.name)


def get_dir_info(payload, dir_metadata):
    """
    Print out information about the processed file.
    """
    app_path = os.path.abspath(payload.args.app_path)
    head, tail = os.path.split(app_path)

    app_name = os.path.splitext(tail)[0]

    methods = 0
    edited_methods = 0

    with open("./logs/" + app_name, 'w') as file:
        for key, value in dir_metadata.items():
            for data in value:
                methods += 1
                if (payload.args.payload in data[5]):
                    file.write(data[0] + '->' + data[1] + '\n')
                    edited_methods += 1

    return methods, edited_methods, os.path.abspath(file.name)


def get_valid_regs(returned_reg, regs):
    """
    Return the valid registers that can be used to store data.
    """
    valid_regs = []

    for reg in regs:
        if ((reg[0] == 'v') and (reg != returned_reg) and (int(reg[1:]) < 16)):
            valid_regs.append(reg)

    return valid_regs


def clean_reg_name(reg, list):
    """
    Clean the name of the registers by removing any characters contained in
    the inputted list.
    """
    for char in list:
        reg = reg.replace(char, '')

    return reg
