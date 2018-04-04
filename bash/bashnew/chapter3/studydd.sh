#!/bin/bash

#dd生成文件


dd if=/dev/zero of=junk.data bs=1M count=1
#该命令会创建一个1MB大小的文件junk.data。if 代表输入文件(input file),of 代表输出文件(output file), bs 代表以字节为单位的块大小(block size), count 代表需要被复制的块数。

