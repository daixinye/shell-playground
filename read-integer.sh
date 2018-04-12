#! /bin/bash

read -p "Please enter an integer -> " int

if [[ $int =~ ^-?[0-9]+$ ]]; then 
    # 判断是否为0
    if test $int -eq 0; then
        echo "$int is zero"
    else
        # 判断正数or负数
        if test $int -lt 0; then
            echo "$int is negative"
        else
            echo "$int is positive"
        fi
        # 判断偶数or奇数
        if test $((int % 2)) -eq 0; then
            echo "$int is even"
        else
            echo "$int is odd"
        fi
    fi
else
    echo "Input value is not an integer" >&2    
    exit 1
fi