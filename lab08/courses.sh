#!/bin/dash

arg=$1

curl --location --silent http://www.timetable.unsw.edu.au/current/COMPKENS.html| grep -P "$arg[0-9]{4}.html\">(?!$arg)" | sed "s/.*\($arg[0-9][0-9][0-9][0-9]\)\.html[^>]*> *\([^<]*\).*/\1 \2/" 




#<td class="data"><a href="COMP2511.html">Object-Oriented Design and Programming</a></td>