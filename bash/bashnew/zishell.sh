#!/bin/bash

cat out2.txt

out=$(cat out2.txt)
echo $out                      # Lost \n spacing 

out="$(cat out2.txt)"
echo $out                      #实测没有效果，与预期不符，存疑。