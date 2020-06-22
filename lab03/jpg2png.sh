#!/bin/bash

SAVEIFS=$IFS
IFS=$'\n'
for filename in $(ls *jpg)
do
    
    filename_png=$(echo "$filename"|sed 's/jpg$/png/g')
#    echo "$filename_png"
    if test -e "$filename_png"
    then
        echo "$filename_png already exists"
        exit 1
    fi

    convert "$filename" "$filename_png"
    rm "$filename"
done
IFS=$SAVEIFS
