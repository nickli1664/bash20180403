#!/bin/bash

cat sample.js | tr -d "\n\t" | tr -s " " | \
sed 's:/\*.*\*/::g' | \
sed 's/ \?\([{}();,:]\) \?/\1/g' > a.txt

echo "--------"

cat obfuscated.txt | sed 's/;/;\n/g' | sed 's/{/{\n\n/g' | sed 's/}/\n\n}/g'

#有空对sed进行重写，尽量减少转义增加可读性。nick

<<comment
该脚本在使用上存在局限:它会删除本不该删除的空格。假如有下列语句:
var a = " hello    world "
两个空格会被转换成一个。这种问题可以使用我们讲解过的模式匹配工具
来解决。如果需要处理关键JavaScript代码,最好还是使用功能完善的工具
来实现。
comment

<<comment
通过执行下面的步骤来进行压缩。
(1) 移除 '\n' 和 '\t' :
tr -d '\n\t'
(2) 移除多余的空格:
tr -s ' '或者sed 's/[ ]\+/ /g'
(3) 移除注释:
sed 's:/\*.*\*/::g'
因为我们需要使用 /* 和 */ ,所以用 : 作为 sed 的定界符,这样就不必对 / 进行转
义了。
* 在 sed 中被转义为 \* 。
.* 用来匹配 /* 与 */ 之间所有的文本。
(4) 移除 { 、 } 、 ( 、 ) 、 ; 、 : 以及 , 前后的空格。
sed 's/ \?\([{}();,:]\) \?/\1/g'
上面的 sed 语句含义如下。
sed 代码中的 / \?\([{ }();,:]\) \?/ 用于匹配, /\1/g 用于替换。
\([{ }();,:]\) 用于匹配集合 [ { }( ) ; , : ] (出于可读性方面的考虑,
在这里加入了空格)中的任意一个字符。 \( 和 \) 是分组操作符,用于记忆所匹配的
内容,以便在替换部分中进行向后引用。对 ( 和 ) 转义之后,它们便具备了另一种特
殊的含义,进而可以将它们作为分组操作符。位于分组操作符前后的 \? 用来匹配
可能出现在字符集合前后的空格。
在命令的替换部分,匹配字符串(也就是一个可选的空格、一个来自字符集的字
符再加一个可选的空格)被匹配的子字符串所替换。对于匹配的子字符串使用了
向后引用,并通过分组操作符 () 记录了匹配内容。可以用符号 \1 向后引用分组
所匹配的内容。
解压缩命令工作方式如下:
s/;/;\n/g 将 ; 替换为 ;\n ;
s/{/{\n\n/g 将 { 替换为 {\n\n ;
s/}/\n\n}/g 将 } 替换为 \n\n} 。
comment
