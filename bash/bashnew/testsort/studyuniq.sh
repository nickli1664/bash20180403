#!/bin/bash

#uniq 只能作用于排过序的数据输入,因此, uniq 要么使用管道,要么将排过序的文件作为输入,与 sort 命令结合使用。

uniq sorted.txt

#uniq的基本功能为：生成唯一的行(所谓“唯一的行”是指来自输入的所有行都会被打印出来,但是其中重复的行只会被打印一次)

echo -----------------

uniq -u sorted.txt                 #只显示唯一的行(在输入文件中没有重复出现的行)

echo -----------------

sort unsorted.txt | uniq -c        #统计各行在文件中出现的次数

echo -----------------

sort unsorted.txt | uniq -d        #找出文件中重复的行

echo -----------------

sort data3.txt | uniq -s 2 -w 2    #忽略前2个字符( -s 2 ),使用 -w 选项( -w2 )指定用于比较的最大字符数

#uniq -z file.txt                  #用 uniq 命令生成包含0值字节终止符的输出（有效输出给xargs，防止空格引起的错误）

#uniq -z file.txt | xargs -0 rm
#删除所有指定的文件,这些文件的名字是从files.txt中读取的。
#如果某个文件名在文件中出现多次, uniq 命令只会将这个文件名写入 stdout 一次