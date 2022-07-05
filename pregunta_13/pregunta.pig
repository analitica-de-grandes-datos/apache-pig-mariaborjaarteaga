

lines = LOAD './data.csv' USING PigStorage(',') AS (id:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, valor:int);

resultado1 = FOREACH lines GENERATE color;
rasultado = FILTER resultado1  BY ($0 matches '.*b.*');

STORE resultado INTO 'output/' using PigStorage(',');