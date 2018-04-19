#!/bin/bash

#awk '{ print $5 }' filename    #打印第五列

ls -l ../test49anliehebing | awk '{ print $1 " :  " $9 }'