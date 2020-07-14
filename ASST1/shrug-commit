#!/bin/dash

if test -e "./.shrug/log"
then
    num=`wc -l .shrug/log | cut -d" " -f1`
else
    num=0
    touch "./.shrug/log"
fi

if test -d ".shrug/objects"
then
    continue
else
    mkdir ".shrug/objects"
fi

if test $1 = "-m"
then
    if test -d ".shrug/objects/$num"
    then
        continue
    else
        mkdir ".shrug/objects/$num"
    fi
    cp .shrug/index/* ".shrug/objects/$num"
    echo $2 >> ./.shrug/log
    echo "Committed as commit $num"
fi
