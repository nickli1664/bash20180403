#!/bin/bash

#基础功能是将标准输入转为命令行参数

cat example.txt | xargs   #将换行替换为空格

echo --------------------

cat example.txt | xargs -n 3   #将单行转为多行         xargs 采用内部字段分隔符(空格)作为输入定界符

echo "splitXsplitXsplitXsplit" | xargs -d X -n 2     #-d指定定界符

cat args.txt | xargs -n 1 ./cecho.sh                 #每次使用一个参数

cat args.txt | xargs ./cecho.sh                      #一次性提供所有的命令参数

echo ---------------------

cat args.txt | xargs -I {} ./cecho.sh -p {} -l       #利用-I实现默认参数 指定了替换字符串，对于每一个命令参数,字符串 {} 都会被从 stdin 读取到的参数替换掉
#使用-I的时候，命令以循环方式执行。个人理解为强制每次只接收一个参数，即无法与-n混用

echo ---------------------

find . -type f -name "*.txt" -print0 | xargs -0 -n 1 ./cecho.sh  #xargs -0 将\ 0 作为输入定界符   -print0 指明使用 '\0' 作为匹配的文件名之间的定界符

echo ---------------------

find . -type f -name "*.sh" -print0 | xargs -0 wc -l   #统计所有sh文件的行数，注意这里将所有参数一次传入，这样可以统计总和。

echo ---------------------

cat example.txt | ( while read arg; do cat $arg; done )   #可以将 cat $arg 替换成任意数量的命令
# 等同于cat example.txt | xargs -I {} cat {}