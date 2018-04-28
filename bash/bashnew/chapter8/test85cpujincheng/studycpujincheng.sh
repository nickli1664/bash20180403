#!/bin/bash

#使用ps命令

SECS=3600
UNIT_TIME=60
#将SECS更改成需要进行监视的总秒数
#UNIT_TIME是取样的时间间隔,单位是秒
STEPS=$(( $SECS / $UNIT_TIME ))
echo Watching CPU usage... ;
for ((i=0;i<STEPS;i++))                                  #双括号结构 扩展了for，while,if条件测试运算
do
  ps -eo comm,pcpu | tail -n +2 >> /tmp/cpu_usage.$$             
  #comm 表示命令名(command name),pcpu 表示CPU使用率(CUP usage in percent)。该命令输出所有进程名及CPU使用率。每个进程对应一行输出。
  #tail -n +2 截取内容，从第2行开始输出
  sleep $UNIT_TIME
done
echo
echo CPU eaters :
cat /tmp/cpu_usage.$$ | \
awk ' { process[$1]+=$2; }                                             
END{
for(i in process)
{
printf("%-20s %s\n",i, process[i]) ;
}
}' | sort -nrk 2 | head

rm /tmp/cpu_usage.$$                     #删除临时日志文件


#line21   生成进程为索引的关联数组，累加占用率
#line23   迭代关联数组的索引，依次打印索引和值
#line25   左对齐，宽度为20的字符串


