#!/bin/bash

#array_var=(1 2 3 4 5 6)                   #这种方法也可，使用0为其实索引
array_var[0]="test1"
array_var[1]="test2"
array_var[2]="test3"
array_var[3]="test4"
array_var[4]="test5"
array_var[5]="test6"

echo ${array_var[0]}

index=5
echo ${array_var[$index]}

echo ---------------------

echo ${#array_var[*]}                      #显示数组数量

echo ---------------------

echo ${array_var[@]}                       #枚举显示所有数组元素

declare -A fruits_value                    #关联数组
fruits_value=([apple]='100dollars' [orange]='150 dollars')

echo "Apple costs ${fruits_value[apple]}"

echo ${!fruits_value[*]}                   #列出数组所有索引