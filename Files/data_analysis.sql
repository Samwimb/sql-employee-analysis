-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.gender, salaries.salary 
from emp
join salaries on salaries.emp_no = emp.emp_no;

-- 2. List employees who were hired in 1986.
select emp_no, first_name, last_name from emp
where hire_date like '1986%';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dept.dept_no, dept.dept_name, dept_manager.emp_no, emp.last_name, emp.first_name, dept_manager.from_date, dept_manager.to_date
from dept
join dept_manager on dept_manager.dept_no = dept.dept_no
join emp on emp.emp_no = dept_manager.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from dept
join dept_emp on dept_emp.dept_no = dept.dept_no
join emp on emp.emp_no = dept_emp.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from emp
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from dept
join dept_emp on dept_emp.dept_no = dept.dept_no
join emp on emp.emp_no = dept_emp.emp_no
where dept.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from dept
join dept_emp on dept_emp.dept_no = dept.dept_no
join emp on emp.emp_no = dept_emp.emp_no
where dept.dept_name = 'Sales' or dept.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "last_name_frequency"
from emp
group by last_name
order by "last_name_frequency" desc;

-- BONUS: Average Salary by Title
select titles.title, avg(salaries.salary) as "average_salary"
from titles
join emp on emp.emp_no = titles.emp_no
join salaries on salaries.emp_no = emp.emp_no
group by titles.title
order by average_salary;





