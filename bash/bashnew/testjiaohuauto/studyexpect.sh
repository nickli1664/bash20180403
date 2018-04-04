#!/usr/bin/expect


spawn ./studyjiaohu.sh
expect "Enter number:"
send "1\n"
expect "Enter name:"
send "hello\n"
expect eof

#类似于autoit的自动化脚本
# spawn 参数指定需要自动化哪一个命令;
# expect 参数提供需要等待的消息;
# send 是要发送的消息;
# expect eof 指明命令交互结束。