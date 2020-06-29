#!/bin/bash

SAVEIFS=$IFS
IFS=$'\n'
for c_file in "$@"
do
    for line in `egrep '^#include\s.*h"$' $c_file`
    do
        #echo $line
        name=`echo $line|cut -d" " -f2| sed 's/"//g' `
        test -e "$name" && continue
        
            
        
        echo "$name included into $c_file does not exist"
    done
done
IFS=$SAVEIFS