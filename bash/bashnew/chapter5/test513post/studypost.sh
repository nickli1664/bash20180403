#!/bin/bash

#可以使用curl或wget来实现

#curl URL -d "postvar=postdata2&postvar2=postdata2"      #curl格式

#-d 表 示 以 POST 方 式 提 交 用 户 数 据 。 -d 的 字 符 串 参 数 的 形 式 类 似 于 GET 请 求 。 每 对var=value 之间用 & 分隔。

#wget http://book.sarathlakshman.com/lsc/mlogs/submit.php --post-data "host=test-host&user=slynux" -O output.html   #wget格式


#-d 参数的内容应该以引用的形式给出。否则, & 会被shell解读为该命令需要作为后台进程运行。


