#!/bin/bash


chmod u=rwx g=rw o=r foo

#u ——指定用户权限
#g ——指定用户组权限
#o ——指定其他实体权限

#用 + 进行添加权限,用 - 删除权限。

chmod u+x foo2

chmod a+x foo2         #a表示全部

#利用8进制表示。权限由3位八进制数来表示,每一位按顺序分别对应用户、用户组和其他用户。

#r-- = 4
#-w- = 2
#--x = 1

chmod 777 foo3

#更改所有权 chown
#chown user.group filename

#设置粘滞位
#chmod a+t directory_name

#递归
#chmod 777 . -R         #给当前目录下所有文件和子目录设置，  .  即为当前目录
#chown user.group . -R

#以不同的身份运行可执行文件
#chown root.root executable_file
#chmod +s executable_file
#现在,这个文件实际上每次都是以root用户的身份来执行。
