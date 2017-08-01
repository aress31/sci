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

import fnmatch
import os
import sys

from tqdm import tqdm
from utils import config, file_operation


class Payload(object):
    def __init__(self, args):
        self.args = args
        self.payload_name = args.payload_name
        self.app_name = os.path.basename(args.app.name)
        self.app_path = os.path.abspath(args.app.name)
        self.destination = os.path.join(self.app_name, args.destination)
        self.keywords = args.keywords.split(',')

    def run(self):
        pass

    def inject(self):
        pass

    def inject_in_dir(self, dir_metadata):
        """
        Recursively inject the payload within the files contained in the
        destination folder.
        """
        for root, dirs, files in tqdm(list(os.walk(self.destination)),
                                      unit='dir', unit_scale=True,
                                      dynamic_ncols=True):
            for file in fnmatch.filter(files, "*.smali"):
                file_path = os.path.join(root, file)

                # Skip the payload directory
                if (self.payload_name in file_path):
                    continue
                else:
                    file_metadata = dir_metadata[file_path]
                    self.inject(file_path, file_metadata)

    # TODO: Improve the logic
    def export_payload(self):
        """
        Copy the smali payload files into the app android folder.
        """
        for root, subdirs, files in os.walk(
           os.path.join(config.TMP_FOLDER, self.app_name)):
            for subdir in subdirs:
                # Verify that the current directory is the correct
                # android directory (hint: always a 'support dir)
                if subdir == "android" and os.path.isdir(
                   os.path.join(root, subdir, "support")):
                    file_operation.copy(
                        os.path.join(config.PAYLOAD_FOLDER, self.payload_name),
                        os.path.join(root, subdir, self.payload_name))

                    return os.path.join(root, subdir, self.payload_name)
