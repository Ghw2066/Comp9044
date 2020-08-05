#!/bin/bash

cat $1 | grep -Eo '"name":\s".*",\s'| sed 's/"name":\s"//g'| sed 's/",\s//g' |sort -u
