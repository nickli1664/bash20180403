#!/bin/bash

ls + 2>out.txt         #将错误状态重定向

cmd 2>stderr.txt 1>stdout.txt     #分辨重定向

cmd 2>&1 output.txt               #将stderr 转换成 stdout  再重定向。也可以写成  cmd &> output.txt

cat a* | tee out2.txt | cat -n    #tee命令 复制一份stdin重定向到文件，再把stdin给下一个管道。默认为覆盖文件， -a 为追加

#echo who is this | tee -        #这个命令没有预想效果，我也没看明白

#利用exec 3<input.txt 可创建文件描述符 cat<&3