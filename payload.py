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
import util

class Payload(object):

    def __init__(self, args):
        self.args = args
        self.name = args.payload
        self.app_path = os.path.abspath(self.args.app_path)
        head, tail = os.path.split(self.app_path)
        self.app_name = os.path.splitext(tail)[0]
        self.target = os.path.join("tmp", self.app_name, args.target)
        self.keywords = args.keywords.split(',')

    def run():
        pass

    def check_params(self):
        pass

    def inject(self):
        pass

    def inject_in_dir(self, d_metadata):
        """    
        Recursively inject the payload within the files contained in the target folder.
        """

        for root, dirs, files in tqdm(list(os.walk(self.target)), unit='dir', unit_scale=True, dynamic_ncols=True):
            for file in fnmatch.filter(files, "*.smali"):
                f_path = os.path.join(root, file)

                # Skip the payload directory 
                if (self.args.payload in f_path):
                    continue
                else:
                    f_metadata = d_metadata[f_path]
                    self.inject(f_path, f_metadata)

    def copy_to_apk(self, path):
        """
        Copy the payload to the android folder of the app.
        """

        if (os.path.isfile(path)):
            d_path = os.path.dirname(path)

        else:
            d_path = path

        subdirs = os.listdir(d_path)

        for subdir in subdirs:
            # Check that the current directory is the correct android directory (there is always a support dir)
            if (os.path.isdir(os.path.join(d_path, subdir)) and subdir == "android" and os.path.exists(os.path.join(d_path, subdir, "support"))):
                util.copy_dir(os.path.join("payloads", self.name), os.path.join(d_path, subdir, self.name))
                return (os.path.join(d_path, subdir, self.name))

        return self.copy_to_apk(os.path.dirname(d_path))