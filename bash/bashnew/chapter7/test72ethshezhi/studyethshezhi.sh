#!/bin/bash

#基本命令ifconfig（需要root）

#ifconfig wlan0 192.168.0.80 netmask 255.255.255.0        #设置IP地址的子网掩码

#dhclient eth0                                            #自动（dhcp）

ifconfig | cut -c-10 | tr -d ' ' | tr -s '\n'             #打印系统可用的网络接口列表
#ifconfig 输出的前10个字符是用于保留打印网络接口的名称,因此我们用 cut 命令提取每一行的前10个字符。 tr -d ' ' 删除每一行的所有空格。用 tr -s '\n' 压缩重复的换行符生成接口名称列表。

echo "--------"

ifconfig enp0s31f6

ifconfig enp0s31f6 | egrep -o "inet addr:[^ ]*" | egrep -o "[0-9.]*"                         #抓取ip地址

echo "--------"

#硬件地址欺骗
#ifconfig eth0 hw ether 00:1c:bf:87:25:d5                                                    #注意,这在机器重启之后就失效了。

#DNS
#echo nameserver IP_ADDRESS >> /etc/resolv.conf                        #手动添加dns服务器

#DNS查找(我理解为查找一个域名对应的所有ip地址)

host www.baidu.com

echo "--------"

nslookup www.baidu.com

echo "--------"

#可以为IP地址手动添加符号名（类似于Windows修改hosts）
# echo 192.168.0.9 backupserver >> /etc/hosts
#添加了条目之后,任何时候解析 backupserver ,都会返回192.168.0.9

#显示路由表信息
#操作系统维护着一个叫做路由表的表格,它包含了关于分组如何转发以及通过网络中的哪些节点转发的信息。

route
route -n                     #以数字形式的IP地址显示每一个条目;否则,如果IP地址具有对应的DNS条目,就会显示符号形式的主机名。

#设置默认网关
#route add default gw 192.168.0.1 wlan0

