#!/bin/bash

#touch 命令可以用来生成空白文件或是修改文件的时间戳(如果文件已存在)。

for name in test{1..10}.txt
do
    touch $name
done

#如果文件已经存在,那么 touch 命令会将与该文件相关的所有时间戳都更改为当前时间。如果我们只想更改某些时间戳,则可以使用下面的选项。
#touch -a 只更改文件访问时间。
#touch -m 只更改文件内容修改时间。

#更改为特定日期
touch -d "Fri Jun 25 20:50:14 CST 1999" foo1