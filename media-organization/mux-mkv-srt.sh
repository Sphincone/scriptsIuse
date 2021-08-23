#!/bin/bash

t=$(which mkvmerge)
if [ -z "$t" ]; then
    echo "mkvtoolnix/mkvmerge not found, install using brew install mkvtoolnix"
    exit -1
fi

ls *.mp4 | sed -e 's/\.mp4$//' | xargs -I {} mkvmerge -o "remux-{}.mp4" "{}.mp4" --forced-track "0:yes" --default-track "0:yes" --track-name "0:English" --language "0:eng" "{}.srt"
