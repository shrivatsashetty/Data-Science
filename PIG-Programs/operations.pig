-- simple PIG script to illustrate operators in PIG
student_data = LOAD './Data/student_data.txt' 
USING PigStorage(',')
as (id:int, fname:chararray, lname:chararray, phno:chararray, city:chararray);

-- -- uncomment any one of the below operators and run

-- DESCRIBE student_data;

-- EXPLAIN student_data;

-- illustrate student_data;

