#!/bin/bash

#ps -f            #显示运行在当前终端(TTY)中的进程。 -f 表示full

#ps -e            #获取运行在系统中的每个进程
#ps -ax           #类似上一条

#ps -o   显示所需要的输出列
#ps [OTHER OPTIONS] -o parameter1,parameter2,parameter3 ..

ps -eo comm,pcpu | head
#comm 表示COMMAND, pcpu 表示CPU占用率

echo '--------'

#用 --sort 将 ps 命令的输出根据特定的列进行排序。在参数前加上 + (升序)或 - (降序)来指定排序方式
#ps [OPTIONS] --sort -paramter1,+parameter2,parameter3..

ps -eo comm,pcpu --sort -pcpu | head            #列出占用CPU最多的10个进程

echo '--------'

ps -eo comm,pid,pcpu,pmem | grep bash           #搭配grep

echo '--------'

#假设某个命令有多个实例正在运行,我们可能需要识别这些进程的PID。该信息可以使用 ps或 pgrep 命令得到
#ps -C COMMAND_NAME 或  ps -C COMMAND_NAME -o pid=      这里 “=” 的意思是移除“列名”，对比一下即可看出。注意=前不能有空格

ps -C bash -o pid=

echo '--------'

pgrep bash

#pgrep 只需要命令名的一部分作为输入参数来提取Bash命令,诸如 pgrepash 或 pgrep bas 都能够奏效。但是 ps 需要你输入命令准确的全名。

echo '--------'

pgrep bash -d ":"              #指定:为界定符

echo '--------'

pgrep -u root,nickli bash      #指定进程的用户(拥有者)列表

echo '--------'

pgrep -c bash                  #返回数量

echo '--------'

#根据真实用户或ID以及有效用户或ID过滤 ps 输出

ps -u root -U root -o user,pcpu
#该命令会显示以 root 作为有效用户ID和真实用户ID的所有进程,以及用户、CPU占用率列。
#在大多数情况下, -o 都是和 -e 结合成 -eo 的形式。但是当使用过滤器的时候,-o 应该像上面那样单独使用。

echo '--------'

#用TTY过滤 ps 输出

ps -t tty7

echo '--------'

#进程线程的相关信息
ps -eLf --sort -nlwp | head
#选项 –L 在 ps 输出中显示线程的相关信息
#NLWP是进程的线程数量,NLP是 ps 输出中每个条目的线程ID

echo '--------'

#指定输出宽度以及所要显示的列
ps -ef 
#ps -e u 
#ps -e w

echo '--------'

#显示进程的环境变量
#ps -eo cmd e
ps -eo pid,cmd e | tail -n 3 #|grep 964

echo '--------'

#which 、 whereis 、 file 、 whatis 与平均负载

#which 命令用来找出某个命令的位置
which ls

echo '--------'

#不仅返回命令的路径,还能够打印出其对应的命令手册的位置以及命令源代码的路径(如果有的话)。
whereis ls

echo '--------'

#命令会打印出与该文件类型相关的细节信息
file /bin/ls

echo '--------'

#命令会输出作为参数的命令的简短描述信息
whatis ls   

echo '--------'
#有时候我们需要搜索和某个单词相关的命令是否存在。那么可以搜索包含该字符串命令的手册页。
apropos ssh

echo '--------'

#平均负载 指明了系统中可运行进程总量的平均值

uptime
#第一个值指明了1分钟内的平均值,第二个值指明了5分钟内的平均值,第三个值指明了15分钟内的平均值。






