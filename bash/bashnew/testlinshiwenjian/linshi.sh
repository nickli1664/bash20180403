#!/bin/bash

filename=`mktemp`           #创建临时文件

echo $filename

echo -----------------

dirname=`mktemp -d`         #创建临时目录

echo $dirname

echo -----------------

tmpfile=`mktemp -u`         #仅仅是想生成文件名,又不希望创建实际的文件或目录

echo $tmpfile


#根据模板创建临时文件名:
#mktemp test.XXX
#只少要有3个 X
