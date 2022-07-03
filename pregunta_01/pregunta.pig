/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
--Carga de datos
lines = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, valor:int);

resultado1 = ORDER lines BY letra,valor asc;
resultado = FOREACH resultado1 GENERATE letra,valor;
STORE resultado INTO 'output' using PigStorage(',');