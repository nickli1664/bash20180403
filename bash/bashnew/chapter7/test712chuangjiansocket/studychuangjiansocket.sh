#!/bin/bash

#使用nc命令

#接收端
#nc -l 1234                         #端口为1234

#发送端
#nc HOST 1234                       #把HOST替换为接收端的IP

#利用重定向进行快速文件复制

#nc -l 1234 > destination_filename
#nc HOST 1234 < source_filename

