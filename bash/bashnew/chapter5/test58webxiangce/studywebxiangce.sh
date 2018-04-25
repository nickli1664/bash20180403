#!/bin/bash

#当前目录下的图片创建相册

echo "Creating album.."
mkdir -p thumbs
#这里考察EOF重定向概念，脚本内部文本块重定向
cat <<EOF1 > index.html                         
<html>
<head>
<style>

body
{
  width:470px;
  margin:auto;
  border: 1px dashed grey;
  padding:10px;
}

img
{
  margin:5px;
  border: 1px solid black;
}
</style>
</head>
<body>
<center><h1> #Album title </h1></center>
<p>
EOF1


#对每一个jpg文件进行迭代，注意这里的扩展名不能错误
for img in *.jpg;
do
    convert "$img" -resize "100x" "thumbs/$img"                   #创建宽度为100像素的图像缩略图。
    echo "<a href=\"$img\" ><img src=\"thumbs/$img\" title=\"$img\" /></a>" >> index.html   #生成所需的 <img> 标记并将其追加到index.html中
done

cat <<EOF2 >> index.html

</p>
</body>
</html>
EOF2
echo Album generated to index.html
