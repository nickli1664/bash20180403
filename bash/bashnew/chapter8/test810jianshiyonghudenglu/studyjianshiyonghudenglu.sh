#!/bin/bash

#用途:入侵报告工具,以auth.log作为日志文件

AUTHLOG=/var/log/auth.log

if [[ -n $1 ]];                         #这里要注意双中括号和单中括号的区别
then
  AUTHLOG=$1
  echo 'Using log file: $1'
fi

LOG=/tmp/valid.$$.log
grep -v "invalid" $AUTHLOG > $LOG                     #这里排除非法用户登录 -v 反转
users=$(grep "Failed password" $LOG | awk '{ print $(NF-5) }' | sort | uniq)      
#NF 返回最后一个单词的列号,因此 NF -5 就是倒数第6个单词的列号。我们再用 sort 和 uniq 生成一个没有重复的用户列表。

printf "%-5s|%-10s|%-10s|%-13s|%-33s|%s\n" "Sr#" "User" "Attempts" "IP address" "Host_Mapping" "Time range"

ucount=0;

ip_list="$(egrep -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" $LOG | sort | uniq)"

for ip in $ip_list;
do
  grep $ip $LOG > /tmp/temp.$$.log
  for user in $users;
  do
    grep $user /tmp/temp.$$.log> /tmp/$$.log
    cut -c-16 /tmp/$$.log > $$.time
    tstart=$(head -1 $$.time);
    start=$(date -d "$tstart" "+%s");
    tend=$(tail -1 $$.time);
    end=$(date -d "$tend" "+%s")
    limit=$(( $end - $start ))
    if [ $limit -gt 120 ];
    then
      let ucount++;
      IP=$(egrep -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" /tmp/$$.log | head -1 );
      TIME_RANGE="$tstart-->$tend"
      ATTEMPTS=$(cat /tmp/$$.log|wc -l);
      HOST=$(host $IP | awk '{ print $NF }' )
      printf "%-5s|%-10s|%-10s|%-10s|%-33s|%-s\n" "$ucount" "$user" "$ATTEMPTS" "$IP" "$HOST" "$TIME_RANGE";
    fi
  done
done

rm /tmp/valid.$$.log /tmp/$$.log $$.time /tmp/temp.$$.log #2>/dev/null

#这个例子没有经过详细验证


