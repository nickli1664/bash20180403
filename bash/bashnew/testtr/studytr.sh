#!/bin/bash

echo "HELLO WHO IS THIS" | tr 'A-Z' 'a-z'        #字符串转为小写

echo --------------------

echo 12345 | tr '0-9' '9876543210'             #加密

echo 87654 | tr '9876543210' '0-9'             #解密

echo --------------------

echo "tr came, tr saw, tr conquered." | tr 'a-zA-Z' 'n-za-mN-ZA-M'   #ROT13算法

echo "ge pnzr, ge fnj, ge pbadhrerq." | tr 'a-zA-Z' 'n-za-mN-ZA-M'

#tr '\t' ' ' < file.txt                          #将制表符转换为空格

echo --------------------

echo "Hello 123 world 456" | tr -d '0-9'         # -d 删除指定字符

echo --------------------

echo hello 1 char 2 next 4 | tr -d -c '0-9 \n'   #-c 为指定补集  删除不在‘0-9 \n’之外的所有字符

echo --------------------

echo "GNU is    not        UNIX. Recursive     right ?" | tr -s ' '     #压缩指定字符

echo -------------------

cat sum.txt | echo $[ $(tr '\n' '+' ) 0 ]                 #读取数字并相加，感觉限制较多

cat multi_blanks.txt | tr -s '\n'                         #压缩多余的换行符