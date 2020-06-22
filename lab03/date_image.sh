#!/bin/bash

SAVEIFS=$IFS
IFS=$'\n'
for filename in $(ls *jpg)
do 
    
    datetime=$(ls -l $filename | cut -d" " -f6-8| sed 's/ /_/g')
    #day=$(ls -l $filename | cut -d" " -f7)
    #time=$(ls -l $filename | cut -d" " -f8)
    echo "$datetime"
    convert -gravity south -pointsize 36 -draw "text 0,10 "$datetime"" "$filename" "tmp_$filename"
    rm "$filename"
    mv "tmp_$filename" "$filename"
    
done
IFS=$SAVEIFS


