#!/bin/bash

#从 dictionaryapi.com 获取词汇定义

#实际作用是向一个开放api的网站发送get请求，这个例子不难

apikey=9cffb688-b633-41cb-befc-a233ab751ce2
if [ $# -ne 2 ];
then
  echo -e "Usage: $0 WORD NUMBER"
  exit -1;
fi

curl --silent http://www.dictionaryapi.com/api/v1/references/learners/xml/$1?key=$apikey | \
grep -o \<dt\>.*\</dt\> | \
sed 's$</*[a-z]*>$$g' | \
head -n $2 | nl                      #head命令显示需求的行数，nl加入行号

#line14 主要GET请求，返回一个完整的xml
#line15 这里的主要解释内容在dt元素里，抓取
#line16 删除多余的元素限定符号


