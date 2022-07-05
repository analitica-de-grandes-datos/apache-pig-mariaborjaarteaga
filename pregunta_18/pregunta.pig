

lines = LOAD './data.csv' USING PigStorage(',') AS (id:int, nombre:CHARARRAY, apellido:CHARARRAY,  birthday:CHARARRAY, color:CHARARRAY, cantidad:INT);

resultado1 = FOREACH lines GENERATE nombre, color;
resultado = FILTER resultado1 BY NOT (color  MATCHES '.*b.*');

STORE resultado into 'output/' USING PigStorage(',');