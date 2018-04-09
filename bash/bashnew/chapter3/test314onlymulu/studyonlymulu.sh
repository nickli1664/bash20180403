#!/bin/bash

ls -d */

echo "-------------------------"

ls -F | grep "/$"          #实测grep “/” 也可

echo "-------------------------"

ls -l | grep "^d"

echo "-------------------------"

find . -maxdepth 1 -type d -print