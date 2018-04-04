#!/bin/bash

#下面的语句从输入中读取n个字符并存入变量 variable_name :
#read -n number_of_chars variable_name
read -n 2 var
echo
echo $var


#用无回显的方式读取密码:
read -s var2
echo
echo $var2

#显示提示信息:
#read -p "Enter input:" var

#在特定时限内读取输入:
#read -t timeout var

#用特定的定界符作为输入行的结束:
#read -d delim_char var
#例如：read -d ":" var
#hello:#var 被设置为 hello