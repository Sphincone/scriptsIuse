#!/bin/bash

t=$(which megaput)
if [ -z "$t" ]; then
    echo "megatools not found, install using brew install megatools or"
    echo "grab experimental builds from megatools website (Recommended)"
    exit -1
fi

t=$(which youtube-dl)
if [ -z "$t" ]; then
    echo "youtube-dl not found, install using brew install youtube-dl"
    exit -1
fi

#There should be a file called links.txt with youtube video/channel/playlist link
#You have to create it yourself via touch links.txt
#No error handling because I've moved on to rclone which is a better solution IMO

for clip in $(cat links.txt); do
  FILENAME=$(youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 -o '%(title)s.%(ext)s' --get-filename $clip)
  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 -o '%(title)s.%(ext)s' $clip
  megaput "$FILENAME";
  rm -f "$FILENAME"
done
