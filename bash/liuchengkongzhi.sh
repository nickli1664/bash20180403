#!/bin/bash

a=10
b=20
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi

num1=$[2*3]
num2=$[1+5]
#if test $[num1] -eq $[num2]
if [ $num1 == $num2 ]
then
    echo '两个数字相等!'
else
    echo '两个数字不相等!'
fi

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

for str in 'This is a string'
do
    echo $str
done

int=1
while(( $int<=5 ))
do
    echo $int
    let int++
done

echo '按下 <CTRL-D> 退出'
echo -n '输入你最喜欢的网站名: '          #-n表示不换行
while read FILM
do
    echo "是的！$FILM 是一个好网站"
done