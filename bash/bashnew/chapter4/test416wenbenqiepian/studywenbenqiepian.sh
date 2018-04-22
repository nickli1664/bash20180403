#!/bin/bash

var="This is a line of text"
echo ${var/line/REPLACED}         #替换变量中的文本

echo "--------"

#通过指定字符串的起始位置和长度来生成子串
#${variable_name:start_position:length}

string=abcdefghijklmnopqrstuvwxyz
echo ${string:4}
echo ${string:4:8}

#起始字符的索引从0开始计数。我们也可以从后向前计数,将最后一个字符索引记为 -1 。
#但如果使用负数作为索引值,则必须将负数放入括号内。 (-1) 就是最后一个字符的索引。
echo ${string:(-1)}
echo ${string:(-2):2}

#这个地方的处理方式与python类似
