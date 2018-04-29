#!/bin/bash

#主要使用iotop命令

#iotop -o                 #只显示出那些正在进行I/O活动的进程

iotop -b -n 2
#打印出两次统计数据,然后退出


#iotop -p PID              #监视特定进程

#iotop –p 'pidof cp'      #使用 pidof 命令，先获取pid

