#!/bin/bash

<<comment

设置SSH自动化认证需要两步:
(1) 创建SSH密钥,这用于登录远程主机;
(2) 将生成的公钥传给远程主机,并将其加入文件 ~/.ssh/authorized_keys中。
comment

#ssh-keygen -t rsa                      #指定加密算法类型为RSA


#要添加一个密钥文件,可以使用
#ssh USER@REMOTE_HOST "cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub
#这个命令不实用，因为大多数系统都没有公钥的文件夹和文件，还要设置权限。所以直接使用下面的命令

#ssh-copy-id USER@REMOTE_HOST    #一揽子完成复制公钥操作


