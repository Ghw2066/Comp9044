#!/bin/bash

file=$1
suffix=${file#*.}
num=0
while test -e ".$file.$num"
do
    num=$(($num+1))
    #echo " $num"        
done

cp "$file" ".$file.$num"&&echo "Backup of '$file' saved as '.$file.$num'"

