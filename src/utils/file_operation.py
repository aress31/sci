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

import logging
import os
import shutil
import sys
import zipfile

from utils import config


def copy(src, dest):
    """
    Remove the destination directory if it exists and then copy the source.
    """
    logging.debug("copying {} to {}".format(src, dest))

    try:
        if (os.path.isdir(src)):
            if os.path.exists(dest):
                shutil.rmtree(dest)

            shutil.copytree(src, dest)

        elif (os.path.isfile(src)):
            if not os.path.exists(os.path.dirname(dest)):
                os.makedirs(os.path.dirname(dest))

            shutil.copy2(src, dest)

    except OSError as ex:
        logging.critical("{}".format(ex))
        sys.exit(1)


def remove_from_zip(zip_file, file_names):
    tmp_zip = os.path.join(config.TMP_FOLDER, 'tmp.zip')

    with zipfile.ZipFile(zip_file, 'r') as zip_read:
        with zipfile.ZipFile(tmp_zip, 'w') as zip_write:
            for item in zip_read.infolist():
                if item.filename not in file_names:
                    data = zip_read.read(item.filename)
                    zip_write.writestr(item, data)

    shutil.move(tmp_zip, zip_file)
