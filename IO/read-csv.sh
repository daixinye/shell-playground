#/bin/bash


IFS=","
path="/source/words.csv"

cat ~/$path | while read a b c; do echo "$a"; done
