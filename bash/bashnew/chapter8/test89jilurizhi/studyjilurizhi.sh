#!/bin/bash

#用 syslogd 进行日志信息的记录。
#使用命令 logger


#旧的或错误的说法：向系统日志文件/var/log/message中写入日志信息
#logger LOG_MESSAGE

logger This is a test log line

tail -n 10 /var/log/syslog

echo '--------'
#旧的或错误的说法：/var/log/messages是一个通用日志文件。如果使用 logger 命令,它默认将日志信息记录到 /var/log/messages中。
#注意，在ubuntu 16.04中，logger的默认写入位置是 /var/log/syslog

#如果要记录特定的标记(tag),可以使用
logger -t TAG This is a message

tail -n 10 /var/log/syslog

#Syslog 处理/var/log下的多个日志文件。但是当 logger 发送消息时,它用标记字符串来确定应该记录到哪一个日志文件中。
# syslogd 使用与日志相关联的TAG来决定应该将其记录到哪一个文件中。你可以从/etc/rsyslog.d/目录下的配置文件中看到标记字符串以及与其相关联的日志文件。

#要将另一个日志文件的最后一行记录到系统日志中,可以使用
#logger -f /var/log/source.log
