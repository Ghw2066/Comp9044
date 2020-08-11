#!/bin/bash



for url in $@
do
    echo -n "$url "
    curl -I -s $url | egrep -i "Server:\s" | sed 's/[Ss]erver:\s//'
done
