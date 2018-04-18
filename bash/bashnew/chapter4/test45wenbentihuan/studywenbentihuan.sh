#!/bin/bash

#sed 's/pattern/replace_string/' file
#cat file | sed 's/pattern/replace_string/'     #效果同上

#在默认情况下, sed 只会打印替换后的文本。如果需要在替换的同时保存更改,可以使用 -i 选项
#sed -i 's/text/replace/' file
#使用下面的例子，sed 不仅执行文件内容替换,还会创建一个名为file.bak的文件,其中包含着原始文件内容的副本。
#sed –i .bak 's/abc/def/' file

#之前看到的 sed 命令会将每一行中第一处符合模式的内容替换掉。但是如果要替换所有内容,我们需要在命令尾部加上参数 g
#如果需要从第n处匹配开始替换。对此,可以使用 /Ng 选项

echo "thisthisthisthis" | sed 's/this/THIS/2g'

echo "thisthisthisthis" | sed 's/this/THIS/4g'

#字符 / 在 sed 中被作为定界符使用。我们可以像下面一样使用任意的定界符:
#sed 's:text:replace:g'
#sed 's|text|replace|g'
#当定界符出现在样式内部时,我们必须用前缀 \ 对它进行转义:
#sed 's|te\|xt|replace|g'
#\| 是一个出现在样式内部并经过转义的定界符。

#移除空白行
#sed '/^$/d' file
#/pattern/d 会移除匹配样式的行。

echo "-------------"

sed 's/\b[0-9]\{3\}\b/NUMBER/g' sed_data.txt

#上面的单行命令替换了所有的3位数字。正则表达式 \b[0-9]\{3\}\b 用于匹配 3 位数字。 [0-9]表示数位取值范围,也就是说从 0~9。{3} 表示匹配之前的字符3次。 \{3\} 中的 \ 用于转义 { 和 } 。\b 表示单词边界。
#这里的转义令人费解，可以使用 -r 参数，来避免对元字符的转义

sed -r 's/\b[0-9]{3}\b/NUMBER/g' sed_data.txt

echo "-------------"

#已匹配字符串标记( & )
echo this is an example | sed 's/\w\+/[&]/g'
echo this is an example | sed -r 's/\w+/[&]/g'
#正则表达式 \w\+ 匹配每一个单词,然后我们用 [&] 替换它。 & 对应于之前所匹配到的单词。

echo "-------------"

#子串匹配标记( \1 )
echo "this is digit 7 in a number" | sed 's/digit \([0-9]\)/\1/'
echo "this is digit 7 in a number" | sed -r 's/digit ([0-9])/\1/'
#\(pattern\) 用于匹配子串。对于匹配到的第一个子串,其对应的标记是 \1 ,匹配到的第二个子串是 \2 ,往后依次类推。
#注意，这里考察了对正则表达式小括号 （） 子串的理解，不要忘了。

echo seven EIGHT | sed 's/\([a-z]\+\) \([A-Z]\+\)/\2 \1/'
echo seven EIGHT | sed -r 's/([a-z]+) ([A-Z]+)/\2 \1/'

echo "-------------"

#组合多个表达式
#以下三种形式等价
#sed 'expression' | sed 'expression'
#sed 'expression; expression'
#sed -e 'expression' -e expression'

echo abc | sed 's/a/A/' | sed 's/c/C/'
echo abc | sed 's/a/A/;s/c/C/'
echo abc | sed -e 's/a/A/' -e 's/c/C/'

echo "-------------"


#sed 表达式通常用单引号来引用。当我们想在 sed 表达式中使用一些变量时,使用双引号
text=hello
echo hello world | sed "s/$text/HELLO/"

