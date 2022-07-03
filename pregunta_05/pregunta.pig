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
lines = LOAD 'data.tsv' AS (letra:chararray, dic:BAG{}  chararray, lista:chararray);
resultado1 = FOREACH lines GENERATE dic;
letras = FOREACH resultado1  GENERATE FLATTEN(TOKENIZE(dic)) AS letra;
grouped = GROUP letras BY letra;
wordcount = FOREACH grouped GENERATE group, COUNT(letras);