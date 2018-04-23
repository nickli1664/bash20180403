#!/bin/bash

wget https://www.baidu.com

#可以用选项 -o 指定一个日志文件,这样日志信息就不会被打印到 stdout 了。
#wget ftp://example_domain.com/somefile.img -O dloaded_file.img -o log

#-t 指定重试次数
#wget -t 5 URL
#wget -t 0 URL   #不停地进行重试

#限速
#wget --limit-rate 20k http://example.com/file.iso    #在命令中用 k (千字节)和 m (兆字节)指定速度限制。

#指定总的最大下载配额(quota)。使用 --quota 或 -Q选项
#wget -Q 100m http://example.com/file1 http://example.com/file2

#断电续传
#wget -c URL

#复制整个网站(镜像)
#像爬虫一样以递归的方式遍历网页上所有的URL链接,并逐个下载
#wget --mirror --convert-links exampledomain.com

#wget -r -N -l -k DEPTH URL
#-l 指定页面层级。这意味着 wget 只会向下遍历指定的页面级数。该选项要与 -r (recursive,递归选项)一同使用。另外, -N表示 使用文件的时间戳。 URL 表示欲下载的网站起始地址。 -k 或 -convert-links指示wget将页面的链接地址转换为本地地址。


#访问需要认证的HTTP或FTP页面
#一些网页需要HTTP或FTP认证,可以用 --user 和 --password 提供认证信息
#wget --user username --password pass URL
#也可以不在命令行中指定密码,而由网页提示并手动输入密码,这就需要将 --password 改为 --ask-password 。


