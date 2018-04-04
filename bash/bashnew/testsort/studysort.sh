#!/bin/bash

sort -nrk 1 data.txt      #-nr表明按照数字,采用逆序形式排序 k 表示第一列

echo ----------------

sort -k 2 data.txt       #依据第2列排序（字母）

echo ----------------

sort -nk 3,4 data2.txt   #依据起止位置2和3为键值   感觉这里有bug？

echo ----------------

sort -nk 1,1 data2.txt   #依据起止位置1为键值

echo ----------------

sort -z data.txt | xargs -0    # 终止符\0用来保证xargs命令的使用安全          #这里感觉根本没有排序，不理解

#sort -bd unsorted.txt         # -b 用于忽略文件中的前导空白行,选项 -d 用于指明以字典序进行排序。