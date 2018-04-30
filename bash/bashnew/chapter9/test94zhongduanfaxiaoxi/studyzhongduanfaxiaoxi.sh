#!/bin/bash

#wall 命令用来向当前所有登录用户的终端写入消息。

#cat message | wall
#wall< message

#这个wall命令实测没有效果 20180430nick

#mesg y          #允许写入消息
#mesg n          #禁止写入消息

#若发送者是root，则消息肯定会显示

USERNAME=$1
devices=`ls /dev/pts/* -l | awk '{ print $3,$10 }' | grep $USERNAME | awk '{ print $2 }'`
for dev in $devices;
do
  cat /dev/stdin > $dev            #/dev/stdin包含传递给当前进程的标准输入数据
done

#测试方法
#./studyzhongduanfaxiaoxi.sh nickli < message.txt


