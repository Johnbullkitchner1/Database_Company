-- Drop old tables (for testing resets)
DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS departments;

-- Departments
CREATE TABLE departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

-- Employees
CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    department_id INTEGER,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Projects
CREATE TABLE projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE
);

-- Employee ↔ Projects (many-to-many)
CREATE TABLE employee_projects (
    employee_id INTEGER,
    project_id INTEGER,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

-- Departments
INSERT INTO departments (name) VALUES
('HR'),
('Tech'),
('Sales');

-- Employees
INSERT INTO employees (first_name, last_name, email, department_id, hire_date) VALUES
('Pruddy', 'Okafor', 'pruddy@mannbull.com', 1, '2023-01-12'),
('Kitch', 'Bull', 'kitch@mannbull.com', 2, '2023-02-01'),
('Obinna', 'Uzo', 'obinna@mannbull.com', 2, '2023-03-04'),
('Abbey', 'Cole', 'abbey@mannbull.com', 3, '2023-04-15'),
('Ezra', 'Paul', 'ezra@mannbull.com', 1, '2023-05-20'),
('Jane', 'Smith', 'jane@mannbull.com', 2, '2023-06-11'),
('John', 'Doe', 'john@mannbull.com', 2, '2023-06-12'),
('Mary', 'Johnson', 'mary@mannbull.com', 3, '2023-07-01'),
('Sam', 'Adams', 'sam@mannbull.com', 1, '2023-07-05'),
('Lucy', 'Wong', 'lucy@mannbull.com', 3, '2023-08-09');

-- Projects
INSERT INTO projects (name, start_date, end_date) VALUES
('Website Revamp', '2023-06-01', '2023-12-01'),
('Marketing Campaign', '2023-07-01', '2023-10-01');

-- Assign Employees to Projects
INSERT INTO employee_projects (employee_id, project_id) VALUES
(2, 1), -- Kitch → Website Revamp
(3, 1), -- Obinna → Website Revamp
(4, 2), -- Abbey → Marketing Campaign
(8, 2), -- Mary → Marketing Campaign
(10, 1); -- Lucy → Website Revamp
