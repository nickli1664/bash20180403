#!/bin/bash

#创建mysql数据库和数据表

USER="pig"
PASS="123456"
mysql -u $USER -p$PASS <<EOF 2> /dev/null
CREATE DATABASE students;
EOF

[ $? -eq 0 ] && echo Created DB || echo DB already exist

mysql -u $USER -p$PASS students <<EOF 2> /dev/null
CREATE TABLE students(
id int,
name varchar(100),
mark int,
dept varchar(4)
);
EOF

[ $? -eq 0 ] && echo Created table students || echo Table students already exist
mysql -u $USER -p$PASS students <<EOF
DELETE FROM students;
EOF

#DELETE FROM table_name
#在不删除表的情况下删除所有的行


