#!/bin/bash

#ssh username@remote_host

#username 是远程主机上的用户;
#remote_host 可以是域名或IP地址。

#ssh user@localhost -p 422
#SSH服务器默认在端口22上运行,这里是指定使用422端口的方法


#ssh mec@192.168.0.1 "echo user: $(whoami);echo OS: $(uname)"
#在远程主机中执行命令，一般格式如下
#ssh user@host "command1 ; command2 ; command3"

