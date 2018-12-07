#!/bin/bash

myname=
# 设置了默认值但是并没有给 myname 赋值
echo "Your name is : ${myname:-daixinye} "
echo "${myname}"

# 设置默认值同时给 myname 赋值
echo "Your name is : ${myname:=daixinye}"
echo "${myname}"