#!/bin/bash

#这个命令也基于ssh，类似于scp。所以同样需要设置自动登录

#将源目录复制到目的端
#rsync -av source_path destination_path


rsync -avz /home/nickli/Desktop/pic testnick1@192.168.0.6:/home/testnick1/Desktop
#-a 表示要进行归档;
#-v表示 在 stdout 上打印出细节信息或进度。
#-z  压缩

#将远程主机上的数据恢复到本地主机
#rsync -av username@host:PATH destination



#排除指定的文件
#rsync -avz /home/code/some_code /mnt/disk/backup/code --exclude "*.txt"
#或者我们可以通过一个列表文件指定需要排除的文件。
#这可以利用 --exclude-from FILEPATH 。


#在更新 rsync 备份时,删除源端不存在的文件
#rsync -avz SOURCE DESTINATION --delete

