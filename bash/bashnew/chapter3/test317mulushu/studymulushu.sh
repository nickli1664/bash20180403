#!/bin/bash

tree ..

echo "------------"

tree .. -P "*.sh"                      #只列出匹配文件

echo "------------"

tree .. -I "*.sh"                      #只列出通配之外的文件

echo "------------"

tree .. -h

echo "------------"

tree .. -H http://localhost -o out.html                 #将目录生成输出为html，这里可在-H 后面用httpserver替换