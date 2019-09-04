-- Copy the order by exercise and save it as 3.6_functions_exercises.sql.
use employees;


-- Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
select concat(first_name,' ', last_name) as full_name 
from employees 
where last_name like 'e%e';

-- Convert the names produced in your last query to all uppercase.
select upper(concat(first_name,' ', last_name)) as full_name 
from employees 
where last_name like 'e%e';

-- For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE())
select *, datediff(now(), hire_date) as tenure_days 
from employees 
where hire_date between '1990-01-01' and '1999-12-31' and birth_date like '%-12-25';

-- Find the smallest and largest salary from the salaries table.
select max(salary), min(salary) from salaries;

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born.
select concat(lower(substr(first_name, 1, 1)), lower(substr(last_name, 1, 4)), '_', date_format(birth_date, '%d%y')) as username, first_name, last_name, birth_date
from employees;