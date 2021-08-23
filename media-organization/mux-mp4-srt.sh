#!/bin/bash

t=$(which mkvmerge)
if [ -z "$t" ]; then
    echo "mkvtoolnix/mkvmerge not found, install using brew install mkvtoolnix"
    exit -1
fi

ls *.mkv | sed -e 's/\.mkv$//' | xargs -I {} mkvmerge -o "remux-{}.mkv" "{}.mkv" --forced-track "0:yes" --default-track "0:yes" --track-name "0:English" --language "0:eng" "{}.srt"
