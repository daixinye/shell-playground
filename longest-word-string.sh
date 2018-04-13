#!/bin/bash

# script to find longest string in a file

for file ; do
    if [[ -r $file ]]; then
        max_len=
        max_word=

        for line in $(strings $file); do
            len=${#line}
            if (( len > max_len )); then
                max_len=$len
                max_word=$line
            fi
        done
        echo "$file: '$max_word'($max_len characters)"
    fi
done