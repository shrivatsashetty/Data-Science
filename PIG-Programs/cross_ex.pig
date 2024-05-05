num1_data = LOAD './Data/nums1.txt'
USING PigStorage(',')
AS (c1:int, c2:int);

num2_data = LOAD './Data/nums2.txt'
USING PigStorage(',')
AS (c1:int, c2:int, c3:int);

crossed_data = CROSS num1_data, num2_data;

Dump crossed_data;