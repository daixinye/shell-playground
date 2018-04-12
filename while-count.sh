#! /bin/bash

read -p 'input the number -> ' n

count=1

while test $count -lt $n; do
    echo $count
    count=$(($count+1))
done

echo "Finished"