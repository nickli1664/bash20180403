#!/bin/bash


#awk基本结构
#awk ' BEGIN{ print "start" }  END{ print "end" } file
#也可以从 stdin 中读取

#  pattern { commands }  如果不提供该语句块,则默认执行 { print } ,即打印所读取到的每一行。

#每读取一行, awk 就会检查该行和提供的样式是否匹配。样式本身可以是正则表达式、条件语句以及行匹配范围等。如果当前行匹配该样式,则执行 { } 中的语句。
#样式是可选的。如果没有提供样式,那么 awk 就认为所有的行都是匹配的,并执行 { } 中的语句。

echo -e "line1\nline2" | awk 'BEGIN{ print "Start" } { print } END{ print "End" } '

echo "--------"

#当 print 的参数是以逗号进行分隔时,参数打印时则以空格作为定界符。
#在 awk 的 print 语句中,双引号是被当做拼接操作符(concatenation operator)使用的。

echo | awk '{ var1="v1"; var2="v2"; var3="v3"; print var1,var2,var3 ; }'

echo | awk '{ var1="v1"; var2="v2"; var3="v3"; print var1 "-" var2 "-" var3 ; }'

echo "--------"

#特殊变量
# NR :表示记录数量,在执行过程中对应于当前行号。
# NF :表示字段数量,在执行过程中对应于当前行的字段数。
# $0 :这个变量包含执行过程中当前行的文本内容。
# $1 :这个变量包含第一个字段的文本内容。
# $2 :这个变量包含第二个字段的文本内容。

echo -e "line1 f2 f3\nline2 f4 f5\nline3 f6 f7" | awk '{
print "Line no:"NR",No of fields:"NF, "$0="$0, "$1="$1,"$2="$2,"$3="$3
}'

#可以用 print $NF 打印一行中最后一个字段,用 $(NF-1) 打印倒数第二个字段,其他字段依次类推即可。

#awk '{ print $3,$2 }' file    #打印每一行的第2和第3个字段

#awk 'END{ print NR }' file    #统计文件中的行数

echo "--------"

seq 5 | awk 'BEGIN{ sum=0; print "Summation:" } { print $1"+"; sum+=$1 } END { print "=="; print sum }'

echo "--------"

#借助选项 -v ,我们可以将外部值(并非来自 stdin )传递给 awk

VAR=10000
echo | awk -v VARIABLE=$VAR '{ print VARIABLE }'

#另一种方式
var1="Variable1" ; var2="Variable2"
echo | awk '{ print v1,v2 }' v1=$var1 v2=$var2

#当输入来自于文件时
#awk '{ print v1,v2 }' v1=$var1 v2=$var2 filename

echo "--------"

#读取某一行
seq 5 | awk 'BEGIN { getline; print "Read ahead first line", $0 } { print $0 }'

echo "--------"

#过滤模式
#awk 'NR < 5' # 行号小于5的行
#awk 'NR==1,NR==4' # 行号在1到5之间的行
#awk '/linux/' # 包含样式linux的行(可以用正则表达式来指定模式)
#awk '!/linux/' # 不包含包含模式为linux的行

seq 10 | awk 'BEGIN { getline } NR < 5 { print $1 "haha" }'        #注意此时的逻辑和判断的位置

echo "--------"

#设置字段定界符
#默认的字段定界符是空格。我们也可以用 -F "delimiter" 明确指定一个定界符

awk -F : '{ print $NF }' /etc/passwd                               #冒号为定界符，打印最后一个字段的值
#awk 'BEGIN { FS=":" } { print $NF }' /etc/passwd                  #效果同上
#在 BEGIN 语句块中则可以用 OFS="delimiter" 设置输出字段的定界符

echo "--------"

#将命令的输出结果读入变量 output
#  "command" | getline output ;
echo | awk '{ "grep root /etc/passwd" | getline cmdout ; print cmdout }'

echo "--------"

#在 awk 中可以使用 for 循环
#for(i=0;i<10;i++) { print $i ; }
#for(i in array) { print array[i]; }

#awk 内建的字符串控制函数
#length(string) :返回字符串的长度。
#index(string, search_string) :返回 search_string 在字符串中出现的位置。
#split(string, array, delimiter) :用定界符生成一个字符串列表,并将该列表存入数组。
#substr(string, start-position, end-position) :在字符串中用字符起止偏移量生成子串,并返回该子串。
#sub(regex, replacement_str, string) :将正则表达式匹配到的第一处内容替换成 replacment_str 。
#gsub(regex, replacment_str, string) :和 sub() 类似。不过该函数会替换正则表达式匹配到的所有内容。
#match(regex, string) :检查正则表达式是否能够匹配字符串。如果能够匹配,返回非0值;否则,返回0。 match() 有两个相关的特殊变量,分别是 RSTART 和 RLENGTH 。变量 RSTART 包含正则表达式所匹配内容的起始位置,而变量 RLENGTH 包含正则表达式所匹配内容的长度。

