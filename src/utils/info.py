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

import os

from utils import config


def get_file_info(payload, file_metadata):
    """
    Print out information about the processed file.
    """
    app_name = payload.app_name
    edited_methods = 0

    if not os.path.exists(config.LOG_FOLDER):
        os.makedirs(config.LOG_FOLDER)

    with open(config.LOG_FOLDER + app_name + ".log", 'w') as file:
        for data in file_metadata:
                if (payload.name in data[5]):
                    file.write(data[0] + '->' + data[1] + '\n')
                    edited_methods += 1

    return len(file_metadata), edited_methods, os.path.abspath(file.name)


def get_dir_info(payload, dir_metadata):
    """
    Print out information about the processed file.
    """
    app_name = payload.app_name
    methods = 0
    edited_methods = 0

    if not os.path.exists(config.LOG_FOLDER):
        os.makedirs(config.LOG_FOLDER)

    with open(config.LOG_FOLDER + app_name + ".log", 'w') as file:
        for key, value in dir_metadata.items():
            for data in value:
                methods += 1
                if (payload.name in data[5]):
                    file.write(data[0] + '->' + data[1] + '\n')
                    edited_methods += 1

    return methods, edited_methods, os.path.abspath(file.name)
