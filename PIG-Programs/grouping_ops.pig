student_details = LOAD './Data/student_details.txt'
USING PigStorage(',')
AS (id:int, fname:chararray, lname:chararray, age:int, mob:chararray, address:chararray);

-- cogroup is used to group data across two different datasets
emp_details = LOAD './Data/employees.txt'
USING PigStorage(',')
AS (id:int, fname:chararray, age:int, address:chararray);

/* group, multigroup and cogroup */

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









