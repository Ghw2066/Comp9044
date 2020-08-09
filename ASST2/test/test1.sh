#!/bin/dash
for c_file in *.c
do
    echo gcc -c $c_file
done

for c_file in ?.c
do
    echo gcc -c $c_file
done

for c_file in [a-z].c
do
    echo gcc -c $c_file
done