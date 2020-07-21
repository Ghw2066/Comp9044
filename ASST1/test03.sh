#!/bin/dash

./shrug-init && echo 'shrug-init -- OK'
echo 1 > a && echo 'echo 1 > a -- OK'
echo 1 > b && echo 'echo 1 > b -- OK'
./shrug-add a b && echo 'shrug-add a b -- OK'
./shrug-commit -m 'commit a b' && echo 'shrug-commit -m 'commit a b' -- OK'
echo 2 > a && echo 'echo 2 > a -- OK'
./shrug-add a && echo 'shrug-add a -- OK'
./shrug-commit -m 'commit a' && echo 'shrug-commit -m 'commit a' -- OK'
./shrug-log && echo 'shrug-log -- OK'