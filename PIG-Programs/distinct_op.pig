student_details = LOAD './Data/student_details.txt'
USING PigStorage(',')
AS (id:int, fname:chararray, lname:chararray, age:int, mob:chararray, address:chararray);

-- distinct_records = DISTINCT student_details;

distinct_cities = FOREACH (DISTINCT student_details) GENERATE address; 

Dump distinct_cities;