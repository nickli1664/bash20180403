#!/bin/bash

for ip in 192.168.1.{1..255};
do
  (
      ping $ip -c 2 &>/dev/null                              #  &> /dev/null 用于将 stderr 和 stdout 重定向到 /dev/null
      if [ $? -eq 0 ];
      then
        echo "$ip" is alive
      fi
  )&
  done
wait

#将循环体放入 ( )& 。 ( ) 中的命令作为子shell来运行,而 & 会将其置入后台。
#在for 循环体中执行多个后台进程,然后结束循环并终止脚本。要想等所有子进程结束之后再终止脚本,就得使用 wait 命令。将 wait 放在脚本最后,它就会一直等到所有的子脚本进程全部结束。

#这个例子的循环加并行十分巧妙，值得重点学习

