#!/bin/bash

#系统运行时间监视器
#uptime 命令可以用来显示系统加电后运行了多久。


IP_LIST="192.168.0.6"
USER="nickli"
for IP in $IP_LIST;
do
  utime=$(ssh $USER@$IP "uptime" | awk '{ print $3 }' )
  echo $IP uptime: $utime
done

echo "--------"
#SSH的压缩功能
#SSH协议也支持对数据进行压缩传输。当带宽有限时,这一功能很方便。用 ssh 命令的选项 -C 启用这一功能:
#ssh -C user@hostname COMMANDS

#将数据重定向至远程shell命令的 stdin
echo 'text' | ssh nickli@192.168.0.6 'echo'
#将文件中的数据进行重定向
#ssh user@remote_host 'echo' < file
#在 远程主机上, echo 打印出通过 stdin 接收到的数据,但这些数据却是从本地主机传递到远程shell的 stdin 中的。
#这里实测没有看出效果，待验证 nick20180426


#在远程主机中执行图形化命令
#如果你打算使用刚才介绍过的方法来运行一些需要显示某种形式的GUI的命令,就会碰上类似于“无法显示”之类的错误。
#这是因为ssh shell无法连接到远程主机上的X服务器。对此,你需要像这样设置变量 $DISPLAY

# ssh user@host "export DISPLAY=:0 ; command1; command2"

#如果你想在本地主机上也显示图形化输出,使用SSH的X11转发选项(forwarding option)
#ssh -X user@host "command1; command2"
#该命令会在远程主机上执行,但图形化输出会显示在本地主机上。
#这里更没有看懂，也没有例子，待验证 nick20180426


