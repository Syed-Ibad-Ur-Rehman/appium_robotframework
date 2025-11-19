# Robot Framework + Appium — Sauce Labs Demo App


## Prerequisites
- Java installed (for some Appium features)
- Python 3.x
- Appium Server (Appium Desktop or Appium server CLI)
- Robot Framework & AppiumLibrary
- Android device connected with USB debugging enabled OR an Android emulator
- Android platform-tools (adb) and Android build-tools (apksigner) installed and in PATH


## Install Python libs
pip install robotframework 
pip install robotframework-appiumlibrary 
pip install Appium-Python-Client

## How to run
1. Start Appium server (default `http://127.0.0.1:4723/wd/hub`).
2. Connect your Android device and ensure `adb devices` shows it.
3. From project root run:

Notes: Update `device` variable in `sauce_keywords.robot` if needed.
