#!/bin/bash

FMT_BEGIN='20110209 0004'
FMT_END='20110209 0010'
FMT_X_SHOW="%H: %M"

graficar()
{
	gnuplot << EOF 2>error3.log
	set xdata time
	set timefmt "%Y%m%d %H%M"
	set xrange ["$FMT_BEGIN" : "$FMT_END"]
	set format x "$FMT_X_SHOW"
	plot "graf-1.dat" using 1:3 with lines title "sensor1","graf-1.dat" using 1:4 with linespoints title "sensor2"
        set terminal png
        set output 'fig1.png'

EOF

}

graficar


