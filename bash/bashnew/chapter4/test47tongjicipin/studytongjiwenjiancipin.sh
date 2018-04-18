#!/bin/bash

#解析出给定文件中出现的所有单词,然后统计每个单词的出现的次数

if [ $# -ne 1 ];
then
    echo "Usage: $0 filename";
    exit -1
fi

filename=$1

egrep -o "\b[[:alpha:]]+\b" $filename | awk '{ count[$0]++ }
END{ printf("%-14s%s\n","Word","Count") ;
for(ind in count)
{ printf("%-14s%d\n",ind,count[ind]); }
}'

#这里再次考察了egrep -o 的用法，只输出文件中匹配到的文本部分，分隔时另起一行。
#[:alpha:] 是表示字母的字符类
#注意正则表达式不要写成这样，是错的 "\b[:alpha:]+\b"
#%-14s 格式为左对齐且宽度为14的字符串代替（-表示左对齐，不使用则是右对齐）

<<comment
comment
#多行注释
