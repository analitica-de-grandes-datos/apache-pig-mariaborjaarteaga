/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' using PigStorage('\t') AS (letra:chararray,dic:chararray,lista:chararray);

resultado1 = FOREACH lines GENERATE FLATTEN(TOKENIZE(dic)) AS pa;
resultado2 = GROUP resultado1 by pa;
resultado3 = FOREACH resultado2 GENERATE group,COUNT(resultado1);
resultado = LIMIT resultado3 7;


STORE resultado INTO 'output' USING PigStorage(',');