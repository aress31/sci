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

from tqdm import tqdm
from utils import config, util


class Payload(object):
    def __init__(self, args):
        self.args = args
        self.name = args.payload
        self.app_absolute_path = os.path.abspath(self.args.app.name)
        head, tail = os.path.split(self.app_absolute_path)
        self.app_name = os.path.splitext(tail)[0]
        self.destination = os.path.join(
            config.TMP_FOLDER, self.app_name, args.destination)
        self.keywords = args.keywords.split(',')

    def run(self):
        pass

    def inject(self):
        pass

    def inject_in_dir(self, d_metadata):
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
                if (self.args.payload in file_path):
                    continue
                else:
                    file_metadata = d_metadata[file_path]
                    self.inject(file_path, file_metadata)

    def export_payload(self, path):
        """
        Copy the payload into the app android folder.
        """
        if (os.path.isfile(path)):
            dir_path = os.path.dirname(path)

        else:
            dir_path = path

        subdirs = os.listdir(dir_path)

        for subdir in subdirs:
            # Check that the current directory is the correct android directory
            # (there is always a support dir)
            if (os.path.isdir(os.path.join(dir_path, subdir)) and
               subdir == "android" and
               os.path.exists(os.path.join(dir_path, subdir, "support"))):
                    util.copy(os.path.join(config.PAYLOAD_FOLDER, self.name),
                              os.path.join(dir_path, subdir, self.name))
                    return os.path.join(dir_path, subdir, self.name)

        return self.export_payload(os.path.dirname(dir_path))
