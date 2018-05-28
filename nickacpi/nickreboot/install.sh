#!/bin/bash

echo "reboot install"
echo "请先设置root密码 sudo passwd root 并使用root运行, 否则程序无法工作"
echo
echo "本测试程序会修改以下系统文件，如果需要请先进行备份操作"
echo "/opt/lightdm/lightdm.conf"
echo "/root/.profile"
echo "本测试程序使用~/.profile实现登录自动运行，请确保您的环境中没有其他程序与之冲突"
echo 
echo "按回车键即执行修改，退出ctrl+c "
read 
cp lightdm.conf /etc/lightdm/lightdm.conf
cp profile /root/.profile
echo
echo "60s 后重启系统并进入root"
sleep 60
reboot

