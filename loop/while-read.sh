#! /bin/bash

## week.txt
# Monday 1
# Tuesday 2
# Wednesday 3
# Thursday 4
# Friday 5
# Saturday 6
# Sunday 7
##

while read name number; do
    echo "$number : $name"
done < ./week.txt