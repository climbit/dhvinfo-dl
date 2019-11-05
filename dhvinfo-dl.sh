#!/bin/sh

num=0
while :
do
	num=$(expr $num + 1)
	fname=dhvinfo$num.pdf
	
	if [ -f $fname ]
	then
		continue
	fi
	
	wget https://www.dhv.de/fileadmin/user_upload/dhvinfos/$fname
	
	file $fname|grep -i html > /dev/null
	if [ $? -eq 0 ]
	then
		rm $fname
		break
	fi
done
