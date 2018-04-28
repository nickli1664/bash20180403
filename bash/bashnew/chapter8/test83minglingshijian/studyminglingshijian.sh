#!/bin/bash

#time 命令，在任意命令前加time

time ls /home/nickli

echo "--------"

#shell默认使用内建的time命令，功能有限。应使用/usr/bin/time

#选项 -o filename 将相关的时间统计信息写入文件
/usr/bin/time -o output1.txt ls /home/nickli

#要将命令执行时间添加到文件而不影响其原有内容,使用选项 -a 以及 -o :
#/usr/bin/time -a -o output.txt COMMAND

echo "--------"

#选项 -f ,利用格式字符串来格式化时间输出
#real: %e
#user: %U
#sys: %S
/usr/bin/time -f "Time: %U" -a -o timing.log uname

echo "--------"

#格式化输出生成后被写入标准输出,命令的执行时间信息被写入标准错误。


/usr/bin/time -f "Time: %U" uname> command_output.txt 2>time2.log    #这里如果用管道的话会无法传递stderr，存疑

echo "--------"

#使用参数 %Z 显示系统页面大小

/usr/bin/time -f "Page size: %Z bytes" ls> /dev/null                 #这个不太懂究竟是啥

