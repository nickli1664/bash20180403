#!/bin/bash

#显示第2列和第3列
#cut -f 2,3 filename


cut -f 2,4 student_data.txt    

echo "-----------------"

#注意这里有大坑。cut （-d）默认以“制表符”作为分隔标准，与空格不同。在不同文本编辑器中可能需要额外设置。例如VSCODE需要额外设置。
#以下命令可以看出一段空格到底是由若干个空格组成的还是由一个制表符组成的 \t 为制表符
sed -n l student_data.txt 

echo "-----------------"

cut -f 3 --complement student_data.txt           #取补集，打印出除第3列之外的所有列

echo "-----------------"

cut -f 2 -d ";" delimited_data.txt               #指定-d分隔符

echo "-----------------"

#指定字段的字符或字节范围

#N- 从第N个字节,字符或字段到行尾
#N-M 从第N个字节,字符或字段到第M个(包括第M个在内)字节、字符或字段
#-M 第1个字节,字符或字段到第M个(包括第M个在内)字节、字符或字段

#-b 表示字节;
#-c 表示字符;
#-f 用于定义字段。
cut range_fields.txt -c -2                       #打印前2个字符

echo "-----------------"

cut range_fields.txt -c 1-5                      #打印1-5字符

echo "-----------------"

#当用 -b 或 -c 提取多个字段时,必须使用 --output-delimiter ,否则,你就没法区分不同的字段了。

cut range_fields.txt -c 1-3,6-9 --output-delimiter ","

