#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for filename in ` ls *.jpg  `
do
#  filename_png=$(echo "$filename"|sed s/\.jpg$/ \.png)

#  safename="$(echo "$filename" | sed 's/ /_-_/g')"
   echo $filename
#
   filename_png="${filename%.jpg}.png"
   if test -e "$filename_png"
   then

        echo "$filename_png already exists"
        exit 1
   fi

   convert "$filename" "${filename%.jpg}.png"
   rm "$filename"

   echo "$filename"
done
IFS=$SAVEIFS
