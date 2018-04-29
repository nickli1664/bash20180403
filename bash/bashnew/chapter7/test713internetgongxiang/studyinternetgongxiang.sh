#!/bin/bash


#使用 iptables 设置网络地址转换(Network Address Translation,NAT)
#使用 iwconfig 命令来获得无线接口的名称
#假设通过 eth0 连接到互联网

#使用发布版自带的网络管理工具,创建一个adhoc无线连接
#IP地址:10.99.66.55
#子网掩码:255.255.0.0(16)


echo 1 > /proc/sys/net/ipv4/ip_forward
#如果上述文件中的值为0,说明禁止进行IP转发；如果是1,则说明IP转发功能已经打开。具体可搜索linux ip转发功能。
iptables -A FORWARD -i $1 -o $2 -s 10.99.0.0/16 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A POSTROUTING -t nat -j MASQUERADE

# -A 添加一条规则
#参考 http://man.linuxde.net/iptables  当然这个写的也很基础

#./netsharing.sh eth0 wlan0
#其中, eth0 是连接到互联网的接口, wlan0 是用于共享互联网连接的无线接口
#这里没有讲iptables命令，所以也没有测试。


#可以使用dnsmasq 来进行DHCP和DNS操作

