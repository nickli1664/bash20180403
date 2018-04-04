#!/bin/bash

date

date --date "March 20 2018" +%A                                    #必须要有加号

date "+%d %B %Y"


start=$(date +%s)                                                  #获取命令所花费的时间

ls

end=$(date +%s)
difference=$(( end - start))
echo Time taken to execute commands is $difference seconds.


#也可以使用time<scriptpath>