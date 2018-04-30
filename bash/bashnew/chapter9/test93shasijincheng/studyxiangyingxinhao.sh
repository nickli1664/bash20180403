#!/bin/bash

#trap 'signal_handler_function_name' SIGNAL LIST
#SIGNAL LIST 以空格分隔,它可以是信号编号或者信号名称。
#这个程序相应SIGINT信号，即ctrl+c 需强制关闭

function handler()
{
  echo Hey, received signal : SIGINT
}

echo My process ID is $$

trap 'handler' SIGINT

while true;
do
  sleep 1
done


