#!/bin/bash

#将本地主机端口8000上的流量转发到www.kernel.org的端口80上
 
ssh -o StrictHostKeyChecking=no -L 8080:www.kernel.org:80 nickli@127.0.0.1    #实测没有效果


