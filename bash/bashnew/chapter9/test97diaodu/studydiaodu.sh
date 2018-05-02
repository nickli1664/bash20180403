#!/bin/bash


#利用cron


#每天中每小时的第2分钟执行脚本test.sh
#02 * * * * /home/slynux/test.sh

#在每天的第5、6、7小时执行脚本
#00 5,6,7 * * /home/slynux/test.sh

#在周日的每个小时执行脚本script.sh（？？？？）
#00 */12 * * 0 /home/slynux/script.sh

#在每天凌晨2点关闭计算机
#00 02 * * * /sbin/shutdown -h


#crontab -e             #使用选项 -e 来编辑 cron 表


#在脚本中调用 crontab 进行任务调度
#1. 创建一个文本文件(例如task.cron),并写入 cron 作业。将文件名作为命令参数,运行 crontab   
#  crontab task.cron
#2. 在行内(inline)指定 cron 作业,而无需创建单独的文件。
#crontab<<EOF
#02 * * * * /home/slynux/script.sh
#EOF


#指定环境变量

<<comment
crontab<<EOF
http_proxy=http://192.168.0.3:3128
00 * * * * /home/slynux/download.sh
EOF
comment


#在系统启动时运行命令

#@reboot command


#查看 cron 表
crontab -l

crontab -l -u nickli

#删除 cron 表
#crontab -r                #删除当前用户的 cron 表
#crontab -u slynux -r      #




