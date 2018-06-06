#! /bin/bash

# 使用 桩 stub 来检查程序流程的内容
# 显示要执行的命令，不进行实际操作

dir_name='./'

if [ -d "$dir_name" ]; then
    echo rm ./ # TESTING
else
    echo "no such directory : $dir_name"
fi
exit # TESTING