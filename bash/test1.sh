 #!/bin/bash

echo "Hello World !" 
your_name="tom"
echo $your_name
your_name="alibaba"
echo $your_name

greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting $greeting_1

string="abcd"
echo ${#string} #输出 4

string="runoob is a great site"
echo ${string:1:4} # 输出 unoo

string="runoob is a great company"
echo `expr index "$string" is`  # 输出 8