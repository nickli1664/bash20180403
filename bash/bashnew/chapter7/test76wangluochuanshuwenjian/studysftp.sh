#!/bin/bash

<<comment
SFTP是一个类似于FTP的文件传输系统,它运行在SSH连接之上并模拟成FTP接口。它不需
要远端运行FTP服务器来进行文件传输,但必须安装并运行OpenSSH服务器。SFTP是一个交互式
命令,提供了命令提示符。
comment

#使用方法与lftp大同小异

#sftp -oPort=422 user@slynux.org  #指定端口，-oPort 应该作为 sftp 命令的第一个参数。默认为22（与ssh一样）


