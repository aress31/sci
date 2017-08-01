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

DEBUG_MODE = True
DEBUG_FOLDER = os.path.join("..", "debug")
CERT = os.path.join("..", "certs", "my-release-key.keystore")
# The path must be defined from the 'src' folder
LOGGING_CONF = os.path.join("utils", "logging.json")
MALWARE_FOLDER = os.path.join("..", "malwares")
PAYLOAD_FOLDER = os.path.join("..", "payloads", "smali")
TMP_FOLDER = os.path.join("..", "tmp")
