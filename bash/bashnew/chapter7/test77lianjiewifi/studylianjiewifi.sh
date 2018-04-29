#!/bin/bash

#这个例子连接WEP

#根据你的设置修改下面的参数
######### PARAMETERS ###########
IFACE=wlan0
IP_ADDR=192.168.1.5
SUBNET_MASK=255.255.255.0
GW=192.168.1.1
#HW_ADDR='00:1c:bf:87:25:d2'
#如果不想使用物理地址欺骗,把上面这一行注释掉
ESSID="homenet"
WEP_KEY=8b140b20e7
FREQ=2.462G
#################################

KEY_PART=""
if [[ -n $WEP_KEY ]];
then
  KEY_PART="key $WEP_KEY"
fi
#设置新的配置之前先关闭接口(关闭无线网络？)
/sbin/ifconfig $IFACE down
if [ $UID -ne 0 ];
then
  echo "Run as root"
exit 1;
fi
if [[ -n $HW_ADDR ]];
then
  /sbin/ifconfig $IFACE hw ether $HW_ADDR
  echo Spoofed MAC ADDRESS to $HW_ADDR
fi
/sbin/iwconfig $IFACE essid $ESSID $KEY_PART freq $FREQ
/sbin/ifconfig $IFACE $IP_ADDR netmask $SUBNET_MASK
route add default gw $GW $IFACE
echo Successfully configured $IFACE

#命令 ifconfig 、 iwconfig 和 route 必须以root用户身份运行,因此在脚本一开始要检查是否为root用户。

#iwlist scan             #扫描可用的无线网络



