-- first table
customer_data = LOAD './Data/mall_customers.txt' 
USING PigStorage(',')
AS(cid:int, gender:chararray, age:int, income:int, spending_score:int);

employee_data = LOAD './Data/employee.txt' 
USING PigStorage(',')
AS (id:int, groups:chararray, age:int, healthy_eating:int, active_lifestyle:int, salary:int);

-- /* union operation */
-- emp_union_cust = UNION customer_data, employee_data;

-- Dump emp_union_cust;

-- /* join operations */
-- age_joined_data = JOIN customer_data BY spending_score, employee_data BY age;

-- Dump age_joined_data;

