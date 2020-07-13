#!/bin/dash

n=$1
snapshot-save.sh

for file in $(ls ".snapshot.$n")
do

    if test -e $file
    then
        rm $file
    fi

    cp ".snapshot.$n/$file" .

done
echo "Restoring snapshot $n"
