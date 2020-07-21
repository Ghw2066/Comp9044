#!/bin/dash

./shrug-init > /dev/null && echo 'shrug-init -- OK'
echo 1 > a && echo 'echo 1 > a -- OK'
echo 1 > b && echo 'echo 1 > b -- OK'
./shrug-add a b > /dev/null && echo 'shrug-add a b -- OK'