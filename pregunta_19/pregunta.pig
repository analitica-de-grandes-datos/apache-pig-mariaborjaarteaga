


lines = LOAD './data.csv' USING PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, valor:int);

resultado1 = FILTER lines BY color matches '^b.*' ;
resultado = FOREACH resultado1 GENERATE nombre, color;

STORE resultado INTO 'output/' using PigStorage(',');