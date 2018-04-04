#!/bin/bash

dd if=/dev/zero of=loopbackfile.img bs=1G count=1          #创建一个1GB大小的文件



mkfs.ext4 loopbackfile.img                                #用 mkfs 命令将1GB的文件格式化成ext4文件系统


file loopbackfile.img                                      #检查文件系统


echo -------------

#mkdir /mnt/loopback
#mount -o loop loopbackfile.img /mnt/loopback               # -o loop 用来挂载环回文件系统

#umount /mnt/loopback                                       #卸载
# umount /dev/loop1                                        #也可以这样卸载


#losetup /dev/loop1 loopbackfile.img
#fdisk /dev/loop1                                           #手动建立设备并挂载分区

#分支1
losetup -o 32256 /dev/loop2 loopbackfile.img                #在loopback.img中创建分区并挂载第一个分区

#losetup -d /dev/loop2                                      #卸载设备 注意不要与umount混淆


#分支2
#快速挂载带有分区的换回磁盘镜像（进行这一步骤前需要先使用fdisk分区）
#kpartx -v -a diskimage.img
#挂载第一个分区
# mount /dev/mapper/loop0p1 /mnt/disk1
#移除映射关系
#kpartx -d diskimage.img

#结束上面两个分支

#将ISO文件作为环回文件挂载

#mkdir /mnt/iso
#mount -o loop linux.iso /mnt/iso


#使用 sync 即刻应用更改
#当对挂载设备作出更改之后,这些改变并不会被立即写入物理设备。只有当缓冲区被写满之后才会进行设备回写。但是我们可以用 sync 命令强制将更改即刻写入

# sync


