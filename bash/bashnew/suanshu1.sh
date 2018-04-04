#!/bin/bash

no1=4;
no2=5;


let result=no1+no2        #不用加$
echo $result

result2=$[ no1 + no2 ]   #在方括号前必须加上$，变量名前随意
echo $result2

result3=$(( no1 + 50 ))  #在双括号前必须加上$，变量名前随意
echo $result3

result4=`expr 3 + 4`
echo $result4

result5=$(expr $no1 + 5)
echo $result5

#以上命令都不可进行浮点计算

echo "4 * 0.56" | bc

no=54;
result=`echo "$no * 1.5" | bc`
echo $result

echo "scale=2;3/8" | bc                #双引号不能省略


#进制转换
no=100
echo "obase=2;$no" | bc

no=1100100
echo "obase=10;ibase=2;$no" | bc

echo "scale=10;sqrt(200)" | bc #Square root
echo "10^10" | bc #Square