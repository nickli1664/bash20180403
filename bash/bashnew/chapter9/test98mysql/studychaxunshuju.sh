#!/bin/bash


USER="pig"
PASS="123456"

depts=`mysql -u $USER -p$PASS students <<EOF | tail -n +2
SELECT DISTINCT dept FROM students;
EOF`

for d in $depts;
do

    echo Department : $d
    result="`mysql -u $USER -p$PASS students <<EOF
    SET @i:=0;
    SELECT @i:=@i+1 as rank,name,mark FROM students WHERE dept="$d" ORDER BY mark DESC;
EOF`"

echo "$result"
echo
done

#line16   SET @i:=0 是一个SQL构件(SQL construct),用来设置变量 i=0 。
#line17   sql语句还需要进一步学习


