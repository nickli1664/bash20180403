#!/bin/bash

#使用iptables命令
#-A 表明向链(chain)中添加一条新的规则,该规则由后续参数给出。
#OUTPUT 链可以对所有出站(outgoing)的流量进行控制


#阻塞发送到特定IP地址的流量
iptables -A OUTPUT -d 8.8.8.8 -j DROP
#-d 指定了所要匹配的分组目的地址。随后使用 -j 来使 iptables 丢弃( DROP )符合条件的分组。

#阻塞发送到特定端口的流量
#iptables -A OUTPUT -p tcp -dport 21 -j DROP
#这导致ftp不可用
#-p 指定该规则是适用于TCP, -dport 指定了对应的端口

#iptables --flush                         #清除对 iptables 链所做出的所有改动。


