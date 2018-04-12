#!/bin/bash

while [ true ]; do

    read -p "enter word > "

    case $REPLY in
    # 全部吻合
    abc) echo "$REPLY 全部吻合" ;;
    # 单个字母吻合
    [[:alpha:]]) echo "$REPLY 单个字母吻合" ;;
    # 三个字符吻合
    ???) echo "$REPLY 三个字母吻合" ;;
    # 以 .txt 吻合
    *.txt) echo "$REPLY 以.txt结尾符合" ;;
    # 两种模式符合其一
    [0-9]|number) echo "$REPLY 两种模式符合其一" ;;
    quit) echo "q"
    exit 0
    ;;
    # 任何吻合，默认情况
    *) echo "$REPLY 默认情况" ;;
    esac
done