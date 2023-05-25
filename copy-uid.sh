#!/bin/bash
echo "Копирование UID пропуска из 4 байт"
echo -n "Владелец пропуска: "
read -r filename
if [ -s "./$filename.uid" ]; then
	echo "Пропуск найден в базе"
	uid=`cat ./$filename.uid | tr -d [:space:]`
else
	echo "Поднесите оригинал и нажмите ENTER"
	read
	uid=`nfc-list | grep -m 1 "(NFCID1)" | cut -d ":" -f 2 | tr -d [:space:]`
	if [ -n "$uid" ]; then echo -n $uid > ./$filename.uid ; fi
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

