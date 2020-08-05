#!/bin/dash

arg=$1
url="http://www.timetable.unsw.edu.au/current/"$arg"KENS.html"
result=$(curl --location --silent $url | grep -P "$arg[0-9]{4}.html\">(?!$arg)" | sed "s/.*\($arg[0-9][0-9][0-9][0-9]\)\.html[^>]*> *\([^<]*\).*/\1 \2/" | uniq )

echo "$result"




#<td class="data"><a href="COMP2511.html">Object-Oriented Design and Programming</a></td>
