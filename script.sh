#!/bin/bash
while true; do
	if [ -z "$1" ]; then
		read -p "Introdu calea catre director: " CALE_DIRECTOR
	else
		CALE_DIRECTOR=$1
	fi
	if [ ! -d "$CALE_DIRECTOR" ]; then
		echo "Directorul $CALE_DIRECTOR introdus nu exista"
		continue # Sari la inceputul while-ului si cere alt director de la user
	fi
	if [ ! -r "$CALE_DIRECTOR" ]; then
		echo "Nu ai drept de read in $CALE_DIRECTOR"
		continue
	else
		break # Iesi din while si continua cu instructiunile de mai jos
	fi
done
# Intai rezolvam calea absoluta a firectorului
CALE_ABSOLUTA_DIRECTOR=$(cd $CALE_DIRECTOR && pwd)
echo "Calea absoluta este $CALE_ABSOLUTA_DIRECTOR"
if [[ $CALE_ABSOLUTA_DIRECTOR == /etc* ]]; then
	echo "Acces interzis"
	exit 1
fi
NUMAR_DE_FISIERE=$(ls -al $CALE_DIRECTOR | wc -l)
echo "Sunt $NUMAR_DE_FISIERE fisiere in directorul $CALE_DIRECTOR"

