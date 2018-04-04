#!/bin/bash


echo 'Text through stdin' | cat - out2.txt   #将标准输入与文件内容拼接在一起。代码中, - 被作为 stdin 文本的文件名。


cat -s multi_blanks.txt                      #将多行空白行变为一行

#cat -T file.py                              #将制表符显示为 ^|   这一功能可能将制表符与空格区分

cat -n out2.txt                              #显示行号