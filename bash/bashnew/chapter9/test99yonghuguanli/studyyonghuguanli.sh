#!/bin/bash


function usage()
{
    echo Usage:
    echo Add a new user
    echo $0 -adduser username password
    echo
    echo Remove an existing user
    echo $0 -deluser username
    echo
    echo Set the default shell for the user
    echo $0 -shell username SHELL_PATH
    echo
    echo Suspend a user account
    echo $0 -disable username
    echo
    echo Enable a suspended user account
    echo $0 -enable username
    echo
    echo Set expiry date for user account
    echo $0 -expiry DATE
    echo
    echo Change password for user account
    echo $0 -passwd username
    echo
    echo Create a new user group
    echo $0 -newgroup groupname
    echo
    echo Remove an existing user group
    echo $0 -delgroup groupname
    echo
    echo Add a user to a group
    echo $0 -addgroup username groupname
    echo
    echo Show details about a user
    echo $0 -details username
    echo
    echo Show usage
    echo $0 -usage
    echo
    exit                                                             #注意这里有个退出
} #类似于说明文件

if [ $UID -ne 0 ];                                                   #UID是描述当前用户的一个环境变量，好像root肯定是0
then
    echo Run $0 as root.
    exit 2
fi

#下面考察&&  左边命令返回真才执行右边
case $1 in
    -adduser) [ $# -ne 3 ] && usage ; useradd $2 -p $3 -m ;;
    -deluser) [ $# -ne 2 ] && usage ; deluser $2 --remove-all-files;;
    -shell) [ $# -ne 3 ] && usage ; chsh $2 -s $3 ;;
    -disable) [ $# -ne 2 ] && usage ; usermod -L $2 ;;
    -enable) [ $# -ne 2 ] && usage ; usermod -U $2 ;;
    -expiry) [ $# -ne 3 ] && usage ; chage $2 -E $3 ;;
    -passwd) [ $# -ne 2 ] && usage ; passwd $2 ;;
    -newgroup) [ $# -ne 2 ] && usage ; addgroup $2 ;;
    -delgroup) [ $# -ne 2 ] && usage ; delgroup $2 ;;
    -addgroup) [ $# -ne 3 ] && usage ; addgroup $2 $3 ;;
    -details) [ $# -ne 2 ] && usage ; finger $2 ; chage -l $2 ;;
    -usage) usage ;;
    *) usage ;;
esac

#useradd 命令可以用来创建新用户
#useradd USER -p PASSWORD
#选项 -m 用来创建home目录。也可以用选项 -c FULLNAME 提供用户的全名。

#deluser USER                             #deluser 命令用来删除用户。
#--remove-all-files 用来删除与用户相关的所有文件,包括home目录。

#chsh 命令用来修改用户的默认shell。
#chsh USER -s SHELL

#usermod 命令用来处理和用户账户相关的若干属性信息。 
#usermod -L USER 和 usermod -U USER 分别用来锁定和解锁用户账户。

#chage 命令用来处理用户账户的过期信息。
#chage -E DATE
#-m MIN_DAYS (将更改密码的最小天数修改成 MIN_DAYS )
#-M MAX_DAYS (设置密码有效的最大天数)
#-W -WARN_DAYS (设置在前几天提醒需要更改密码)。

#passwd 命令用来更改用户密码
#passwd USER

#addgroup 命令会为系统添加一个新的用户组。
#addgroup GROUP
#将已有的用户添加到一个组
#addgroup USER GROUP

#delgroup 命令会删除一个用户组
#delgroup GROUP

#finger USER 命令会显示用户信息,这包括用户的home目录、上一次登录的时间、默认shell等。 
#chage -l 命令会显示用户账户的过期信息。



