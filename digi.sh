#!/bin/bash

function azione()
{
	local VECCHIO=${1%/}
    local NUOVO=${2%/}
    local DIRS="$VECCHIO/*"
    
    local d
    for d in $DIRS
    do
        if [ -d "$d" ]; then
            local nome=$(basename "$d")
            local percorso="$NUOVO/"
            echo "nome completo: $d"
            echo "nome cartella: $nome"
            echo "nome percorso: $percorso"
            
            local OLDIFS="$IFS"
            IFS="_"
            local i
            for i in $nome
            do
                mkdir -p "$percorso$i"
                
                echo "$d -> $percorso$i"
                
                percorso="$percorso$i/"
            done
            IFS="$OLDIFS"
            
            echo "fine for"
            
            local OLDIFS="$IFS"
            IFS=$'\n'
            set -f
            local FILES="$d/"
            local f
            for f in $(ls -p "$FILES" | grep -v / )
            do
                #echo "Rilevato il file/directory seguente: $f"
                #if [ -f "$f" ]; then
                    echo "$FILES$f -> $percorso$(basename $f)"

                    cp "$FILES$f" "$percorso"
                #else
                #    echo "Non sono un file: $f"
                #fi
            done
            IFS="$OLDIFS"
            set +f
            
            azione "$VECCHIO/$nome" "$percorso"
        fi
    done
}

azione $1 $2
