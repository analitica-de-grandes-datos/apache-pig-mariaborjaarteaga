/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, color 
   FROM 
       u
   WHERE color IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/



lines = LOAD './data.csv' USING PigStorage(',') AS (id:int, nombre:CHARARRAY, apellido:CHARARRAY,  birthday:CHARARRAY, color:CHARARRAY, cantidad:INT);

resultado1 = FILTER lines BY (color matches 'blue') or (color matches 'black');
resultado = FOREACH resultado1 GENERATE nombre, color;


STORE resultado into 'output/' USING PigStorage(','); 

