#!/bin/bash

#echo $LD_LIBRARY_PATH

#a="/bin"
a="/s"
b="/b"

#prepend() { [ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1; }     #这个地方有点不好理解，\$$1相当于取值两次的间接引用，此时必须使用eval

#prepend() { [ -d "$2" ] && eval $1=$2\$\{$1:+':'\$$1\} && export $1 ; }

prepend() { [ -d "$2" ] && 
il1=$1
eval il2=${il1:+':'\$$1}
#echo $il2
eval $1=$2$il2 &&                             
export $1 ; }

#prepend() { [ -d "$2" ] && eval $1='$2\$\{$1:+':'\$$1\}' && 
#echo ${$1:+$b} && 
#echo '$2\$\{$1:+':'\$$1\}' && 
#export $1 ; }

prepend a /home

echoshi