/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lines = LOAD 'data.tsv' using PigStorage('\t') AS (letra:chararray,dic:chararray,lista:map[]);

resultado1 = FOREACH lines GENERATE FLATTEN(lista) AS pa;
resultado2 = GROUP resultado1 by pa;
resultado = FOREACH resultado2 GENERATE group,COUNT(resultado1);

STORE resultado INTO 'output' USING PigStorage(',');

