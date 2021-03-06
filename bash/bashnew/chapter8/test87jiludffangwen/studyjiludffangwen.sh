#!/bin/bash

#inotifywait 命令可以用来收集有关文件访问的信息。


#用途:监视目录访问
path=$1
#将目录或文件路径作为脚本参数

inotifywait -m -r -e create,move,delete $path -q

#上面的脚本记录给定了路径中文件或目录的创建、移动以及删除。
#选项 -m 表明要持续监视变化,而不是在事件发生之后退出。 -r 允许采用递归形式监视目录(忽略符号链接)。 
# -e 指定需要监视的事件列表。 -q 用于减少冗余信息,只打印出所需要的信息。
#命令输出可以被重定向到日志文件。

#其他具体事件见书中8.7节


