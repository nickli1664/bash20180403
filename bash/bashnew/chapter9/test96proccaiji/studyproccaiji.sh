#!/bin/bash

#主要简介/proc目录下的一些文件

#每一个运行的进程在 /proc 中都有一个对应的目录。目录名和进程ID相同
#例如，bash的pid是4295，那么存在文件cat /proc/4295/environ

#environ :包含与进程相关的环境变量。使用 cat /proc/4295/environ ,可以显示所有传递给该进程的环境变量。
#cwd: 是一个到进程工作目录(working directory)的符号链接。
#exe :是一个到当前进程所对应的可执行文件的符号链接。
#fd :包含了进程所使用的文件描述符。

id1=`ps -e | grep bash | awk 'NR==1 {print $1}'`
#echo $id1
readlink /proc/$id1/exe
echo '--------'
readlink /proc/$id1/cwd


