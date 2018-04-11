#!/bin/bash
# 文件名: silent_grep.sh
# 用途: 测试文件是否包含特定的文本内容


if [ $# -ne 2 ]; then
    echo "Usage: $0 match_text filename"
    exit 1
fi
match_text=$1
filename=$2

grep -q "$match_text" $filename                      #静默模式，不输出任何内容。如果命令运行成功会返回0,如果失败则返回非0值。

if [ $? -eq 0 ]; then
    echo "The text exists in the file"
else
    echo "Text does not exist in the file"
fi