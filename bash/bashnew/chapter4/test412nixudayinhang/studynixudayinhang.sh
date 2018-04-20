#!/bin/bash

#在bash中模拟栈结构

seq 5 | tac

echo "--------"

seq 9 | \
awk '{ lifo[NR]=$0 }
    END { for(lno=NR;lno>0;lno--){ print lifo[lno]; }
}'

#这个例子十分巧妙，也体现了数组变量在awk中的作用域，至少cover了{}和END {}

