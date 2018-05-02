#!/bin/bash


#抓取整个屏幕

import -window root screenshot.png

#手动选择部分区域进行抓取
#import screenshot.png                #感觉这个效果不好

#抓取特定窗口
#import -window window_id screenshot.png
#使 用 命 令 xwininfo , 点 击 需 要 抓 取 截 图 的 窗 口 来 获 得 window_id 。 
#然 后 将window_id 传递给 import 命令的 -window 选项。

