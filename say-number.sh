#! /bin/bash

clear
function invalid_info {
    echo "Invalid Input" >&2
    exit
}

IFS=":" read -p "Please input the range of numbers: " min max
! ([[ "$min" =~ ^[0-9]+$ ]] && [[ "$max" =~ ^[0-9]+$ ]]) && invalid_info

while [ true ]; do
    que=$(($RANDOM%$(($max-$min))+$min))
    say $que
    read -p "Answer: " ans

    until [[ $que = $ans ]]; do
        echo "❌"
        say $que
        read -p "Try again: " ans
    done
    echo "✅"
done

