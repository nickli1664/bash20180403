#!/bin/bash

cat /proc/cpuinfo | \
awk '{ if (NR==5){print $0}}'

echo "--------"

cat /proc/cpuinfo | sed -n 5p

