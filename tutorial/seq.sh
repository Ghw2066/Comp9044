#!/bin/bash
#Write the sequence of integers specified by command-line arguments

if test $# = 1
then
	first=1
	increment=1
	last=$1
elif test $# = 2
then
	first=$1
	increment=1
	last=$2
elif test $# = 3
then
	first=$1
	increment=$2
	last=$3
else
	cat << EOI
Usage:
  $0 last
  $0 first last
  $0 first 2nd last
EOI
	exit 1
fi

if  (( incremnnt < 1 ))
then
	echo "$0: invalid increment value: $increment"
	exit 1
fi	

i=$first
while (( i <= last))
do
	echo $i
	(( i = i + increment ))
done