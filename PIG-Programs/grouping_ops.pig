student_details = LOAD './Data/student_details.txt'
USING PigStorage(',')
AS (id:int, fname:chararray, lname:chararray, age:int, mob:chararray, address:chararray);

/* group and multigroup */

-- grouped_data = GROUP student_details BY address;

-- multi_grp_data = GROUP student_details BY (address, age);

grp_all_data = GROUP student_details ALL;

/* displaying results */

-- Dump grouped_data;

-- Dump multi_grp_data;

Dump grp_all_data;

-- output

