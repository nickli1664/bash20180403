#!/bin/bash

#last 命令用来列出系统中有关用户登录会话的细节。这些会话数据被存储在/var/log/wtmp文件中。
#通过分别累计各用户的会话时间,就能得出他们的总使用时间。


log=/var/log/wtmp
if [[ -n $1 ]];
then
  log=$1
fi

printf "%-4s %-10s %-10s %-6s %-8s\n" "Rank" "User" "Start" "Logins" "Usage hours"
last -f $log | head -n -2 > /tmp/ulog.$$                             #这里用gedit打开会出错，这个log文件只能使用last打开，然后去掉最后两行

cat /tmp/ulog.$$ | cut -d ' ' -f 1 | sort | uniq> /tmp/users.$$      

#cut以制表符为分隔符，-f 只抓取第一列
#line16抓出所有的用户

(
while read user;
do
  #echo $user
  grep ^$user /tmp/ulog.$$ > /tmp/user.$$
  #cat /tmp/user.$$
  minutes=0
  
  #cat /tmp/user.$$ | awk '{ print $NF }' | tr -d ')('             #这里很巧妙，相当于打印了最后一个字段的内容（时间？），然后去掉小括号

  while read t
  do
    #s=$(echo $t | awk -F: '{ print ($1 * 60) + $2 }')              #这个地方的计算有可能是错的，除非每个用户登录的时间不超过一天
    s=$(echo $t | awk -F '[+:]' '{ if(NF==2){print ($1 * 60) + $2 }else {print ($1 * 24 * 60) + ($2 * 60) + $3 } }')     #这里考虑超过一天（包含小时）的情况，实在令人头大
    #echo $s
    let minutes=minutes+s
  done < <(cat /tmp/user.$$ | awk '{ print $NF }' | tr -d ')(')
  
  #firstlog=$(tail -n 1 /tmp/user.$$ | awk '{ print $5,$6 }')         #这个$5$6同样存在问题
  firstlog=$(tail -n 1 /tmp/user.$$ | awk '{ print $((NF-5)),$((NF-4))}')
  nlogins=$(cat /tmp/user.$$ | wc -l)                                        #统计行数，即登录次数
  hours=$(echo "$minutes / 60.0" | bc)
  printf "%-10s %-10s %-6s %-8s\n" $user "$firstlog" $nlogins $hours
done < /tmp/users.$$
) | sort -nrk 4 | awk '{ printf("%-4s %s\n", NR, $0) }'                     #在原本的内容前加入行号



rm /tmp/users.$$ /tmp/user.$$ /tmp/ulog.$$
