#!/bin/bash


word=$1
grep "^$1$" /usr/share/dict/british-english -q
if [ $? -eq 0 ]; then
    echo $word is a dictionary word;
else
    echo $word is not a dictionary word;
fi

#在 grep 中, ^ 标记着单词的开始, $ 标记着单词的结束。 -q 禁止产生任何输出。