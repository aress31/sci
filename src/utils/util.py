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


def copy(src, dest):
    """
    Remove the destination directory if it exists and then copy the source.
    """
    if os.path.exists(dest):
        shutil.rmtree(dest, ignore_errors=True)
    try:
        shutil.copytree(src, dest)

    except OSError as error:
        # If the source is not a directory
        if (error.errno == errno.ENOTDIR):
            shutil.copy(src, dest)


def move(src, dest):
    """
    Remove the destination file if it exists and then move the source.
    """
    if os.path.exists(dest):
        os.remove(dest)

    shutil.move(src, dest)
