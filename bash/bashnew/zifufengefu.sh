#!/bin/bash

data="name,sex,rollno,location"

oldIFS=$IFS
IFS=,                                      #shell将逗号视为一个定界符
for item in $data;
do
    echo Item: $item
done
IFS=$oldIFS