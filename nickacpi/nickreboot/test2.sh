#!/bin/bash

a=`cat cur`
echo $a

let ap=a+1
echo $ap


#echo -n "loop 3 - " >>log
#echo `date`>>log


b=`pwd`
echo $b

#echo >>~/.profile
#echo >>~/.profile
#echo gnome-terminal -x $b/nickrootrb.sh --geometry=80x25+150+100 >>~/.profile

#sed -i '3 r $b' nickrootrb.bak

#cat nickrootrb.bak | awk -v b=$b 'BEGIN {print "#!/bin/bash"; print ""; printf "cd "; print b} {print $0 }' > nickrootrb.sh

#chmod u+x nickrootrb.sh

sed -i '/gnome-terminal/d' ~/.profile
