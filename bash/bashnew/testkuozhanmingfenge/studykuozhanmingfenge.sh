#!/bin/bash

file_jpg="sample.jpg"
name=${file_jpg%.*}                  #利用%截取文件名
echo File name is: $name

extension=${file_jpg#*.}             #利用#截取扩展名
echo Extension is: jpg

echo ---------------

VAR=hack.fun.book.txt

echo ${VAR%.*}                       #%为非贪婪匹配 从右向左
echo ${VAR%%.*}                      #%%为贪婪匹配

echo ${VAR#*.}                       ##为非贪婪匹配 从左向右
echo ${VAR##*.}                      ###为贪婪匹配 从左向右

#从 $VAR 中删除位于 # 右侧的通配符(即在前例中使用的 *. )所匹配的字符串。通配符从左向右进行匹配。

echo ---------------

URL="www.google.com"

echo ${URL%.*}
echo ${URL%%.*}

echo ${URL#*.}
echo ${URL##*.}