#!/bin/dash
num=0
while test -e ".snapshot.$num"
do
    num=$(($num+1))
done

mkdir ".snapshot.$num"&&echo "Creating snapshot $num"

for file in $(ls | egrep ^[^.] | egrep -v "(snapshot-load.sh|snapshot-save.sh)")
do

    cp "$file" "./.snapshot.$num"

done
