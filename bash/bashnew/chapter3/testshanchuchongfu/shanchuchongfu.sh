#!/bin/bash

#查找并删除重复文件,每一个文件只保留一份。先判断两个文件大小是否相等，如果相等，再判断MD5

ls -lS --time-style=long-iso | awk 'BEGIN {
    getline; getline;
    name1=$8; size=$5
    #print name1; print size;
}
{
    name2=$8;
    if (size==$5)
    {
        "md5sum "name1 | getline; csum1=$1;             #这个地方有错误，存疑
        "md5sum "name2 | getline; csum2=$1;             #这个地方有错误，存疑
        if ( csum1==csum2 )
        {
            print name1; print name2
        }
    };
    
    size=$5; name1=name2;
}' #| sort -u > duplicate_files

#cat duplicate_files | xargs -I {} md5sum {} | sort | uniq -w 32 | awk '{ print $2 }' | sort -u > duplicate_sample    #这个地方原文章画蛇添足了，实际在sanmple里储存将要保留的文件名即可。
#cat dumid.txt | xargs -I {} cat {} | sort -u > duplicate_sample
#cat duplicate_files | xargs -I {} md5sum {} | sort | uniq -w 32 > dunick.txt

echo Removing..
#comm duplicate_files duplicate_sample -2 -3 | tee /dev/stderr | xargs rm               #取差集，然后删除多余的文件
echo Removed duplicates files successfully.


#这个地方前面长篇大论的awk是错的，而且个人感觉没有意义。直接计算所有文件的MD5，然后 | sort | uniq -w 32 | 之后即可继续下一步动作