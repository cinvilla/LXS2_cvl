#!/bin/bash

errorlog="$0.err"

#La salida estándar de error estará redireccionada al archivo if-then.sh.err
if cp archivo.txt archivo1.txt.bck 2> $errorlog
then 
  echo "El archivo1.txt fue correctamente respaldado..."
  echo "Eliminando archivo original"
   # Ejemplo de un "if" anidado, una condición contenida dentro de otra...
  if rm archivo1.txt
  then
    echo "EL archivo original fue eliminado correctamente..."
   else
    echo "No se pudo eliminar el archivo..."
   fi
else
  echo "El archivo1.txt no pudo ser respaldado, verifique el log: $errorlog"
fi

"if-anidado.sh"

