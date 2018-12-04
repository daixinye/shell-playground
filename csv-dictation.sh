#!/bin/bash
path=$1

words=()
index=0

while read word tag tpye; do
    index=${#words[*]}
    words[$index]=$word
done < $path # 不能使用管道符，管道符会创建一个subshell

index=0
until [[ $index == ${#words[*]} ]]; do
    index=$(($index+1))
    word=${words[$index]}
    say $word
    read answer
    until [[ $answer == $word || $answer == 0 ]]; do
        echo ❌
        say $word
        read answer
    done

    if [[ $answer == 0 ]]; then
        echo $word
    fi
    echo ✅
done