#!/bin/bash

if [ $# -ne 3 ];
then
    echo "Usage: $0 URL -d DIRECTORY"
    exit -1
fi

for i in {1..4}
do
case $1 in
    -d) shift; directory=$1; shift ;;
    *) url=${url:-$1}; shift;;
esac
done

#shift 用来向左移动参数。当使用 shift 后, $2 的值就被赋给 $1 ;如果再次使用 shift ,则$3 的值被赋给 $1 ,往后依次类推,因此通过 $1 就可以对所有的参数进行求值。
# *) 对应默认匹配(default match)。它能够匹配除了 -d 之外的任何内容。因此在默认匹配中,如果 $1="" 或 $1=URL ,就需要采用 $1=URL ,避免 "" 将变量 url 覆盖掉,因此我们使用了 url=${url:-$1} 。如果 url 不为空,它会返回URL值,否则返回 $1 的值。
#这里再次考察了${a:-b}的逻辑，如果a存在且不为空，则返回a，如果a不存在或为空，那么返回b


mkdir -p $directory;                                          #-p 表示递归创建多层次目录
baseurl=$(echo $url | egrep -o "https?://[a-z.]+")            #储存基础网址

echo Downloading $url

echo "nicktest $baseurl"

#curl -s $url | egrep -o "<img src=[^>]*>" | sed 's/<img src=\"\([^"]*\).*/\1/g' > /tmp/$$.list    
#-s 意义同--silent

#nickupdate20180423 有些网站的前端元素中，会混用双引号和单引号，有时src也使用绝对地址，所以这个脚本的实用性比较有限。
curl -s $url | egrep -o "<img src=[^>]*>" | sed 's/<img src=\"\([^"]*\).*/\1/g' | sed "s|<img src='\([^']*\).*|\1|g" > /tmp/$$.list  
#nickupdate20180423 后面的sed把单引号的情况也考虑到，注意这里单引号前不要转义



#echo "'a'" | sed "s|'|2|g"             #测试坑爹的转义


<<comment
sed -i "s|^/|$baseurl/|" /tmp/$$.list
comment

sed -i "s|^//|http://|" /tmp/$$.list

cd $directory;

n=0
while read filename;                                         #这里再次考察read用法，逐行读取文件内容
do
    echo Downloading $filename
    #echo $n
    #curl -s -O "$filename" --silent                         #如果有相同的文件名，这里就直接覆盖掉了
    curl -s "$filename" -o $n
    let n++
done < /tmp/$$.list
#comment

#这个例子的限制太多，仅供参考吧
