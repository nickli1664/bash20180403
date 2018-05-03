#!/bin/bash

#从CSV中读取数据并写入MySQLdb

USER="pig"
PASS="123456"
if [ $# -ne 1 ];
then
    echo $0 DATAFILE
    echo
    exit 2
fi

data=$1

while read line;
do
    oldIFS=$IFS
    IFS=,
    values=($line)
    values[1]="\"`echo ${values[1]} | tr ' ' '#' `\""
    values[3]="\"`echo ${values[3]}`\""

    query=`echo ${values[@]} | tr ' #' ', ' `
    IFS=$oldIFS
    
    #这里搞了一堆就是为了给sql的字符串加上引号

    mysql -u $USER -p$PASS students <<EOF
INSERT INTO students VALUES($query);
EOF
done< $data

echo Wrote data into DB

#这里在csv的最后没有空行的话会无法添加最后一行，存疑，测试是while read 引起的？
