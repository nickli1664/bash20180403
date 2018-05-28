#!/bin/bash

if [[ $# -ne 1 ]];
then
    echo "Usage: $0 loop"
    exit -1
fi

echo $1 | egrep "^[0-9]+$" >/dev/null

if [[ $? -ne 0 ]];
then
    echo "Usage: $0 loop"
    exit -1
fi

#echo pass

echo 1 > nickcur
echo $1 >total

b=`pwd`
echo $b

cat nickrootrb.bak | awk -v b=$b 'BEGIN {print "#!/bin/bash"; print ""; printf "cd "; print b} {print $0 }' > nickrootrb.sh

chmod u+x nickrootrb.sh


echo >>~/.profile
echo >>~/.profile
echo gnome-terminal -x $b/nickrootrb.sh --geometry=80x25+150+100 >>~/.profile

echo "reboot $1"
echo "reboot begin after 30s!"
sleep 30
reboot

