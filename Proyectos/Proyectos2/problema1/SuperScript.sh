#!/bin/bash

DATA=/home/sysadmin/LXS2_cvl/Proyectos/Proyectos2/problema1/hojasDatos
OUT_DATA=$DATA/datos_csv
GRAF_DATA=$OUT_DATA/datos_graf
FULL_DATA=$DATA/full_datos

mkdir $OUT_DATA
mkdir $GRAF_DATA
mkdir $FULL_DATA


##### Script para añadir datos de un archivo .xls a .csv #####
m=0

for i in `find $DATA -name '*.xls'`
do
        echo "Procesando archivo $i"
        xls2csv $i > $OUT_DATA/data-$m.csv
        let m=m+1
done 2>error1.log



##### Script para darle formato a los datos para graficarlos #####
m=0

for e in `find $DATA -name "*.csv"`
do
        echo "Dando formato de datos para graficar el archivo $e"
        cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5}' | sed '1,$ s/"//g' | sed '1 s/date/#date/g' > $GRAF_DATA/graf-$m.dat
        let m=m+1
done 2>error2.log



##### Script para la limpieza de archivos duplicados #####
if [ -a $FULL_DATA/full.dat ]
then
rm $FULL_DATA/full.dat
echo "Archivo full.dat borrado"
fi 2>error3.log



##### Script eliminar la 1era línea de cada archivo y hacer un solo gráfico#####
for k in `find $GRAF_DATA -name "*.dat"`
do
sed '1d' $k >> $FULL_DATA/full.dat
echo "Procesando archivo $k"
done 2>error4.log


FMT_BEGIN='20110209 0004'
FMT_END='20110209 0010'
FMT_X_SHOW="%H: %M"
DATA_DONE=$FULL_DATA/full.dat

graficar()
{
        gnuplot << EOF 2>error4.log
        set xdata time
        set timefmt "%Y%m%d %H%M"
        set xrange ["$FMT_BEGIN" : "$FMT_END"]
        set format x "$FMT_X_SHOW"
        plot "$DATA_DONE" using 1:3 with lines title "sensor1","$DATA_DONE" using 1:4 with linespoints title "sensor2"
        set terminal png
        set output 'fig1.png'

EOF

}

graficar
