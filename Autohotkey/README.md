<div id="top"></div>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]




<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://www.autohotkey.com/">
    <img src="images/ahk_logo_no_text.svg" alt="Logo" width="180" height="120">
  </a>

  <h3 align="center">Karl-Henriks Autohotkey script</h3>

  <p align="center">
    This repository contains an AutoHotkey script designed to enhance productivity and streamline keyboard shortcuts. The script is developed for AutoHotkey v2.0 and offers various functionalities including custom keybindings for navigation, application switching, and more.
    <br />
<br/>    
  </p>
</div>


## Features
- **Custom Keybindings:** Use the Caps Lock key in combination with other keys for quick navigation and actions.
- **Application Switching:** Easily switch between or start common applications like Visual Studio Code, Microsoft Teams, Outlook, Windows Terminal, and Microsoft Edge.
- **Keyboard Layout Adaptation:** Special function for adapting to English keyboard layout issues.
- **Caps Lock Management:** Keeps the Caps Lock key always turned off to instead be used as a function key.

## Requirements
- AutoHotkey v2.0

## Installation
1. Ensure AutoHotkey v2.0 is installed on your system.
2. Download the script from this repository.
3. Run the script using AutoHotkey.

## Usage
After running the script, you can use the following key combinations:

- **Navigation:**
  - `CapsLock + W/A/S/D` or `CapsLock + I/J/K/L`: Arrow key functions (Up, Left, Down, Right).
  - `CapsLock + 0`: Sends the degree symbol (°).
  - `CapsLock + å/¨`: Adaptation for English keyboard layout issues with square brackets.
  - `CapsLock + [/]`: Sends `{}` and `{}` respectively.
  - `CapsLock + Down`: Activates the Apps key.

- **Application Switching/Starting:**
  - `CapsLock + C`: Switch to or start Visual Studio Code.
  - `CapsLock + T`: Activate Microsoft Teams.
  - `CapsLock + O`: Switch to or start Outlook.
  - `CapsLock + Ö` or `CapsLock + SC027`: Switch to or start Windows Terminal.
  - `CapsLock + B`: Switch to or start Microsoft Edge.

## Customization
You can customize the script by editing the key combinations and the paths to the applications according to your preferences and setup.

## Contributing
Contributions to this project are welcome. Please feel free to fork the repository, make changes, and submit a pull request.

## License
This script is released under the MIT license, see LICENSE file for more details.

## Disclaimer
The author is not responsible for any issues caused by the use of this script. Please use it at your own risk.