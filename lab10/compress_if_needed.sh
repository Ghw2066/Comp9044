#!/bin/bash

for file in $@
do
    xz -zk "$file"
    sizexz=$(ls -l "$file.xz"|cut -d' ' -f5)
    size=$(ls -l "$file"|cut -d' ' -f5)
    if test $size -lt $sizexz
    then
        echo "$file $size bytes, compresses to $sizexz bytes, left uncompressed"
        rm -f "$file.xz"
    else
        echo "$file $size bytes, compresses to $sizexz bytes, compressed"
        rm -f "$file"
    fi
done

