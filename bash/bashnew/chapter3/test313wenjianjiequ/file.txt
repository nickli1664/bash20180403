#!/bin/bash

if [ $# -ne 1 ];                                   # $#表示参数个数，-ne表示不等于
then
    echo "Usage is $0 basepath";
exit
fi
path=$1

declare -A statarray;                              #声明一个关联数组

find $path -type f -print | while read line;   
do
    file -b "$line" | cut -d , -f 1 >>mid      
done 

sort mid | uniq >mid2

IFS=$'\n'
for line in $(cat mid2)
do 
    #echo $line
    statarray[$line]=0
done

#echo ${!statarray[@]}

for line1 in $(cat mid)
do
    #echo line1:$line1
    for gl in ${!statarray[@]}
    do
        #echo gl:$gl
        if [ $line1 = $gl ];then
           let statarray[$gl]++;
        fi        
    done
done
rm mid*
#echo ${statarray[@]}

for ftype in "${!statarray[@]}";                   # ${!statarray[@]}   获取数组的索引列表  这里容易记错，加！为列出索引，不加！为列出键值
do
    echo $ftype : ${statarray["$ftype"]}           
done
