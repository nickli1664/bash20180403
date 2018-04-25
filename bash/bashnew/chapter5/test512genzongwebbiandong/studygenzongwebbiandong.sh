#!/bin/bash

#使用 curl 和 diff 来实现

if [ $# -ne 1 ];
then
  echo -e "Usage: $0 URL\n"
  exit -1
fi

first_time=0                                 #非首次运行

if [ ! -e "last.html" ];                     #检查是否存在文件
then
  first_time=1                               #首次运行
fi

curl --silent $1 -o recent.html
if [ $first_time -ne 1 ];
then
  changes=$(diff -u last.html recent.html)
if [ -n "$changes" ];
then
  echo -e "Changes:\n"
  echo "$changes"
else
  echo -e "\nWebsite has no changes"
fi
else
  echo "[First run] Archiving.."
fi

cp recent.html last.html

