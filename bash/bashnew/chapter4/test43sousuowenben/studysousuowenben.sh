#!/bin/bash

#grep pattern filename
#grep "pattern" filename
#this is the line containing pattern

echo -e "this is a word\nnext line" | grep word          #输出匹配到的"整行"！

#grep "match_text" file1 file2 file3 ...

echo "-----------------------"

echo -e "this is a word\nnext line" | grep word --color=auto  #着重标记出匹配到的单词

echo "-----------------------"

egrep " +l[a-z]+" studysousuowenben.sh       #使用正则表达式。注意，会输出匹配到的"整行"！！
#grep -E " +l[a-z]+" studysousuowenben.sh    #效果同上

echo "-----------------------"

echo -e "this is a line.\nabcd." | egrep -o "[a-z]+\."   #只输出文件中匹配到的文本部分,可以使用选项 -o (分隔时另起一行？)

echo "-----------------------"

echo -e "this is a word\nnext line" | grep -v word   #打印除包含 match_pattern 行之外的所有行,选项 -v 可以将匹配结果进行反转(invert)

echo "-----------------------"

echo -e "1 2 3 4\nhello\n5 6" | egrep -c "[0-9]"     #统计文件或文本中包含匹配字符串的行数
#需要注意的是 -c 只是统计匹配行的数量,并不是匹配的次数

echo "-----------------------"

echo -e "1 2 3 4\nhello\n5 6" | egrep -o "[0-9]" | wc -l   #统计匹配项的数量

echo "-----------------------"

grep "linux" -n sample1.txt sample2.txt                    #打印出包含匹配字符串的行号
#cat sample1.txt | grep linux -n           #效果同上

echo "-----------------------"

echo gnu is not unix | grep -b -o "not"    #打印模式匹配所位于的字符或字节偏移,选项 -b 总是和 -o 配合使用

echo "-----------------------"

grep -l "linux" sample1.txt sample2.txt    #搜索多个文件并找出匹配文本位于哪一个文件中
#和 -l 相反的选项是 -L ,它会返回一个不匹配的文件列表。

echo "-----------------------"

#递归搜索文件内容（极其重要！） -R 和 -r 功能一样。
grep -R -n "line" ..

echo "-----------------------"

#忽略大小写
echo -e "hello world\nhahahaha" | grep -i "HELLO"

echo "-----------------------"

#匹配多个样式 (再次留意 -o 的用法)
echo this is a line of text | grep -e "this" -e "line" -o
#另一种方法：利用 -f 读取文件
echo hello this is cool | grep -f pat_file

echo "-----------------------"

#递归进阶
#grep "main()" . -r --include *.{c,cpp}           #目录中递归搜索所有的 .c和 .cpp文件
grep "linux" .. -r --include *.txt
#some{string1,string2,string3} 会扩展成 somestring1 somestring2 somestring3

#在搜索中排除所有的 README 文件
#grep "main()" . -r --exclude "README"

#如果需要排除目录,可以使用 --exclude-dir 选项。
#如果需要从文件中读取所需排除的文件列表,使用 --exclude-from FILE 。

echo "-----------------------"

#echo "test" > file1
#echo "cool" > file2
#echo "test" > file3

#grep 使用 -Z 选项输出以0值字节作为终结符的文件名( \0 )。-Z 通常和 -l 结合使用。 xargs -0读取输入并用0值字节终结符分隔文件名
grep "test" file* -lZ | xargs -0 rm

#打印出匹配文本之前或之后的行

seq 10 | grep 5 -A 3                  #要打印匹配某个结果之后的3行,使用 -A 选项，-B 之前的行 -C 前后的行


echo "-----------------------"

echo -e "a\nb\nc\na\n1\n2" | grep a -A 1           #如果有多个匹配,那么使用 -- 作为各部分之间的定界符

