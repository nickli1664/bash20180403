#!/bin/bash

ls -lS --time-style=long-iso | awk 'BEGIN {
    getline;
}
{
    print $8
}' | sort -u > duplicate_files                          #这个地方很有意思，可以体会重定向文件的生成时机 

cat duplicate_files | xargs -I {} md5sum {} | sort | uniq -w 32 | awk '{ print $2 }' | sort -u > duplicate_sample      #在sanmple里储存将要保留的文件名即可。

echo Removing..
#comm duplicate_files duplicate_sample -2 -3 | tee /dev/stderr | xargs rm               #取差集，然后删除多余的文件   tee命令:将文件名传递给 rm 命令的同时,也起到了 print 的作用。
echo Removed duplicates files successfully.

