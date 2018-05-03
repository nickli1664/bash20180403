#!/bin/bash


while read line;
do
    oldIFS=$IFS
    IFS=,
    values=($line)
    values[1]="\"`echo ${values[1]} | tr ' ' '#' `\""
    values[3]="\"`echo ${values[3]}`\""

    echo ${values[@]} | tr ' #' ', '

    IFS=$oldIFS

#done < <(cat studentdata.csv)
done < studentdata.csv

#关于最后的重定向，容易弄错。两种写法都可以，但是别搞乱了。

