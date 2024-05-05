/* group, multigroup and cogroup */

student_details = LOAD './Data/student_details.txt'
USING PigStorage(',')
AS (id:int, fname:chararray, lname:chararray, age:int, mob:chararray, city:chararray);

-- -- cogroup is used to group data across two different datasets
-- emp_details = LOAD './Data/employees.txt'
-- USING PigStorage(',')
-- AS (id:int, fname:chararray, age:int, city:chararray);

-- /* results of grouped data */
-- grouped_data = GROUP student_details BY address;
-- Dump grouped_data;

-- /* multi group output */
-- multi_grp_data = GROUP student_details BY (address, age);
-- Dump multi_grp_data;

-- /* group all aoutput */
-- grp_all_data = GROUP student_details ALL;
-- Dump grp_all_data;

-- /* cogroup output */
-- cogrp_data = cogroup student_details by age, emp_details by age;
-- Dump cogrp_data;

-- Dump student_details;

filtered_data = FILTER student_details BY city == 'Chennai' OR city == 'Kolar' ;
-- Dump filtered_data;

/* COUNT() aggregation operation */
-- since count is an aggregation operator, we first need to group the data
count_filtered_data = FOREACH (GROUP filtered_data ALL) 
GENERATE COUNT(filtered_data);

Dump count_filtered_data; -- (3)






