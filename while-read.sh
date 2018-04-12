#! /bin/bash

while read name number; do
    echo "$number : $name"
done < ./data/week.txt