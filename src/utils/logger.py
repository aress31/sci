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

import colorlog
import logging

FAILURE = 21
SUCCESS = 22


def failure(self, message, *args, **kws):
    if self.isEnabledFor(FAILURE):
        self._log(FAILURE, message, args, **kws)


def success(self, message, *args, **kws):
    if self.isEnabledFor(SUCCESS):
        self._log(SUCCESS, message, args, **kws)


def get_logger():
    logging.addLevelName(FAILURE, "FAILURE")
    logging.addLevelName(SUCCESS, "SUCCESS")

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

    logger = logging.getLogger("sci")
    logger.addHandler(handler)
    logger.setLevel(logging.DEBUG)

    return logger
