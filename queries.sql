-- All employees with department
SELECT e.first_name, e.last_name, d.name AS department
FROM employees e
JOIN departments d ON e.department_id = d.id;

-- All unique departments
SELECT DISTINCT name FROM departments;

-- Employees on Website Revamp
--e stands for employees,d departments
SELECT e.first_name, e.last_name
FROM employees e
JOIN employee_projects ep ON e.id = ep.employee_id
JOIN projects p ON ep.project_id = p.id
WHERE p.name = 'Website Revamp';
