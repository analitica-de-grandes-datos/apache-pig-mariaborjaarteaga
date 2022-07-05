/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       color 
   FROM 
       u
   WHERE color NOT IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/

fs -rm -f -r output;
lines = LOAD 'data.csv' USING PigStorage(',') AS (id:int, nombre:CHARARRAY, apellido:CHARARRAY,  birthday:CHARARRAY, color:CHARARRAY, cantidad:INT);

resultado1 = FOREACH lines GENERATE nombre, color;
resultado = FILTER resultado1 BY color != 'blue' AND color != 'black';

STORE resultado into 'output' USING PigStorage(',');