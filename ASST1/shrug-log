#!/bin/dash

SAVEIFS=$IFS
IFS="
"

line_num=`wc -l .shrug/log | cut -d" " -f1`
for line in `cat .shrug/log | sort -r`
do
    line_num=`expr $line_num - 1`
    echo "$line_num $line"
done
IFS=$SAVEIFS