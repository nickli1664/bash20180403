#!/bin/sh
read name 
echo "$name It is a test"

#echo -e "OK! \n" # -e 开启转义
echo "OK! \n" # -e 开启转义
echo "It it a test"

#!/bin/sh
#echo -e "OK! \c" # -e 开启转义 \c 不换行
echo "OK! \c" # -e 开启转义 \c 不换行
echo "It is a test"

echo "It is a test" > myfile

echo '$name\"'

echo `date`