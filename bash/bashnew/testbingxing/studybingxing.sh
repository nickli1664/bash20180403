#!/bin/bash

#利用mkisofs命令可以生成iso


PIDARRAY=()                         #数组
for file in file1.iso file2.iso
do
    md5sum $file &                  # & 符号使脚本在后天运行    是否在这里体现并行进程？存疑
    PIDARRAY+=("$!")                #$! 保存着最近一个后台进程的PID 
done
wait ${PIDARRAY[@]}                 #等待进程结束