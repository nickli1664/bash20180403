#!/bin/bash

#统计文件的行数、单词数和字符数  命令wc

wc -l file.txt        #统计行数 感觉算的不对？少一行？

#cat file.txt | wc -l

echo "-------------"

wc -w file.txt        #统计单词数

echo "-------------"

wc -c file.txt        #统计字符数

echo "-------------"

echo -n 1234 | wc -c  #-n 用于避免 echo 添加额外的换行符。

echo "-------------"

wc file.txt

echo "-------------"

wc file.txt -L        #打印出文件中最长一行的长度