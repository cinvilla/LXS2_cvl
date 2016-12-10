#!/bin/bash

## Este script require 3 parámetros
## ./resumen.sh <param1> <param2> <param3>

# Definición de variables

PARAMETROS=3

if [ [ $# != $PARAMETROS ] ]
then 
       echo "Error:
       La forma de utilizar el script es la siguiente
       $0 <param1> <param2> <param3>
       "
       exit 1
else 
       echo "El número de parámetros fue correcto, y es $#"
       if [ [ $2 ==  casa ] ]
       then
           echo "El parámetro 2 es casa"
       else 
           echo "El parámetro 2 NO es casa"
       fi
     
fi

echo "Los parámetros fueron"
echo $@

exit 0

