#!/bin/bash

md5sum multi_blanks.txt

md5sum multi_blanks.txt > file_sum.md5

#md5sum -c file_sum.md5       #利用这条命令核实数据完整性，将md5文件和被测文件放在同一目录下即可

#sha1sum同理，记住 将 输 入文件 名 从file_sum.md5改为file_sum.sha1

echo ----------------------------

#md5deep -rl directory_path > directory.md5
# -r使用递归的方式
# -l使用相对路径。默认情况下,md5deep会输出文件的绝对路径

find ../testtr -type f -print0 | xargs -0 md5sum > directory.md5            #利用find计算路径所有文件的MD5

md5sum -c directory.md5