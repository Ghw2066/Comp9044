#!/bin/bash

cat "$@" | egrep "COMP[29]041" | cut -d"|" -f3| cut -d"," -f2| cut -d" " -f2| sort| uniq -c|sort -r |cut -d" " -f8| head -1