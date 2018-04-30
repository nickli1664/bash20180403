#!/bin/bash

#在类Unix环境中与进程相关的一个重要概念就是信号。
#信号是一种进程间通信机制,它用来中断运行中的进程以执行某些操作。终止程序也是通过使用信号技术来实现的。

#kill 命令可用来向进程发送信号,而 trap命令用来处理所接收的信号。

kill -l      #打印出信号编号(signal number)以及对应的信号名称

#终止进程
#kill PROCESS_ID_LIST
#kill 命令默认发出一个 TERM 信号。进程ID列表使用空格作为进程ID之间的定界符。

#通过 kill 命令向进程发送指定的信号
#kill -s SIGNAL PID
#参数 SIGNAL 要么是信号名称,要么是信号编号

<<comment
SIGHUP 1 ——对控制进程或终端的终结进行挂起检测(hangup detection)。
SIGINT 2 ——当按下Ctrl + C时发送该信号。
SIGKILL 9 ——用于强行杀死进程。
SIGTERM 15 ——默认用于终止进程。
SIGTSTP 20 ——当按下Ctrl + Z时发送该信号。
comment

#例如强行杀死进程
#kill -s SIGKILL PROCESS_ID
#kill -9 PROCESS_ID              #同上



#killall 命令通过命令名终止进程
#killall process_name

#killall -s SIGNAL process_name
#killall -9 process_name

#通过名称以及所属用户名指定进程
#killall -u USERNAME process_name
#如果需要在杀死进程前进行确认,可以使用 killall 的 -i 选项。


#pkill process_name
#pkill -s SIGNAL process_name           #SIGNAL 是信号编号。 pkill 不支持信号名称。




