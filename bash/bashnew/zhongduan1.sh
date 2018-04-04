#!/bin/bash

tput cols
tput lines                  #打印终端行列数

tput longname               #打印终端名

echo

tput cup 100 100            #移动光标

#tputsetf 5                 #不好用


echo -e "Enter password: "
stty -echo                 #不显示输出
read password
stty echo                  #显示输出
echo
echo Password read. 