#!/bin/bash

echo "Total of the arguments passed $#"

echo "The process Id is $$"

echo "Last argument os "$(eval echo \$$#)""

#eval chun="\$$#"

#echo $chun

echo "$(eval echo \$$#)"

eval echo \$$#