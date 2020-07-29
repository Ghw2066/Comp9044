#!/bin/bash

#echo "$1 $2"

SAVEIFS=$IFS
IFS=$'\n'

for file1 in `ls $1`
do
    #echo "$file1"
    if test -e "$2/$file1" 
    then
        #echo "$2/$file1"
        diff "$1/$file1" "$2/$file1" > /dev/null
        if [ $? == 0 ]; then
            echo "$file1"
        fi
    fi

done
IFS=$SAVEIFS





