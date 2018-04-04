#!/bin/bash

read -p "Enter number:" no 
read -p "Enter name:" name
echo You have entered $no, $name


#以上代码的效果等同于下面的代码
# echo -e "1\nhello\n" | ./studyjiaohu.sh                   #echo -e 的意思是”解释转义序列“，即把 \n解释为回车


#也可以重定向
# echo -e "1\nhello\n" > input.data
# ./studyjiaohu.sh < input.data