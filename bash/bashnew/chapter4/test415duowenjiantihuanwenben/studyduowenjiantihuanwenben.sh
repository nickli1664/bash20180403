#!/bin/bash

#将所有.cpp文件中的 Copyright 替换成 Copyleft
#find . -name *.cpp -print0 | xargs -I {} -0 sed -i 's/Copyright/Copyleft/g' {}

#利用-exec 对每个 find 查找到的文件执行命令。
#find . -name *.cpp -exec sed -i 's/Copyright/Copyleft/g' \{\} \;
#find . -name *.cpp -exec sed -i 's/Copyright/Copyleft/g' \{\} \+
#这里后面的{}为何必须要加转义，不太理解 -nick20180422

#尽管这两个命令作用相同,但第一个命令会为每个查找到的文件调用一次 sed ,而在第二个命令中, find 会将多个文件名一并传递给 sed 。

