#!/bin/bash

#移除包含“mobile phones”的句子

sed 's/[^.]*mobile phones[^.]*\.//g' sentence.txt

#这里假设没有句子分散在不同的行中。也就是说,句子总是在同一行中起止。

