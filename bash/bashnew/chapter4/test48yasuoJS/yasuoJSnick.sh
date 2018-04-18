#!/bin/bash

if [ $# -ne 1 ];
then
    echo "Usage: $0 filename "
    exit -1
fi

cat $1 | tr -d '\n\t' | tr -s ' ' | sed -r 's:/*.**/::g' | sed -r 's/ ?([(){};,:]) ?/\1/g' > a.txt

cat a.txt | sed 's/;/;\n/g' | sed 's/{/{\n\n/g' | sed 's/}/\n\n}/g'      #注意这里不能随便加入 -r 参数，会出错