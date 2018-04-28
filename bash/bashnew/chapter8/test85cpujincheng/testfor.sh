#!/bin/bash

for ((i=1;i<10;i++))
do
  echo $i
done


SECS=3600
UNIT_TIME=60
#将SECS更改成需要进行监视的总秒数
#UNIT_TIME是取样的时间间隔,单位是秒
STEPS=$(( $SECS / $UNIT_TIME ))    #另一种算术预算方法

echo $STEPS
