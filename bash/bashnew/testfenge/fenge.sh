#!/bin/bash

split -b 10k data.png    #将该文件分割成多个大小为10KB的文件   可选参数  -d （数字后缀）-a （后缀长度）

#split -b 10k data.file -d -a 4 split_file          #以split_file为前缀

#split -l 10 data.file                              # 分割成多个文件,每个文件包含10行

csplit server.log /SERVER/ -n 2 -s {*} -f server -b "%02d.log"    #csplit根据文件内容分割


#  /SERVER/ 用来匹配某一行,分割过程即从此处开始。
#  /[REGEX]/ 表示文本样式。包括从当前行(第一行)直到(但不包括)包含“ SERVER ”的匹配行。
#  {*} 表示根据匹配重复执行分割,直到文件末尾为止。可以用{整数}的形式来指定分割执行的次数。
#  -s 使命令进入静默模式,不打印其他信息。
#  -n 指定分割后的文件名后缀的数字个数,例如01、02、03等。
#  -f 指定分割后的文件名前缀(在上面的例子中,server就是前缀)。
#  -b 指定后缀格式。例如 %02d.log ,类似于C语言中 printf 的参数格式。在这里文件名=前缀+后缀= server + %02d.log 。