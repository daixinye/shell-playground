#! /bin/bash

a=test

echo "$a"
echo "$a_file"
echo "${a}_file"

# 空变量扩展
empty=
# 替代
echo ${empty:-"word"}
echo $empty
# 替代并赋值
echo ${empty:="word"}
echo $empty
# 非空替代
empty=word
echo ${empty:+"another word"}
# 输出标准错误
empty=
# echo ${empty:?"message"}

# 返回变量名
var1=
var2=
var3=
echo ${!v*}
echo ${!v@}