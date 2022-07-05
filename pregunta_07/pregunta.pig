/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' using PigStorage('\t') AS (letra:chararray,dic:bag{},lista:map[]);

resultado1= FOREACH lines GENERATE letra, COUNT(dic) as dic, SIZE(lista) as lista;
resultado = ORDER resultado1 by letra,dic,lista;

STORE resultado INTO 'output' USING PigStorage(',');