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

resultado1 = FOREACH lines GENERATE $3,ToString(ToDate($3,'yyyy-MM-dd'),'dd'),GetDay(ToDate($3,'yyyy-MM-dd')), ToString(ToDate($3,'yyyy-MM-dd'),'EE'), ToString(ToDate($3,'yyyy-MM-dd'),'EEEE');
resultado = FOREACH resultado1 GENERATE $0, $1, $2, CASE $3 WHEN 'Mon' THEN 'lun' WHEN 'Tue' THEN 'mar' WHEN 'Wed' THEN 'mie' WHEN 'Thu' THEN 'jue' WHEN 'Fri' THEN 'vie' WHEN 'Sat' THEN 'sab' WHEN 'Sun' THEN 'dom' END, CASE $4 WHEN 'Monday' then 'lunes' WHEN 'Tuesday' then 'martes' WHEN 'Wednesday' then 'miercoles'WHEN 'Thursday' then 'jueves' WHEN 'Friday' then 'viernes' WHEN 'Saturday' then 'sabado' WHEN 'Sunday' then 'domingo' END;         


STORE resultado INTO 'output' using PigStorage(',');