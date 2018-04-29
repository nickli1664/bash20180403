#!/bin/bash

#自动化 FTP 传输

HOST='domain.com'
USER='foo'
PASSWD='password'
ftp -i -n $HOST <<EOF
user ${USER} ${PASSWD}
binary
cd /home/slynux
puttestfile.jpg
getserverfile.jpg
quit
EOF


#ftp 的选项 -i 关闭用户的交互会话, user ${USER} ${PASSWD} 设置用户名和密码, binary 将文件模式设置为二进制模式。



