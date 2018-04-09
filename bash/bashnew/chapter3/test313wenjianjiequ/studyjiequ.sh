#!/bin/bash

head file.txt                          #打印前10行

echo "------------------"

cat file.txt | head

echo "------------------"

head -n 4 file.txt                     #打印前4行

echo "------------------"

#head -n -M file                       #打印除了最后M行之外所有的行

seq 11 | head -n -5

echo "------------------"

tail file.txt                          #打印文件的最后10行

#cat file.txt | tail

echo "------------------"

tail -n 5 file.txt                     #打印最后5行

echo "------------------"

#tail -n +(M+1)                        #打印除了前M行之外所有的行

seq 100 | tail -n +91                  #打印除前90行之外的所有行

echo "------------------"

#不间断地监视文件的增长:
#tail -f /var/log/messages

#dmesg | tail -f

#当某个给定进程(Foo)结束之后, tail 也会随之终结:

#PID=$(pidof Foo)
#tail -f file --pid $PID               #利用gedit实测，并不起作用