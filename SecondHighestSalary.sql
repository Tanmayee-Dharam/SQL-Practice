-- 176. Second Highest Salary LeetCode
/* Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null */

My Solution:
  
SELECT 
    (SELECT DISTINCT salary 
     FROM Employee 
     ORDER BY salary DESC 
     LIMIT 1 OFFSET 1) AS SecondHighestSalary;
