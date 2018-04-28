#!/bin/bash

#主要使用watch 命令

#格式为 watch 'COMMANDS'    注意在复杂命令，例如管道时，单引号不可少

#watch 'ls -l | grep "^d"'          #只列出目录

#命令默认每2秒更新一次输出。用 -n SECOND 指定更新输出的时间间隔。
watch -n 5 'ls -l'
#以5秒为间隔,监视ls -l的输出

#watch 有一个选项可以将时间间隔前后的命令输出的差异之处以不同颜色突出标示出来。 -d
#watch -d 'COMMANDS'


