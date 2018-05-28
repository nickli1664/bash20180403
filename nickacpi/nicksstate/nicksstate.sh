#!/bin/bash

ac=`whoami`
if [[ $ac != "root" ]];
then
    echo "Please use root."
    exit -1
fi

if [[ $# -ne 1 ]];
then
    echo "Usage: $0 loop"
    exit -1
fi

echo $1 | egrep "^[0-9]+$" >/dev/null

if [[ $? -ne 0 ]];
then
    echo "Usage: $0 loop"
fi

cur=1
let totalp=$1+1
#echo $totalp

while [[ cur -lt totalp ]]
do
   echo
   echo -n "loop $cur, total $1.  "
   date
   echo -n "loop $cur, total $1.  ">>log
   date >>log
   sleep 20
   let cur++
   rtcwake -m mem -s 30
done

echo
echo "s3 finish"

