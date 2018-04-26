#!/bin/bash

ping www.baidu.com -c 4                  #限制发送的分组数量

echo $?                                  #ping 命令如果执行顺利,会返回退出状态0;否则,返回非0。

echo "--------"


traceroute www.baidu.com                 #显示分组途径的所有网关的地址。需要经过多少跳(hop)。 #实测并不好用

#新的命令 mtr


