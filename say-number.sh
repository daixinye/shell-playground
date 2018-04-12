#! /bin/bash

read -p "Please input the range of numbers: " min max

diff=$(($max-$min))

while [ true ]; do
    que=$(($RANDOM%$diff+$min))
    say $que
    read -p "Answer: " ans

    until [[ $que = $ans ]]; do
        echo "❌"
        say $que
        read -p "Try again: " ans
    done
    echo "✅"
done

