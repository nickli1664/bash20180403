#!/bin/bash

#df du为主要命令。df 是disk free的缩写, du 是disk usage的缩写。

du test82.jpg    #默认以字节作为计量单位（kb？）

echo "--------"

du -a ..         #递归地输出指定目录或多个目录中所有文件的统计结果。

#这里可以留意文件系统的底层逻辑，每个对象至少占用4kb空间

echo "--------"

du -h test82.jpg                #显示KB

echo "--------"

du -a -h ..

echo "--------"

du -c ..                        # -c 会显示total总量
#du -c *.txt

echo "--------"

du -sh /home/nickli/Downloads   # -s 只输出总量数据

echo "--------"
#用特定单位打印
# du -b FILE(s)
# 打印以KB为单位的文件大小:
# du -k FILE(s)
# 打印以MB为单位的文件大小:
# du -m FILE(s)
# 打印以指定块为单位的文件大小:
# du -B BLOCK_SIZE FILE(s)

#排除部分文件
#通配符
#du --exclude "*.txt" FILES(s)                 #排除所有的.txt文件
#排除列表
#du --exclude-from EXCLUDE.txt DIRECTORY       #EXCLUDE.txt包含了需要排除的文件列表

#统计递归深度
du --max-depth 2 /home/nickli -h

echo "--------"

#du -x       #排除挂载点的情况，例如/mnt 个人理解为这样可以避免相同内容被统计2次 nick20180427

#du -ak  /home/nickli | sort -nrk 1 | head       #sort 对第一列依数值逆序排序。 head 用来显示前10行输出。 这个方法会统计目录，不太合理

find /home/nickli -type f -exec du -k {} \; | sort -nrk 1 | head           #巧妙的方法，直接查找所有文件，不使用du -a 递归。考察find
#注意find的效率较慢，需要等待几秒

echo "--------"

df -h           #统计磁盘的可用空间信息


