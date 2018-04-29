#!/bin/bash

#监视远程系统的磁盘使用情况

logfile="diskusage.log"
if [[ -n $1 ]]
then
  logfile=$1
fi

if [ ! -e $logfile ]
then
  printf "%-8s %-14s %-9s %-8s %-6s %-6s %-6s %s\n" "Date" "IP address" "Device" "Capacity" "Used" "Free" "Percent" "Status" > $logfile
fi

IP_LIST="192.168.0.6"

(
for ip in $IP_LIST;
do
#slynux是用户名,可以按照实际情况进行修改
  ssh testnick1@$ip 'df -H' | grep ^/dev/ > /tmp/$$.df          #获取磁盘剩余空间

  while read line;
  do
    cur_date=$(date +%D)                     #显示 月/日/年
    printf "%-8s %-14s " $cur_date $ip
    echo $line | awk '{ printf("%-9s %-8s %-6s %-6s %-8s",$1,$2,$3,$4,$5); }'

    pusg=$(echo $line | egrep -o "[0-9]+%")         #抓取百分比
    pusg=${pusg/\%/};                               #去掉百分号
    if [ $pusg -lt 80 ];
    then
      echo SAFE
    else
      echo ALERT
    fi
  done < /tmp/$$.df
done
) >> $logfile



