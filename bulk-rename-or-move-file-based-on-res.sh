#!/usr/bin/env bash

#NOTE: This can be made efficient regarding running mkdir
#everytime for option two
#But it was a 5 minute hacky solution that I came up with
#as a concept to how the idea can be accomplished

#Some housekeeping before starting
shopt -s nullglob # Sets nullglob
shopt -s nocaseglob # Sets nocaseglob

for f in *.{jpg,png,jpeg,heic}; do
	DIM=$(magick identify "$f" | cut -d' ' -f3,3)
	EXT="${f##*.}"
	FILENAME="${f%.*}"                       
	#option one: append dimension to filename
	mv "$f" "${FILENAME}_${DIM}.${EXT}"
	#option two: move file to a folder named the DIMENSION
	#mkdir -p ${DIM}
	#mv "$f" "${DIM}/${FILENAME}.${EXT}"
done

for f in *.{mp4,mkv,mov}; do
	DIM=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$f")
	EXT="${f##*.}"
	FILENAME="${f%.*}"                       
	mv "$f" "${FILENAME}_${DIM}.${EXT}"
	#option two: move file to a folder named the DIMENSION
	#mkdir -p ${DIM}
	#mv "$f" "${DIM}/${FILENAME}.${EXT}"
done

#More housekeeping to keep things the way they were before
shopt -u nocaseglob # Unsets nocaseglob
shopt -u nullglob # Unsets nullglob