#!/usr/bin/env bash

# wolv v1.0

# Use Downloads as directory
if [ -d "/Users/`whoami`/Downloads" ]
then
  loc="/Users/`whoami`/Downloads/";

# Use script location if Downloads doesn't exist
else
  loc="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
fi

# Move and clear the window
cd "$loc"
tput reset;

# Print wolv art
cat << "EOF"


        __--''''''''--__
     _-'                '-_
   .'                      '.
  /                          \
 /           |\               \
|          |V  \_              ;
;          |   ' \             |
;          )    ,_\            ;
 \        /     \_            /
  \      /        \          /
   '.   |          \       .'
     '-_ \          \   _-'
        '-|          \-'
          | |\       |
___wolv___/ |_'.    /___v1.0___

EOF

# Check for command line start
if [ -n "$1" ]
then
  url="$1";

# Initialize URL
else
  echo -e "\nWhere is the file for wolv?";
  read -p "> " url;
fi

# Initialize
filename=`youtube-dl -q -s -e $url`;

# Choose format
youtube-dl -F --no-progress "$url";
echo -e "\nWhich format do you want?";
echo -e "\033[2m(Generally 251 or 22 are best)\033[0m";
read -p "> " format;

# Opus conversion to mp3
if [ "$format" == "251" ]
then
  youtube-dl -xf "$format" -o "$filename"".%(ext)s" "$url";
  ffmpeg -hide_banner -loglevel 0 -stats -y -i "$filename".opus -c:a libmp3lame -abr 1 -b:a 320k "$filename".mp3;
  # ffmpeg -i "$filename".opus -c:a libfdk_aac -vbr 5 -cutoff 18000 "$filename".m4a;
  rm "$filename".opus;

# Vorbis conversion to mp3
elif [ "$format" == "171" ]
then
  youtube-dl -xf "$format" -o "$filename"".%(ext)s" "$url";
  ffmpeg -hide_banner -loglevel 0 -stats -y -i "$filename".ogg -c:a libmp3lame -abr 1 -b:a 320k "$filename".mp3;
  rm "$filename".ogg;

# All other formats
else
  youtube-dl -xf "$format" -o "$filename"".%(ext)s" "$url";
fi

# Restart script on completion
# echo ""; echo ""; ./$(basename $0) && exit;
echo ""; echo ""; exec $0;

# Close terminal on exit
# osascript -e 'quit app "Terminal"' & exit 0;
