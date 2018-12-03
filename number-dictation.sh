#! /bin/bash
echo -n "Please input the range of numbers: "
# 输入我们想要练习的数值范围，注意这个范围是左闭右开的，即[min,max)
read min max
diff=$(($max-$min))
last=0

while [ true ]; do
    que=$(($RANDOM%$diff+$min)) # 随机选择给定范围中的一个数字

    # 如果跟上一个数字重复，则重新选择
    while [[ $que == $last ]]; do
        que=$(($RANDOM%$diff+$min))
        echo $last $que
    done
    last=$que

    say $que # 念出这个数字
    echo -n 'Input the number you just heard: '
    read ans # 输入答案
    until [[ $que = $ans ]]; do # 直到答案是正确的之前，都重复念同一个数字
        echo "❌"
        echo -n "Try again: "
        say $que
        read ans # 再次输入答案
    done
    echo "✅" # 答案正确，进入下一个循环
done