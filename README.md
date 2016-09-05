![SCI](images/sci_logo.jpg)
# Smali Code Injector
## Automate assembly code (**smali**) injection within Android applications.

The initial ambition of this project was to automate stack trace injections within Android applications in order to facilitate my master thesis work. Being able to log and display applications' runtime method calls along with their returned value greatly helps in reverse engineering complex applications by providing an insight into their logic and workflow. 

Lately, new features and payloads were added in an attempt to create a framework fully capable of injecting any type of assembly code. Users familiar with Android development can easily implement compatible payloads. SCI is in charge of automating low level operation such as registers allocation, dependancie, type, etc. 

*Tampering Android applications has never been that easy!*

More information about Android reverse engineering can be found at:

<http://www.n00blinuxhacker.com/android-pentesting-reverse-engineering-android-app.html>

### Automation for a simpler world
Code injections are performed at the assembly level (smali files) making the differenciation process between legit and modified applications complicated and time consuming - it would require considerable forensic work such as network, permissions, signature and code analysis -.

A high level overview of the steps involved during code injection is:

1. Disassembling the application.
2. Collecting relevant information about the application. 
	* Classes name.
	* Methods name.
	* Registers number and type.
	* etc.
3. Editing the AndroidManifest.xml to add permissions, services and broadcastReceivers (depending on the payload requirements).
4. Injecting and tweaking up the selected payload within the targeted method(s).
5. Reassembling and signing the app with a valid self-signed certificate.

## Usage
### Examples:
#### Generic usage:

		$ python3 sci.py -a [app] -t [target] -k [keyword] -p [payload] -rh [remote_host] -ppg [spoofed_SMS] -s
		
	[-a]: 	applicaion to modify.
	[-t]: 	directory/file where to recursively perform the injection. If this argument is absent, the injection is performed within the whole app.
	[-k]: 	keywords to filter on. Ex: if -k "SSL,X509TrustManager" the payload will only be injected on the method containing SSL in their declaration header - **help for certificate unpinning** -.
	[-p]: 	payload to inject. 
	[-ppg]:	spoofed SMS content to send - **to propagate the malware** -.
	[-rh]:  IP address of the attacker/script for sending the stolen data.
	[-s]:	search for the main activity.

Identify the main activity - works with obfuscated apps -:

		$ python3 sci.py -a [apps] -s
		
Display the help menu:

		$ python3 sci.py -h
		
#### Spyware usage:

		$ python3 sci.py -a [app] -t [target] -k [keyword] -p spyware -rh [script] -ppg [spoofed_SMS] 
    
	[-ppg]:	link with the malicious app. 
	[-rh]: 	IP of the remote receiver (or URL of the file responsible for the JSON data handling and parsing (a script example can be found under /scripts/handler.php - do not forget to change the settings to connect to your DB -).

*Advice*: Inject the Spyware on the **onCreate()** method of the main activity.
		
#### Logger usage:

		$ python3 sci.py -a [app] -t [target] -k [keyword] -p logger

Connect your phone to your computer and use the following commands to filter and display the modified app runtime method calls:

		$ adb logcat | grep "::trace

## Dependencies
### Third-party libraries
#### colorama 0.3.7:
The *python3-colorama* package is required. 

<https://pypi.python.org/pypi/colorama>

#### tqdm 4.8.4: 
The *python3-tqdm* package is required. 

<https://pypi.python.org/pypi/tqdm>  

## Future Improvements
* Add new payloads (reverse shell).
* Source code optimisation.

## Project Information
This framework was developed in the context of my master thesis work in July 2015.	

## Licenses
### Smali Code Injector:
   Copyright (C) 2015 Alexandre Teyar

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

### python-progressbar:
   Copyright (C) 2005 Nilton Volpato

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
