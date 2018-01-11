![SCI](images/sci_logo.jpg)
# Smali Code Injector (SCI)
[![Language](https://img.shields.io/badge/Lang-Java-blue.svg)](https://www.python.org)
[![Language](https://img.shields.io/badge/Lang-Python-blue.svg)](https://www.python.org)
[![Language](https://img.shields.io/badge/Lang-Smali-blue.svg)](https://www.python.org)
[![License](https://img.shields.io/badge/License-Apache%202.0-red.svg)](https://opensource.org/licenses/Apache-2.0)

## Automate assembly code (**smali**) injection within Android applications.
The initial ambition of this project was to automate stack trace injections within Android applications in order to facilitate my master thesis work. Being able to log and display applications' runtime method calls along with their returned value greatly helps in reverse engineering complex applications by providing an insight into their logic and workflow. 

Then, new features and payloads were progressively added in an attempt to create a framework fully capable of injecting any type of assembly code. Users familiar with Android development can easily implement compatible payloads. SCI is in charge of automating low level operation such as registers allocation, dependancie, type, etc. 

*Tampering Android applications has never been that easy!*

Further information about Android reverse engineering can be found at:

<http://www.n00blinuxhacker.com/android-pentesting-reverse-engineering-android-app.html>

### Automation for a simpler world...
Code injections are performed at the assembly level (smali files) making the differenciation process between legit and modified applications complicated and time consuming - it would require considerable forensic work such as network, permissions, signature and code analysis -.

A high level overview of the steps involved during code injection is:

1. Disassembling the application.
2. Collecting relevant information about the application. 
    * Classes name.
    * Methods name.
    * Registers number and type.
    * etc.
3. Editing the AndroidManifest.xml to add permissions, services and broadcastReceivers (depending on the payload requirements).
4. Injecting and tweaking up the selected payload within the targeted method(s). Some Android libraries are also injected in order to defeat obfuscation.
5. Reassembling and signing the app with a valid self-signed certificate.

## Usage
### Examples:
#### Generic usage:

    $ python3 sci.py -a APP {search,payload}

    -a APP, --app APP  	Android application to trojanize

    positional arguments:
        search          search command - identifies the main activity
        payload         payload command

#### Search usage:

    $ python3 sci.py -a APP search

    -a APP, --app APP   Android application to trojanize

#### Payload usage:

    $ python3 sci.py -a APP payload [-d DESTINATION] [-k KEYWORDS] {logger,spyware}

    -a APP, --app APP   Android application to trojanize
    -d DESTINATION, --dest DESTINATION
                        the destination file or directoy for injection
    -k KEYWORDS, --keywords KEYWORDS
                        keywords (separated by ',') for injection filtering

    positional arguments:
        logger          logger command
        spyware         spyware command

##### Logger usage:

    $ python3 sci.py -a APP [-d DESTINATION] [-k KEYWORDS] logger

    -a APP, --app APP   Android application to trojanize
    -d DESTINATION, --dest DESTINATION
                        the destination file or directoy for injection
    -k KEYWORDS, --keywords KEYWORDS
                        keywords (separated by ',') for injection filtering

Launch the Android debugger *adb* using the following command to view application's runtime method calls:

    $ adb logcat | grep "::trace"

##### Spyware usage:

    $ sci.py -a APP payload [-d DESTINATION] [-k KEYWORDS] spyware [-h] -ppg PROPAGATE -rh RHOST

    -a APP, --app APP   Android application to trojanize
    -d DESTINATION, --dest DESTINATION
                        the destination file or directoy for injection
    -k KEYWORDS, --keywords KEYWORDS
                        keywords (separated by ',') for injection filtering
    -ppg PROPAGATE, --propagate PROPAGATE
                        spoofed SMS to send for the malware propagation
    -rh RHOST, --rhost RHOST
                        attacker's host/ip for stolen data transmission, e.g.
                        http://192.168.0.24/handler.php

*Note*: For optimal results, inject Spyware on the *onCreate()* method of the application main activity.

Server-side scripts to insert and store the stolen data sent to the attacker into a MySQL database are available under the *scripts* folder.

To enable the Spyware debugging mode set the *DEV_MODE* variable to *true* in *payloads\smali\spyware* line 7. Then launch the Android debugger *adb* using the following command:

    $ adb logcat | grep "::trace"

## Possible Improvements
- [ ] Create new payloads (e.g. a reverse shell).
- [ ] Optimise the source code.

## Project Information
This framework was developed in the context of my master thesis work in July 2015 and rewritten in 2017.

Further information about my master thesis work can be found at:

<https://www.slideshare.net/slideshow/embed_code/key/6kQq5IjSldDWLl>

## Dependencies
### Third-party libraries
#### tqdm 4.8.4: 
The *python3-tqdm* package is required. 

<https://pypi.python.org/pypi/tqdm>

## Licenses
### Smali Code Injector (SCI):
   Copyright (C) 2015-2017 Alexandre Teyar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
   limitations under the License. 

### Apktool:
   Copyright (C) 2010 Ryszard Wiśniewski 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
   limitations under the License.

### smali/baksmali:
   Copyright (c) 2010 Ben Gruver (JesusFreke)
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

### tqdm:
   Copyright (c) 2013 noamraph

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
