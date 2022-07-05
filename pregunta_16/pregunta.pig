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
   WHERE color = 'blue' OR firstname LIKE 'K%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/


lines = LOAD 'data.csv' USING PigStorage(',') AS ( A: int,  B:chararray,  C:chararray,  D:chararray,  E:chararray,  F:chararray ); 
 
conjunto = FOREACH lines GENERATE B, E; 
resultado = FILTER conjunto BY (B MATCHES '.*^[kK].*') OR (E == 'blue'); 

STORE resultado INTO 'output' USING PigStorage(',');