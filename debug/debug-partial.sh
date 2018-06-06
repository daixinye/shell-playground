# /bin/bash

number=1

set -x # 开启追踪 turn on tracking

if test $number -eq 1;then
    echo "number is equal to 1"
else
    echo "number is not equal to 1"
fi

set +x # 关闭追踪 turn off tracking