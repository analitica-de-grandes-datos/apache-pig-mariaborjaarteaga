

lines = LOAD './data.csv' USING PigStorage(',') AS (id:int, nombre:CHARARRAY, apellido:CHARARRAY,  birthday:CHARARRAY, color:CHARARRAY, cantidad:INT);

resultado1 = FILTER lines BY (color matches 'blue') or (color matches 'black');
resultado = FOREACH resultado1 GENERATE nombre, color;


STORE resultado into 'output/' USING PigStorage(','); 

