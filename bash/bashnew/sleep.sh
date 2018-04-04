#!/bin/bash

#!/bin/bash
#文件名: sleep.sh
echo -n Count:
tput sc                           #保存当前光标位置，如果不加这条命令，会无故删除一些内容
count=0;
while true;
do
    if [ $count -lt 40 ];
    then
        let count++;
        sleep 1;
        tput rc                   #显示输出？   这里实际为：“恢复光标位置”
        tput ed                   #删除光标到行尾的数据   这两句组合使用会删除上一次输出的内容
        echo -n $count;
        else exit 0;
    fi
done