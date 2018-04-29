#!/bin/bash


#FTP
#我们可以用 lftp 命令访问FTP服务器来进行文件传输。
#只有远程主机上安装有FTP服务器才能使用FTP。很多公共网站都是用FTP共享文件,它使用端口21。

<<comment
lftp username@ftphost
它会提示你输入密码,然后显示一个像下面那样的登录提示符:
lftp username@ftphost:~>
你可以在提示符后输入命令,如下所示。
用 cd directory 改变目录。
用 lcd 改变本地主机的目录。
用 mkdir 创建目录。
列出远程机器当前目录下的文件使用 Is 。
用 get filename 下载文件:
lftp username@ftphost:~> get filename
用 put filename 从当前目录上传文件:
lftp username@ftphost:~> put filename
用 quit 退出 lftp 会话。
lftp 提示符支持命令自动补全。
comment


