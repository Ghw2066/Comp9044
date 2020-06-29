#!/bin/bash

SAVEIFS=$IFS
IFS=$'\n'
for file in `ls *.htm`
do
    newfile=`echo $file|sed 's/.htm$/.html/g'`
    
    if test -e "$newfile"
    then
        
            echo "$newfile exists"
            exit 1
        
    fi
    #newfile=`echo $file|sed 's/.htm/.html/g'`
    mv $file $newfile
done
IFS=$SAVEIFS