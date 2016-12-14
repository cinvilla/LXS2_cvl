#!/bin/bash

DATA=/home/sysadmin/LXS2_cvl/Proyectos/Proyectos2/problema1/hojasDatos/datos_csv
GRAF_DATA=$DATA/datos_graf

mkdir $GRAF_DATA

for e in `find $DATA -name "*.csv"`
do
	echo "Dando formato de datos para graficar el archivo $e"
	cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5}' | sed '1,$ s/"//g' | sed '1 s/date/#date/g' > $GRAF_DATA/graf-$m.dat
	let m=m+1
done 2>error2.log 
 
