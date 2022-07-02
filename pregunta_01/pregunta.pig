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
lines= LOAD './data.tsv' AS (letra:chararray, fecha:chararray, total:int);

-- agrupar registros por letra
lines_g=GROUP lines BY letra;

-- contar
lines_c=FOREACH lines_g GENERATE group, COUNT(lines);
