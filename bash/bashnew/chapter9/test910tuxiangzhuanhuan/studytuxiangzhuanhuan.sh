#!/bin/bash

#使用convert 命令,来自Imagemagick软件包

#将一种图像格式转换为另一种图像格式
#convert INPUT_FILE OUTPUT_FILE

#convert file1.jpg file2.png


#convert image.png -resize WIDTHxHEIGHT image.png   #指定 WIDTH (宽度)或 HEIGHT (高度)来缩放图像
#convert image.png -resize 1024x768 image.png

#只提供WIDTH或HEIGHT，则按比例缩放
#convert image.png -resize 1024x image.png

#convert image.png -resize "50%" image.png          #指定百分比缩放图像

if [ $# -ne 4 -a $# -ne 6 -a $# -ne 8 ];
then
    echo Incorrect number of arguments
    exit 2
fi
#检查命令行参数的数量是否正确,可以出现的参数数量分别是4、6或8 -a 在这里是逻辑与


while [ $# -ne 0 ];
do
case $1 in
    -source) shift; source_dir=$1 ; shift ;;
    -scale) shift; scale=$1 ; shift ;;
    -percent) shift; percent=$1 ; shift ;;
    -dest) shift ; dest_dir=$1 ; shift ;;
    -ext) shift ; ext=$1 ; shift ;;
    *) echo Wrong parameters; exit 2 ;;
esac;
done
#经典的抓取参数，不要求固定位置


for img in `echo $source_dir/*` ;
do
    source_file=$img
    if [[ -n $ext ]];
    then
        dest_file=${img%.*}.$ext                  #这里考察提取名称的操作，参考2.12节
    else
        dest_file=$img
    fi

    if [[ -n $dest_dir ]];
    then
        dest_file=${dest_file##*/}                #同样参考2.12节 利用贪婪匹配，截取最后一个"/"后的文件名
        dest_file="$dest_dir/$dest_file"
    fi

    if [[ -n $scale ]];
    then
        PARAM="-resize $scale"
    elif [[ -n $percent ]];
    then
        PARAM="-resize $percent%"
    fi

    echo Processing file : $source_file
    convert $source_file $PARAM $dest_file
done




