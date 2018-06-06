#! /bin/bash

# script to display all arguments

count=1
total=$#
until test $count -gt $total ; do
    echo "$count : $1"
    count=$(($count+1))
    shift
done