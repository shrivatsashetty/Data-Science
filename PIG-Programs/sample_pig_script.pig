student = LOAD './Data/students.txt' 
USING PigStorage(',') as (id:int,name:chararray,city:chararray);
  
Dump student;
