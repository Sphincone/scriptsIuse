#!/usr/bin/env bash

#Housekeeping (Defining colors)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
NORMAL=$(tput sgr0)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)

# THIS IS A WORK IN PROGRESS
# IT LIKELY WONT BREAK YOUR SYSTEM BUT YEAAH
# MORE CUSTOMIZATION COMING SOON(?)

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    printf "    Usage: $(basename $0) [WidthxHeight...]\n\n"
    printf "    Example: $(basename $0) 500x500\n"
    printf "             $(basename $0) 200x200 1000x1000 1600x500\n"
    printf "             $(basename $0) -h or --help to see this.\n"
    printf "    ${YELLOW}GenImg> Generates a image with the given width and height\n"
    printf "    ${NORMAL}You can generate multiple images at once, put a space in between every WidthxHeight\n"
    printf "    ${RED}Please write WidthxHeight without any spaces in between.\n"
    printf "    ${NORMAL}Filename is the given dimensions, as well as the text on image to identify easily.\n"
    printf "    ${NORMAL}Makes use of imagemagick's convert command. Install imagemagick if not installed.\n"
    exit 0
fi


#imagemagick check
m=$(which magick)
if [ -z "$m" ]; then
    echo "ERROR: imagemagick not found, install using brew install imagemagick"
    exit -1
fi


for res in "$@"
do
    convert -background "#1fda9a" -fill "#ffffff" -font "Helvetica-Bold" -size "$res" -gravity center label:"$res" "$res".png
done
