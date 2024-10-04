# frogtopia-wine

Frogtopia-Wine is a custom build of Wine designed to improve the audio experience for gaming on Linux. Based on the powerful Wine-TKG project, Frogtopia-Wine integrates my own custom audio patches that aim to fix issues such as latency, crackling, and broken multi-channel (5.1/7.1) audio in various Windows games.

## Why Frogtopia-Wine?

Linux gaming via Wine is rapidly improving, but audio problems have been a long-standing issue for gamers. Frogtopia-Wine specifically targets these issues by:

* Reducing audio latency: Smoother audio playback with fewer sync issues.
* Fixing audio crackling: Better stability for games notorious for audio glitches.
* Improving multi-channel support: Proper detection and playback of surround sound (5.1/7.1) on compatible systems.
* Enhancing compatibility with modern games: With a focus on high-quality audio, this build ensures a more seamless gaming experience for Linux users.

## Key Features

* Custom Audio Patches: Developed to address major audio problems with Wine’s default behavior.
* Based on Wine-TKG: Frogtopia-Wine builds upon the highly customizable and performance-optimized Wine-TKG, with additional tweaks for better gaming performance and compatibility.
* Support for Multiple Audio Backends: Tested with PulseAudio, ALSA, and PipeWire for maximum compatibility across Linux distributions.

## Requirements

* A Linux system with basic development tools installed.
* PulseAudio, PipeWire, or ALSA configured as your audio backend.
* (Optional) Steam for Proton games.

## Installation "example"

To use Frogtopia-Wine, follow these steps:

### Clone the repository:
    git clone https://github.com/yourusername/frogtopia-wine.git
    cd frogtopia-wine

### Install Dependencies: You will need the standard build dependencies for Wine. On Debian/Ubuntu:

    sudo apt install build-essential libasound2-dev libpulse-dev libpipewire-0.3-dev

## Build Frogtopia-Wine:

    ./build.sh

This will compile Frogtopia-Wine with the custom audio patches applied.

### Set Frogtopia-Wine as your default Wine version:

    export PATH=/path/to/frogtopia-wine/bin:$PATH

Run your games with Frogtopia-Wine: Simply launch your game using Wine as you normally would:

    wine your-game.exe

## Contributions

Contributions are welcome! If you encounter any issues or have ideas for improving Frogtopia-Wine, feel free to submit a pull request or open an issue.

## License
Frogtopia-Wine is distributed under the GNU Lesser General Public License.
