#!/bin/bash

#将下载的文件输出到终端
curl http://www.baidu.com

echo "-------------------"

#要避免 curl 命令显示进度信息,可以使用 --silent 选项:
#curl URL --silent

#选项 –O 表明将下载数据写入文件,而非标准输出中。该文件采用的是从URL中解析出的文件名:
#curl URL --silent -O


#如果需要在下载过程中显示形如 # 的进度条,用 --progress 代替 --silent 。
curl http://www.baidu.com -o index.html --progress
#这里使用 -o 选项来手动指定文件名

echo "-------------------"

#断点续传
#cURL能够从特定的文件偏移处继续下载。可以通过指定一个偏移量来下载部分文件。
#curl URL/file -C offset

#偏移量是以字节为单位的整数。如果只是想断点续传,那么cURL不需要指定准确的字节偏移。要是你希望cURL推断出正确的续传位置,请使用选项 -C -  cURL会自动计算出应该从哪里开始续传。
#curl -C - URL


#用cURL设置参照页字符串
#参照页(referer)是位于HTTP头部中的一个字符串,用来标识用户是从哪个页面到达当前页面的。
#如果用户点击了网页A中的某个链接,那么用户就会转到网页B,网页B头部的参照页字符串会包含网页A的URL。

#一些动态网页会在返回HTML页面前检测参照页字符串。例如,如果用户是通过Google搜索来到了当前网页,网页上会附带显示一个Google的logo;如果用户是通过手动输入URL来到当前网页,则显示另一个不同的页面。
#网站的作者可以根据条件进行判断:如果参照页是www.google.com,那么就返回一个Google页面,否则返回其他页面。

#可以用 curl 命令的 --referer 选项指定参照页字符串
#curl --referer Referer_URL target_URL
#curl --referer http://google.com http://slynux.org


#用cURL设置cookie
#可以用 curl 来指定并存储HTTP操作过程中使用到的cookie
#cookies需要以 name=value 的形式来给出。多个cookie之间使用分号分隔。
#curl http://example.com --cookie "user=slynux;pass=hack"
#如果要将cookie另存为一个文件,使用 --cookie-jar 选项。
#curl URL --cookie-jar cookie_file


#用cURL设置用户代理字符串
#如果不指定用户代理(user agent),一些需要检验用户代理的网页就无法显示。你肯定碰到过有些陈旧的网站只能在Internet Explorer(IE)下正常工作。
#如果使用其他浏览器,这些网站就会提示说它只能用IE访问。这是因为这些网站检查了用户代理。你可以用 curl 来设置用户代理。
#cURL的 --user-agent 或 -A 选项用于设置用户代理
#curl URL --user-agent "Mozilla/5.0"
#其他HTTP头部信息也可以通过cURL来发送。用 -H" 头部信息 " 传递多个头部信息。
#curl -H "Host: www.slynux.org" -H "Accept-language: en" URL


#限定cURL可占用的带宽 k m
#curl URL --limit-rate 20k


#指定最大下载量
#curl URL --max-filesize bytes
#如果文件大小超出限制,命令返回一个非0的退出码。如果命令正常运行,返回0。


#用cURL进行认证
#-u username:password 可用来指定用户名和密码。
#curl -u user:pass http://test_auth.com
#curl -u user http://test_auth.com


#只打印响应头部信息
#通过 -I 或 --head 就可以只打印HTTP头部信息,而无须下载远程文件。
curl -I http://www.baidu.com


