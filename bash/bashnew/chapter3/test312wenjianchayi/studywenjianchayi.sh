#!/bin/bash

diff version1.txt version2.txt

echo "---------------------------"

diff -u version1.txt version2.txt                         #一体化形式的 diff 输出

diff -u version1.txt version2.txt > version.patch         #生成修补文件

#patch -p1 version1.txt < version.patch                   #进行修补

#patch -p1 version1.txt < version.patch                   #撤销修补


#以递归方式处理目录

#diff -Naur directory1 directory2

# -N :将所有缺失的文件视为空文件。
# -a :将所有文件视为文本文件。
# -u :生成一体化输出。
# -r :遍历目录下的所有文件。