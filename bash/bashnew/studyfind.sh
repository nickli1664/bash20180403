#!/bin/bash

find . -print                  #打印从制定目录向下的所有文件文件夹列表，  . 为当前目录

find . -name "*.txt" -print    #-name 通配符    -iname忽略大小写

find . \( -name "*.txt" -o -name "*.pdf" \) -print       #匹配多个条件

echo ---------------------

find /home -path "*/bash/*" -print                       #-path 匹配文件路径   -regex 正则表达式

echo --------------------


find . -regex ".*\(\.py\|\.sh\)$"                        #匹配.py或.sh文件 -iregex忽略大小写

echo --------------------


find .. -maxdepth 1 -name "*.sh" -print            #搜索目录最大深度为1   -mindepth最小深度  这个参数应该作为第3个参数或更靠前，这样较为有效率

echo -------------------

find .. -type d -print                         #以文件类型查找，d为目录

echo -------------------

find . -type f -atime -7 -print                #打印出在最近7天内被访问过的所有文件 相似的还有  -ctime -mtime -amin -mmin -cmin

echo -------------------

find . -type f -newer out2.txt -print          #找出比out2.txt修改时间更近的所有文件

echo ----------size---------

find . -type f -size +2k                       #大于2k的文件  这个地方感觉不准

#find . -type f -name "*.swp" -delete          #删除文件

find . -type f -perm 644 -print                #打印权限为644的文件

find . -type f -name "*.php" ! -perm 644 -print   #打印权限不为644的php文件

echo -------------------------


find . -type f -user nickli -print              #打印出用户nickli拥有的所有文件

echo -------------------------

# find . -type f -user root -exec chown slynux {} \;   #将用户从root修改为slynux

#find . -type f -name "*.c" -exec cat {} \;>all_c_files.txt      #将所有C程序文件拼接起来写入单个文件all_c_files.txt   这里使用>而不是>>的原因，在于find只输出一个数据流

#find . -type f -mtime +10 -name "*.txt" -exec cp {} OLD \;      #将10天前的 .txt文件复制到OLD目录中

#-exec只能跟单个命令，若想使用多命令，可以把多命令写到一个sh中然后  -exec ./commands.sh {} \;

find . -type f -name "*.txt" -exec printf "Text file: %s\n" {} \;

echo -----------------------

find . \( -name "studyscript" -prune \) -o \( -type f -print \)   #跳过特定的目录