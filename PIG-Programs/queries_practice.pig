-- data = LOAD './Data/mall_customers.txt' USING PigStorage(',')
-- AS (id:int, genre:chararray, age:int, annual_income:int, spending_score:int);

-- Dump data;



-- /* data projection using  FOREACH and GENERATE */
-- projected_data = FOREACH data GENERATE age, spending_score;
-- Dump projected_data;




-- /* filter operation */
-- filtered_data = FILTER data BY age >= 50;
-- -- selecting only the age column from the filtered data
-- filtered_ages = FOREACH filtered_data GENERATE age;
-- -- now selecting only the distinct ages from the projected data
-- distinct_ages = DISTINCT filtered_ages;
-- -- Dump filtered_data;
-- -- Dump filtered_ages;
-- Dump distinct_ages;




-- /* sorting and limiting */
-- sorted_data = ORDER data BY age DESC; -- default sorting order is ascending(ASC)
-- limited_data = LIMIT sorted_data 10; -- limiting the no of records to be displayed
-- Dump limited_data ;




/* concat operation */
-- loading a data with string fields
student_data = LOAD './Data/student_details.txt' USING PigStorage(',')
AS (id:int, fname:chararray, lname:chararray, age:int, mob:chararray, city:chararray);

-- full_names = FOREACH student_data GENERATE CONCAT(fname, ' ', lname);
-- Dump full_names;

-- concat_ex_data = FOREACH student_data GENERATE 
-- CONCAT('ID: ', (chararray)id, '| ', 'full_name: ', fname, ' ', lname, '| ', 'age: ', (chararray)age ) AS info;
-- Dump concat_ex_data;

-- age_modified_data = FOREACH student_data GENERATE
-- CONCAT( 'name: ', fname, ', ', 'modified_age: ', (chararray)(age + 100) );

-- Dump age_modified_data;

aliased_data = FOREACH student_data GENERATE
CONCAT(fname, ' ', lname) AS full_name, age + 10 AS modified_age,  city AS address; -- assigning aiases to individual columns
-- DESCRIBE aliased_data; -- {full_name: chararray,modified_age: int,address: chararray}
-- Dump aliased_data;

/* in order to perform a aggregation like AVG, it's compulsory to group the data first */
grouped_orignal_data = GROUP student_data ALL;
grouped_aliased_data = GROUP aliased_data ALL;


orignal_avg_age_data = FOREACH grouped_orignal_data GENERATE
AVG(student_data.age); 

Dump orignal_avg_age_data; -- 24.923076923076923

-- data_avg_age = FOREACH grouped_aliased_data GENERATE
-- AVG(aliased_data.modified_age);

-- Dump data_avg_age; -- 34.999










