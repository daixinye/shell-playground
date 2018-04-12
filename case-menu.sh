#!/bin/bash

clear
echo "
Please Select:

1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
0. Quit
"

read -p "Enter selection [0-3] > "

case $REPLY in 
    0) echo "Program terminated"
    exit
    ;;
    1) echo "Hostname: $HOSTNAME"
    exit
    ;;
    2) df -h
    ;;
    3) du -sh $HOME
    ;;
    *) echo "Invalid entry" >&2 # 输出到标准错误中
    exit 1 # 退出状态置为1
    ;;
esac
