#!/bin/bash

#使 用 lynx 和 curl

if [ $# -ne 1 ];
then
  echo -e "$Usage: $0 URL\n"
  exit 1;
fi

echo Broken links:

mkdir /tmp/$$.lynx
cd /tmp/$$.lynx

lynx -traversal $1 > /dev/null                     #在工作目录下生成数个文件,其中包括 reject.dat ,该文件包含网站中的所有链接。
count=0;

sort -u reject.dat > links.txt                     #建立一个不包含重复项的列表

while read link;
do
  output=`curl -I $link -s | grep "HTTP/.*OK"`;    #考察curl的用法，-I 只检验响应头部
if [[ -z $output ]];
then
  echo $link;
  let count++
fi
done < links.txt

[ $count -eq 0 ] && echo No broken links found.

#对于最新的webserver，感觉lynx已经无法抓取很多链接，（reject.dat里面大量乱七八糟的东西,或者是完全出不来）所以这个内容仅供参考吧 nick20180425

