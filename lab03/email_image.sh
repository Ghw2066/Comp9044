#!/bin/bash

for pic in "$@"
do
    gm display "$pic"
    #echo "Address to e-mail this image to?" 

    if read -p "Address to e-mail this image to? " email
    then
        if read -p "Message to accompany image? " msg
        then
            if echo "$msg" |mutt -s "$pic!" -e 'set copy=no' -a $pic -- $email
            then
                echo "$pic sent to $email"
            fi
        fi

    fi

    #echo "Message to accompany image?"

    #echo "$pic sent to andrewt@cse.unsw.edu.au"

done