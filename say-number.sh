#! /bin/bash

# input the range of number
echo -n "Please input the range of number: "
read n1 n2

# say the number
while [ true ]; do
    diff=$(($n2-$n1))
    que=$(($RANDOM%$diff+$n1))
    say $que
    echo -n 'input the number you just heard: '
    read ans

    if [[ $que = $ans ]]; then
        echo "✅"
    else
        echo "❌ $que"
    fi
done
# input the number

