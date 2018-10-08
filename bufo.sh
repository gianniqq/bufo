#!/bin/bash

function handle_folder(){
    local INPUT=${1%/}
    local OUTPUT=${2%/}
    echo "input $INPUT"
    echo "output $OUTPUT"
    echo "dirs $DIRS"
    local DIRS="$INPUT/"
    local d
    for d in "$DIRS"*
    do
        if [ -d "$d" ]; then
            local name=$(basename "$d")
            local path="$OUTPUT/"
            #echo "complete name: $d"
            #echo "directory name: $name"
            #echo "path name: $path"
            local OLDIFS="$IFS"
            IFS="_"
            local i
            for i in $name
            do
                mkdir -p "$path$i"
                echo "$d -> $path$i"
                path="$path$i/"
            done
            IFS="$OLDIFS"
            local OLDIFS="$IFS"
            IFS=$'\n'
            set -f
            local FILES="$d/"
            local f
            for f in $(ls -p "$FILES" | grep -v / )
            do
                echo "$FILES$f -> $path$(basename $f)"
                cp "$FILES$f" "$path"
            done
            IFS="$OLDIFS"
            set +f
            handle_folder "$INPUT/$name" "$path"
        fi
    done
}

handle_folder "$1" "$2"
