# Smali Code Injector (SCI)

[![Language](https://img.shields.io/badge/Lang-Java-blue.svg)](https://java.com)
[![Language](https://img.shields.io/badge/Lang-PHP-blue.svg)](https://www.php.net)
[![Language](https://img.shields.io/badge/Lang-Python-blue.svg)](https://www.python.org)
![Language](https://img.shields.io/badge/Lang-Smali-blue.svg)
[![License](https://img.shields.io/badge/License-Apache%202.0-red.svg)](https://opensource.org/licenses/Apache-2.0)

## Automate assembly code (`smali`) injection within `Android` applications.

The initial ambition of this project was to automate stack trace injections within `Android` applications in order to facilitate my master thesis work. Being able to log and display applications' runtime method calls along with their returned value greatly helps in reverse engineering complex applications by providing an insight into their logic and workflow.

Then, new features and payloads were progressively added in an attempt to create a framework fully capable of injecting any type of assembly code. Users familiar with `Android` development can easily implement compatible payloads. SCI is in charge of automating low level operation such as registers allocation, dependancie, type, etc.

_Tampering `Android` applications has never been that easy!_

Further information about `Android` reverse engineering can be found at:

- http://www.n00blinuxhacker.com/android-pentesting-reverse-engineering-android-app.html

### Automation for a simpler world...

Code injections are performed at the assembly level (`smali` files) making the differenciation process between legit and modified applications complicated and time consuming - it would require considerable forensic work such as network, permissions, signature and code analysis -.

A high level overview of the steps involved during code injection is:

1. Disassembling the application.
2. Collecting relevant information about the application.
   - Classes name.
   - Methods name.
   - Registers number and type.
   - etc.
3. Editing the AndroidManifest.xml to add permissions, services and broadcastReceivers (depending on the payload requirements).
4. Injecting and tweaking up the selected payload within the targeted method(s). Some `Android` libraries are also injected in order to defeat obfuscation.
5. Reassembling and signing the app with a valid self-signed certificate.

## Usage

- To list the available options:

  ```bash
  python3 sci.py -h

  -a APP, --app APP  	Android application to trojanize

  positional arguments:
      search          search command - identifies the main activity
      payload         payload command
  ```

- To list `search` options:

  ```bash
  python3 sci.py -a APP search -h

  -a APP, --app APP   Android application to trojanize
  ```

- To list `payload` options:

  ```bash
  python3 sci.py -a APP payload -h

  -a APP, --app APP   Android application to trojanize
  -d DESTINATION, --dest DESTINATION
                      the destination file or directoy for injection
  -k KEYWORDS, --keywords KEYWORDS
                      keywords (separated by ',') for injection filtering

  positional arguments:
      logger          logger command
      spyware         spyware command
  ```

  - To list `logger` options:

    ```bash
    python3 sci.py -a APP [-d DESTINATION] [-k KEYWORDS] logger -h

    -a APP, --app APP   Android application to trojanize
    -d DESTINATION, --dest DESTINATION
                        the destination file or directoy for injection
    -k KEYWORDS, --keywords KEYWORDS
                        keywords (separated by ',') for injection filtering
    ```

    Launch the `Android` debugger `adb` using the following command to view application's runtime method calls:

    ```bash
    adb logcat | grep "::trace"
    ```

  - To list `spyware` options:

    ```bash
    python3 sci.py -a APP payload [-d DESTINATION] [-k KEYWORDS] spyware -h

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
    ```

    > [!Note] 
    > For optimal results, inject `Spyware` on the `onCreate()` method of the application main activity.

    Server-side scripts used to insert and store the stolen data sent into an attacker-controlled `MySQL` database are available under [scripts](https://github.com/aress31/sci/tree/master/scripts).

    To enable `spyware` debugging mode set `DEV_MODE` to `true` in [payloads\smali\spyware](https://github.com/aress31/sci/blob/master/payloads/smali/spyware/Spyware.smali) at line 7. Then launch the `Android` debugger `adb` using the following command:

    ```bash
    adb logcat | grep "::trace"
    ```

## Roadmap

- [ ] Implement new payloads (e.g. `reverse shell`).
- [ ] Source code optimisation.

## Project Information

This framework was developed in the context of my [master thesis work](https://www.slideshare.net/AlexandreTeyar/security-in-mobile-banking-apps-154409860) in July 2015 and rewritten in 2017.

## Sponsor 💖

If you want to support this project and appreciate the time invested in developping, maintening and extending it; consider donating toward my next cup of coffee. ☕

It is easy, all you got to do is press the `Sponsor` button at the top of this page or alternatively [click this link](https://github.com/sponsors/aress31). 💸

## Reporting Issues

Found a bug? I would love to squash it! 🐛

Please report all issues on the GitHub [issues tracker](https://github.com/aress31/sci/issues).

## Contributing

You would like to contribute to better this project? 🤩

Please submit all `PRs` on the GitHub [pull requests tracker](https://github.com/aress31/sci/pulls).

## License

See [LICENSE](LICENSE).
