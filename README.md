# DOS2 Macros

Getting RSI from clicking "Send to Beast" repeatedly during a playthrough?

Divinity: Original Sin 2 is notorious for its inventory management — especially when playing with multiple party members. This macro set is designed to dramatically speed up common item transfer actions and reduce repetitive strain.


## Features

* Hold-to-send items to any origin party member  
    * `Ctrl+R` for RedPrince
    * `Ctrl+S` for Sebille
    * `Ctrl+I` for Ifan
    * `Ctrl+B` for Beast
    * `Ctrl+L` for Lohse
    * `Ctrl+F` for Fane
* Hold-to-send items to any other character (by index as appears in the context menu)
    * `Ctrl+1` for the 1st character in the list
    * `Ctrl+2` for the 2nd character in the list
    * `Ctrl+3` for the 3rd character in the list
    * `Ctrl+4` for the 4th character in the list
* Supports ambiguous context menu positions
* Fast


## Requirements

- [AutoHotkey v1.1+](https://www.autohotkey.com/) installed
- Windows OS
- DOS2

## Usage

1. Clone/download this repo 
2. Unzip it to a folder
3. Run the script (or compiled exe) with AutoHotkey.
4. Open **Divinity: Original Sin 2**.
5. Hover over the item you want to send.
6. Hold the hotkey corresponding to the target character (e.g. `Ctrl + B` to send to Beast).

That's it! The script will repeatedly right-click → locate the menu option → click to send.

## Known Limitations

* Rarely the macro will shift the position of the mouse to click the item, without shifting it back to it's original position. Still not totally certain why... 

## Untested possible limitations

* Unlikely to work on console
* May not work on different resolutions other than 1920x1080
* May not work if gaming on the 2ndary+ monitor

## Contributing

Pull requests to improve robustness, add features, or expand macro sets are welcome.
