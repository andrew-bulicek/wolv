![wolv-icon-github](img/wolv-icon-github.png)

# Wolv

A simple bash script for sourcing the highest quality audio from Youtube.

## Installation

In order to run Wolv, there are two dependencies you need to globally install first. For both I recommend using a package manager, like [Homebrew](https://brew.sh/) on Mac/Linux or [Chocolatey](https://chocolatey.org/) on Windows.

- [Youtube-dl](https://github.com/ytdl-org/youtube-dl) – You can find the installation instructions [here](https://github.com/ytdl-org/youtube-dl#installation). This package allows for parsing Youtube streams and downloading them locally.
- [FFmpeg](https://ffmpeg.org/) – There are many articles about installing FFmpeg out there, varying by the platform you are using. Again, I recommend using a package manager as it will take care of all of the fine details for you. This package is for converting the audio streams.

*Note: If you don't want to install these packages globally, I have included them in the "opt" folder, and the script can be modified easily to point to the contents of these folders instead.* 

After the packages are set up, I recommend making the script executable so it can be double clicked, like an app or a program. To do this, open terminal, navigate the "wolv" folder, and run the following command:

```bash
chmod +x wolv.sh
```

Mac users can also pin this script to the dock by changing the extension from .sh to .app, adding it to the dock, and then changing the extension back to .sh.

## How It Works

Once the script is running, you'll be greeted by a prompt for the file location. This is where you'll paste in the Youtube link. After it's finished parsing the link, a list of audio formats will be displayed for you to choose from. Generally speaking, the m4a 192 kbps stream (format code 22) or the Opus 160 kbps stream (format code 251) will be the best quality across the board. Type in the format code you want and the script will take of the rest, outputting the file to either your Downloads folder (if it can find it), or the directory in which the script lives.

## FAQ

- **Why are my Opus files being converted to mp3?** This is intended. While Opus is a great codec, saving space and having better sound quality than other codes at lower bitrates, it doesn't have nearly the same support as m4a or mp3 files – such as for use in phones, cars, etc. So even though it is a no-no in the audio world to lossly compress a lossy file, I've found through tests that the Opus 160kbps stream encoded to mp3 is far superior to the m4a at 96kbps, the common second best option on Youtube videos. If you want Opus files instead of mp3, you can comment out the conditional logic with FFmpeg.

- **I'm getting all sorts of errors!** This is why I recommend using a package manager to handle youtube-dl and FFmpeg. Both are updated frequently so be sure to check your versions for updates if you run into any problems.

- **Can I run Wolv from the command line?** Of course. It's built into the script already – set up an alias like this in your .bash_profile or wherever your particular platform/setup stores them: 

  ```bash
  wolv() { exec /your/path/to/wolv.sh $1 }
  ```

  The `$1` variable will be your link to the video, so executing the script from the command line would look like this: `wolv <url>`.

- **Can I use the icon for the script?** Yes! Right click on the script and select "Get Info". In the top left corner there will be an icon of document – drag the "wolv-icon.icns" on top of that. *(Note, this is Mac only.)*

- **Why "Wolv"?** [Oryx and Crake](https://www.amazon.com/Crake-MaddAddam-Trilogy-Margaret-Atwood/dp/0385721676). Recommended.

## Disclaimer

Do not use Wolv on copyrighted material or media published with a license that prohibits downloads.