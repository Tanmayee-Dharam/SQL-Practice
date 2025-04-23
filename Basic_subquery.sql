-- SUBQUERY PRACTICE --

-- Q1.  Select all employees and salaries who are earning more than employee 7839 --

SELECT empno, ename, sal FROM emp
WHERE sal >(SELECT sal FROM emp
            WHERE empno = '7839');
            
-- Q2. Select employee name, salary, employee 7839 's salary for employees earning more than employee 7839 --

--solution using Join
SELECT e1.empno, e1.ename, e1.sal, e2.sal AS emp_7839_sal FROM emp as e1
JOIN emp AS e2 
WHERE e1.sal > e2.sal AND e2.empno='7839';

-- Same using a subquery in select
SELECT empno, ename, (SELECT sal FROM emp WHERE empno = '7839') AS emp7839_sal FROM emp;

-- Q3. Select all detail of the employee who belong to the same department as employee 7839 --
SELECT * FROM emp WHERE deptno IN
(SELECT deptno FROM emp WHERE empno = '7839');

-- Q4. Select all employee names, their salary, andthe  total average salary of all employees who are earning more than the average salary --
-- SELECT AVG(sal) FROM emp;
SELECT ename, sal, (SELECT AVG(sal) FROM emp) AS AVG_SAL FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp);

-- Q5.  Select all employee details who were hired before BLAKE --
SELECT * FROM emp
WHERE hiredate < (SELECT hiredate FROM emp
				  WHERE ename = 'Blake');

-- Q6. Select all employee names and salaries who are earning more than BLAKE but less than KING --
SELECT ename, sal FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'Blake')  
AND sal < (SELECT sal FROM emp WHERE ename = 'King');

-- Q7. Select all department numbers which has more number of employees than department 10 --
SELECT deptno, COUNT(*) FROM emp
GROUP BY deptno
HAVING COUNT(*) > (SELECT COUNT(*) FROM emp
				   WHERE deptno = 10);

-- Q8. Select department names which has more number of employees working than department 10 --
SELECT COUNT(*) FROM emp
WHERE deptno =10;

SELECT dname, COUNT(*) FROM dept
JOIN emp
ON dept.deptno=emp.deptno
GROUP BY dname 
HAVING COUNT(*) > (SELECT COUNT(*) FROM emp
                   WHERE deptno =10);
                   
-- Q9. Select all department names which has more number of employees working than the 'ACCOUNTING' department --
SELECT dname, COUNT(*) FROM dept
JOIN emp
ON dept.deptno=emp.deptno
GROUP BY dname 
HAVING COUNT(*) > (SELECT COUNT(*) FROM emp
                   WHERE dname = 'Accpunting')
                   
