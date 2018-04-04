#!/bin/bash


#rename *.JPG *.jpg      #有错？

rename 's/ /_/g' *       #将文件名中的空格替换成字符“ _ ”

rename 'y/a-z/A-Z/' *    #切换大小写

rename 'y/A-Z/a-z/' *

#find path -type f -name "*.mp3" -exec mv {} target_dir \;               #将所有的 .mp3文件移入给定的目录

#find path -type f -exec rename 's/ /_/g' {} \;                          #将所有文件名中的空格替换为字符“ _ ”   
#这两个例子再次巩固了find和-exec用法的重要性，{}的意思是find结果的形参


#count=1;
#for img in `find . -iname '*.png' -o -iname '*.jpg' -type f -maxdepth 1`          #最大深度为1，不进入子目录
#do
#    new=image-$count.${img##*.}

#    echo "Renaming $img to $new"
#    mv "$img" "$new"                           #mv本意为移动文件，这里为改名
#    let count++
#done

#该 脚 本 将 当 前 目 录 下 所 有 的 .jpg 和 .png 文 件 重 命 名 , 新 文 件 名 的 格 式 为 image-1.jpg 、image-2.jpg、image-3.jpg、image-4.png等,依次类推。

