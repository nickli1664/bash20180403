#!/bin/bash

#同样基于ssh

#scp filename user@remotehost:/home/path
#该命令会提示你输入密码,可以用SSH自动登录功能来免于输入密码

#scp SOURCE DESTINATION

#这条命令会自动判断发送还是抓取。
#例如，若SOURCE为远端地址，DESTINATION为文件名，则进行抓取动作
#若SOURVE为文件名，DESTINATION为远端地址，则进行发送

#使用-oPort指定端口，与sftp类似

#文件夹递归复制 -r 选项

scp -r /home/nickli/Desktop/homestudy testnick1@192.168.0.6:/home/testnick1/Desktop

#-p 选项能够在复制文件的同时保留文件的权限和模式


