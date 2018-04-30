#!/bin/bash

uname -n               #系统的主机名
#hostname  #同上

echo '--------'

uname -a               #Linux内核版本、硬件架构等详细信息
echo '--------'
uname -r               #内核发行版本
echo '--------'
uname -m               #打印主机类型
echo '--------'
cat /proc/cpuinfo      #打印CPU相关信息
echo '--------'
cat /proc/cpuinfo | sed -n 5p          #cpuinfo 的第5行包含处理器的名称。
#cat /proc/cpuinfo | awk '{ if (NR==5){print $0}}'

echo '--------'
cat /proc/meminfo                      #内存的详细信息
echo '--------'
cat /proc/meminfo | head -1            #可用内存总量
echo '--------'
cat /proc/partitions                   #系统的分区信息
#fdisk -l                              #可能需要root，实测这个运行会很慢甚至卡住，有BUG？
echo "--------"
lshw                                   #系统的详细信息，建议用root



