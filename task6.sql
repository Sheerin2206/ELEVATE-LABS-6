/*--SCALAR Subquery:
--Find employees with maximum age among employees*/
SELECT * FROM employees WHERE emp_age = (SELECT (emp_age)FROM employees);

/*CORRELETED SUBQUERY*/    
SELECT emp_name FROM employees e WHERE EXISTS(SELECT 1 FROM salary s WHERE s.emp_id = e.emp_id AND s.salary_amnt > 40000);

 /*using IN:*/
-- Get employee names who are present in the salary table
SELECT emp_name FROM employees WHERE emp_id IN (SELECT emp_id FROM salary);

-- using EXISTS:
-- List employees who have attendance records
SELECT emp_name FROM employees e WHERE EXISTS (SELECT 1 FROM attendance a WHERE a.emp_id = e.emp_id);

 /*subquery using = (Scalar return)
 --the name of the employee with the lowest salary*/
SELECT emp_name FROM employees WHERE emp_id = (SELECT emp_id FROM salary WHERE salary_amnt = (SELECT MIN(salary_amnt) FROM salary));
