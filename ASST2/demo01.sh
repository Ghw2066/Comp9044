#!/bin/dash

if test $# = 1
then
    start=1
    finish=$1
elif test $# = 2
then
    start=$1
    finish=$2
else
    echo "Usage: <start> <finish>"
    exit 1
fi