#!/bin/bash

#主要使用logrotate命令。能够将日志文件的大小限制在给定的 SIZE 内。 可以实现日志的栈式转存(例如 log.1 log.2  还可以压缩成gz)

#为自己的日志写一个配置

<<comment

$ cat /etc/logrotate.d/program
/var/log/program.log {
  missingok                           如果日志文件丢失,则忽略;然后返回(不对日志文件进行轮替)
  notifempty                          仅当源日志文件非空时才对其进行轮替
  size 30k                            限制实施轮替的日志文件的大小。可以用1M表示1MB
  compress                            允许用 gzip 压缩较旧的日志
  weekly                              指定进行轮替的时间间隔。可以是 weekly 、 yearly 或 daily
  rotate 5                            这是需要保留的旧日志文件的归档数量。在这里指定的是5,所以这些文件名将会是program.log.1.gz、program.log.2.gz等直到program.log.5.gz
  create 0600 root root               指定所要创建的归档文件的模式、用户以及用户组
}

comment


