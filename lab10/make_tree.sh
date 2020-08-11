#!/bin/bash
curr=$(pwd)
for path in $(find $1 -type f -name 'Makefile')
do
    
    path=`echo $path | sed 's/\/Makefile//'`
    echo "Running make in $path"
    cd $path

    #if test $2 == 'clean' || test $2 == 'clobber'
    if test -n "$2"
    then
        make "$2"
    else
        make
    fi
    cd $curr
done