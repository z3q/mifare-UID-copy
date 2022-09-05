#!/bin/bash
echo -n "Владелец пропуска: "
read -r filename
if [ -s "./$filename.uid" ]; then
	uid=`cat $filename.uid | tr -d [:space:]`
else
	uid=`nfc-list | grep -m 1 "(NFCID1)" | cut -d ":" -f 2 | tr -d [:space:]`
	echo -n $uid > ./$filename.uid
fi
if [ -n "$uid" ]; then 
	echo "Номер пропуска: $uid"
	uid4=`echo $uid | cut -c1-8`
	while :
	do
		echo "Поднесите заготовку и нажмите ENTER; для выхода <CTRL+C>"
		read
		nfc-mfsetuid $uid4
	done
else echo "нет пропуска" 
fi 

