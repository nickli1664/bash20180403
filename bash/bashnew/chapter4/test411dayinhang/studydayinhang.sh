#!/bin/bash

#awk来实现

#打印
#awk 'NR==M, NR==N' filename
#cat filename | awk 'NR==M, NR==N'

seq 100 | awk 'NR==4,NR==6'

echo "--------"

#印处于 start_pattern 与 end_pattern 之间的文本
#awk '/start_pattern/, /end _pattern/' filename

awk '/pa.*3/, /end/' section.txt

#这里的样式使用正则表达式
