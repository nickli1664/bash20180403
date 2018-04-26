#!/bin/bash

<<comment
for i in 192.168.1.{1..255};                    #灵活的迭代
do
  ping $i -c 2 >/dev/null
  if [ $? -eq 0 ];
  then
    echo $i is alive
  fi
done 
comment
#这种方式为纯串行穷举，速度极慢。仅供参考，不可取。

#使用fping
fping -a 192.168.1.0/24 -g 2> /dev/null
#fping -a 192.168.1.1 192.168.1.255 -g 2>/dev/null        #效果同上

#fping -a 192.168.0.1 192.168.0.5 192.168.0.6
#将IP地址作为参数传递
#fping -a < ip.list
#从文件中传递一组IP地址


