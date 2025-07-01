Subqueries in Employee Management System
This document explains the usage of various types of SQL subqueries demonstrated in the employee_management_system database.

What is a Subquery?
A subquery is a query nested inside another SQL query. Subqueries can return single or multiple values and are used to filter or fetch data dynamically from related tables.

Types of Subqueries Used
1. Scalar Subquery
 Description:
A subquery that returns a single value (one row and one column).

SELECT * FROM employees 
WHERE emp_age = (SELECT MIN(emp_age) FROM employees);
Use Case:
Fetch all employee details whose age is the minimum in the company.

3.  Correlated Subquery
Description:
A subquery that depends on the outer query and is evaluated once per row.

SELECT emp_name 
FROM employees e 
WHERE EXISTS (
    SELECT 1 
    FROM salary s 
    WHERE s.emp_id = e.emp_id AND s.salary_amnt > 40000
);
 Use Case:
Get names of employees who have a salary greater than 40,000. The subquery is evaluated per employee.

3. Subquery with IN
 Description:
The outer query filters results where a column matches any of the values returned by the subquery.

SELECT emp_name 
FROM employees 
WHERE emp_id IN (SELECT emp_id FROM salary);
Use Case:
Get names of employees who have salary records.

4. Subquery with EXISTS
Description:
Returns true if the subquery returns any rows for the current row in the outer query.

SELECT emp_name 
FROM employees e 
WHERE EXISTS (
    SELECT 1 FROM attendance a WHERE a.emp_id = e.emp_id
);
Use Case:
List employees who have at least one attendance record.

6. Subquery Using = (Scalar Return)
Description:
A subquery that returns one value, used with = operator in the outer query.

SELECT emp_name 
FROM employees 
WHERE emp_id = (
    SELECT emp_id 
    FROM salary 
    WHERE salary_amnt = (SELECT MIN(salary_amnt) FROM salary));
Use Case:
Get the name of the employee who earns the lowest salary in the organization.


