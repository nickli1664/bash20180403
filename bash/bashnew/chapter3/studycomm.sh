#!/bin/bash

#comm 求文件的交集、求差、差集

#文件必须先排序

sort A.txt -o A.txt ; sort B.txt -o B.txt

comm A.txt B.txt

echo ----------------

comm A.txt B.txt -1 -2         #只打印交集

echo ----------------

comm A.txt B.txt -3            #打印不同的行

echo ----------------

comm A.txt B.txt -3 | sed 's/^\t//'      #删除空格（\t）  实现求差

echo ----------------

comm A.txt B.txt -2 -3         #A.txt的差集


