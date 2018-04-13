#! /bin/bash

# script to find longest string in a file

for i ;do
    if [[ -r $i ]] ; then
        max_len=
        max_word=

        for j in $(strings $i); do
            len=$(echo $j | wc -c)
            if (( len > max_len )); then
                max_len=$len
                max_word=$j
            fi
        done        

        echo "$i: '$max_word' ($max_len characters)"
    fi
done