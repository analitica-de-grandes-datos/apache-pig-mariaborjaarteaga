/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' using PigStorage('\t') AS (letra:chararray,dic:bag{},lista:[]);

resultado1 = FOREACH lines GENERATE FLATTEN($1), FLATTEN($2);
resultado2 = GROUP resultado1 BY ($0, $1);
resultado = FOREACH resultado2 GENERATE group, COUNT(resultado1);

STORE resultado INTO 'output' USING PigStorage(',');