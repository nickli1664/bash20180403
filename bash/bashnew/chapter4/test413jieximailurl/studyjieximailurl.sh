#!/bin/bash

#解析文本中的电子邮件地址和 URL

egrep -o '[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,4}' url_email.txt   #匹配email

echo "--------"

egrep -o '[a-zA-Z]+://[a-zA-Z0-9.]+\.[a-zA-Z0-9]{2,4}' url_email.txt     #匹配url

#这里匹配的url只是根地址？限制比较大
