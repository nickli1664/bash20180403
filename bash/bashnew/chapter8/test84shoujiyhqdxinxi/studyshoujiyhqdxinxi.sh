#!/bin/bash

#主要命令: who 、 w 、 users 、 uptime 、 last 和 lastb 。

who                      #获取当前登录用户的相关信息

echo '--------'

w                        #有关登录用户更详细的信息

echo '--------'

users                    #前登录主机的用户列表

echo '--------'

#看系统已经加电运行了多长时间 uptime
uptime | grep -Po '\d{2}\:\d{2}\:\d{2}'              #利用 grep 和 perl 风格的正则表达式来提取由冒号分隔的3组两位数字。
uptime | egrep -o '[0-9]{2}:[0-9]{2}:[0-9]{2}'       #nick parse

echo '--------'

#取上一次启动以及用户登录会话的信息
last

echo '----'
#last 命令以日志文件/var/log/wtmp作为输入日志数据。它也可以用选项 -f 明确地指定日志文件。
#last -f /var/log/wtmp

#获取单个用户登录会话的信息
last nickli

echo '----'

#获取失败的用户登录会话信息
lastb                   #这条必需要root用户



