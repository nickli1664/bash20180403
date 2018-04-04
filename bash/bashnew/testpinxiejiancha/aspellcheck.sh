#!/bin/bash

word=$1

output=`echo \"$word\" | aspell list`

if [ -z $output ]; then
    echo $word is a dictionary word;
else
    echo $word is not a dictionary word;
fi

# 当给定的输入不是一个词典单词时, aspell list 命令产生输出文本,反之则不产生任何输出。 -z 用于确认 $output 是否为空。

look el aspellcheck.sh          #列出文件中以特定单词起头的所有单词

#grep "^word" filepath          #效果同上

look android                    #从默认字典查找以android开头的所有单词

