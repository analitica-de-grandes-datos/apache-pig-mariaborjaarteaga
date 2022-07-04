/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.csv' USING PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, valor:int);

resultado1 = FOREACH lines GENERATE SUBSTRING(fecha,0,3);
resultado2 = GROUP resultado1 BY year;
resultado = FOREACH resultado2 GENERATE group, COUNT(resultado1);

STORE resultado INTO 'output' using PigStorage(',');