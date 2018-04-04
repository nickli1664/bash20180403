#!/bin/bash
# 文件名: filestat.sh
if [ $# -ne 1 ];                                   # $#表示参数个数，-ne表示不等于
then
    echo "Usage is $0 basepath";
exit
fi
path=$1

declare -A statarray;                              #声明一个关联数组

#find $path -type f -print >nick                    #这种方式会多算一个text，先不用
#cat nick | while read line;                       #这里千万不能使用管道，因为管道会触发新的子进程，而子进程内无法修改原进程的关联数组
while read line;
do
    ftype=`file -b "$line" | cut -d , -f 1`        #使用 cut -d ,-f 1 ,指明以逗号作为定界符,并且只打印第一个字段
    let statarray["$ftype"]++;
#done <nick
done < <(find $path -type f -print)                #第一个<用于输入重定向,第二个<用于将子进程的输出装换成文件名。
#done <<< "`find $path –type f –print`"            # 实测会有报错信息，存疑

echo ============ File types and counts =============

for ftype in "${!statarray[@]}";                   # ${!statarray[@]}   获取数组的索引列表  这里容易记错，加！为列出索引，不加！为列出键值
do
    echo $ftype : ${statarray["$ftype"]}           
done

#find $path -type f -print > nick

#在Bash 3.x及更高的版本中,有一个新操作符 <<< ,可以让我们将字符串作为输入文件。利用这个新操作符,可以将 loop 循环的 done 语句改写成
# done <<< "`find $path –type f –print`"
# 实测会有报错信息，存疑


#每次调用read命令都会读取文件中的"一行"文本。当文件没有可读的行时，read命令将以非零状态退出。
#读取文件的关键是如何将文本中的数据传送给read命令。
#最常用的方法是对文件使用cat命令并通过管道将结果直接传送给包含read命令的while命令