#!/bin/bash

#创建符号链接
#ln -s target symbolic_link_name

ln -s /var/tmp web

echo ------------

ls -l web

#ls -l | grep "^l"        #打印出当前目录下的符号链接

echo ------------

find . -type l -print     #使用 find 打印当前目录以及子目录下的符号链接

echo ------------

readlink web              #打印出符号链接所指向的目标路径

#在查找当前目录下的符号链接时, grep 对 ls -l 的输出进行过滤,使用 ^ 显示那些以 l 起始的行,^是字符串的起始标记。