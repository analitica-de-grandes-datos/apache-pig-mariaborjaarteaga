

lines = LOAD 'data.csv' USING PigStorage(',') AS ( A: int,  B:chararray,  C:chararray,  D:chararray,  E:chararray,  F:chararray ); 
 
conjunto = FOREACH lines GENERATE B, E; 
resultado = FILTER conjunto BY (B MATCHES '.*^[kK].*') OR (E == 'blue'); 

STORE resultado INTO 'output' USING PigStorage(',');