#!/bin/bash

#dd if=/dev/cdrom of=image.iso        创建ISO镜像

#mkisofs -V "Label" -o image.iso source_dir/           将需要的所有文件放入同一个目录中,然后用mkisofs 将整个目录的内容写入一个ISO文件。

#isohybrid image.iso                  获得一个名为image.iso的混合ISO,它可用于写入USB存储设备。

#dd if=image.iso of=/dev/sdb1         将该ISO写入USB存储设备

#cdrecord -v dev=/dev/cdrom image.iso -speed 8        将ISO文件刻入CD-ROM或DVD-ROM

#eject                                弹出光驱

#eject -t                             合上光驱（测试不可用）