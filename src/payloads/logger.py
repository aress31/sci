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

import time

from metadata import metadata
from payloads.payload import Payload
from utils import register_operation


class Logger(Payload):
    def __init__(self, args):
        Payload.__init__(self, args)

    def run(self):
        super(Logger, self).run()

    def inject(self, file_path, file_metadata):
        """
        Inject the logger.
        """
        buffer = []
        data = []
        valid_regs = []
        process = False

        with open(file_path, 'r') as file:
            for line in file:
                # Skipping abstract methods
                if ((line.find(".method ") == 0) and
                   (line.find("abstract ") < 0) and
                   (self.keywords[0] == "-1" or
                   any(keyword in line for keyword in self.keywords))):
                    words = line.split()
                    # Retrieving the method data from the meta-data
                    data = metadata.get_data(words[-1], file_metadata)
                    returned_reg = data[3]
                    valid_regs = register_operation.get_valid_regs(
                        returned_reg['reg'], data[2]
                    )
                    # The returned register index must be inferior than 16, the
                    #  method must not contains any monitor directive
                    # must not be alredy edited and must have less
                    # than fitfteen register
                    if ((int(returned_reg["reg"][1:]) < 16) and
                       (len(valid_regs) > 0) and not (data[4])
                       and not (self.payload_name in data[5])):
                        process = True

                    buffer.append(line)

                elif ((line.find("return", 0, 20) > 0) and (process)):
                    # Mark the method as processed
                    buffer.append(
                        "\t# {0} has been injected on {1}\n".format(
                            self.payload_name,
                            time.strftime("%Y-%m-%d %H:%M:%S", time.gmtime())
                        )
                    )
                    data[5].append(self.payload_name)

                    # Set the reg containing the trace
                    buffer.append(
                        "\tconst-string {0}, \"{1}.{2}\"\n".format(
                            valid_regs[0], data[0], data[1]
                        )
                    )

                    # Trace the end of the method including the returned reg
                    # value
                    instruction = self.get_instruction(
                        valid_regs[0], returned_reg["reg_type"],
                        returned_reg["reg"]
                    )
                    buffer.append(instruction)

                    buffer.append(line)

                # Resetting the vars
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

    def set_payload_settings(self, payload_path):
        """
        Not required.
        """
        pass

    def get_instruction(self, reg_for_stacktrace, returned_reg_type,
                        returned_reg=None):
        """
        Return the method call to use accordingly to the returned
        register type.
        """
        allowed_types = [
            'Z', "[Z", "Ljava/lang/Boolean;", "[Ljava/lang/Boolean;",
            'B', "[B", "Ljava/lang/Byte;", "[Ljava/lang/Byte;",
            'S', "[S", "Ljava/lang/Short;", "[Ljava/lang/Short;",
            'C', "[C", "Ljava/lang/Character;", "[Ljava/lang/Character;",
            'I', "[I", "Ljava/lang/Integer;", "[Ljava/lang/Integer;",
            # Long and Double got 64 bits regs (wide directive)
            # 'J', "[J", "Ljava/lang/Long;", "[Ljava/lang/Long;",
            'F', "[F", "Ljava/lang/Float;", "[Ljava/lang/Float;",
            # 'D', "[D", "Ljava/lang/Double;", "[Ljava/lang/Double;",
            "Ljava/lang/String;", "[Ljava/lang/String;",
            "Ljava/lang/Object;", "[Ljava/lang/Object;",
            # 'Lorg/json/JSONObject;',
            "Ljava/net/URI;", "Ljava/net/URL;", "Ljava/net/URLConnection;",
            # 'Ljava/net/HttpURLConnection;',
            "Lorg/apache/http/HttpEntity;",
            # 'Ljava/io/InputStream;'
            ]

        if (returned_reg_type in allowed_types):
            instruction = (
                "\tinvoke-static {{{0}, {1}}}, Landroid/logger/Logger;"
                "->printStackTrace(Ljava/lang/String;{2})V\n".format(
                    reg_for_stacktrace, returned_reg, returned_reg_type
                )
            )
        else:
            instruction = (
                "\tinvoke-static {{{0}}}, Landroid/logger/Logger;"
                "->printStackTrace(Ljava/lang/String;)V\n".format(
                    reg_for_stacktrace
                )
            )

        return instruction
