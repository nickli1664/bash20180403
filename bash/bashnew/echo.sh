#!/bin/bash

echo -e "1\t2\t3"                              # -e 包含转义序列的字符串

echo -e "\e[1;31m This is \e[0mred text "

echo -e "\e[1;42m Green Background \e[0m"

echo $PATH

export PATH="$PATH:/home/nickli/bin"           #临时地修改环境变量

echo $PATH

echo $SHELL


if [ $UID -ne 0 ]; then
echo Non root user. Please run as root.
else
echo Root user
fi