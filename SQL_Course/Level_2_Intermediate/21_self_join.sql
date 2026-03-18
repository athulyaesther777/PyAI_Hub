PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D CREATE TABLE employees (employee_id INTEGER, name TEXT, manager_id INTEGER);
D INSERT INTO employees VALUES (1, 'Arun', NULL), (2, 'Meera', 1), (3, 'Ravi', 1), (4, 'Sara', 2);
D SHOW TABLES;
┌──────────────┐
│     name     │
│   varchar    │
├──────────────┤
│ employees    │
│ marks        │
│ sales        │
│ student_info │
│ students     │
└──────────────┘
D SELECT * FROM employees;
┌─────────────┬─────────┬────────────┐
│ employee_id │  name   │ manager_id │
│    int32    │ varchar │   int32    │
├─────────────┼─────────┼────────────┤
│           1 │ Arun    │       NULL │
│           2 │ Meera   │          1 │
│           3 │ Ravi    │          1 │
│           4 │ Sara    │          2 │
└─────────────┴─────────┴────────────┘
D SELECT e.name AS employee_name, m.name as manager_name FROM employees e LEFT JOIN employees m ON e.manager_id = m.employee_id;
┌───────────────┬──────────────┐
│ employee_name │ manager_name │
│    varchar    │   varchar    │
├───────────────┼──────────────┤
│ Meera         │ Arun         │
│ Ravi          │ Arun         │
│ Sara          │ Meera        │
│ Arun          │ NULL         │
└───────────────┴──────────────┘
D SELECT e.name AS employee_name, m.name as manager_name FROM employees e  JOIN employees m ON e.manager_id = m.employee_id;
┌───────────────┬──────────────┐
│ employee_name │ manager_name │
│    varchar    │   varchar    │
├───────────────┼──────────────┤
│ Meera         │ Arun         │
│ Ravi          │ Arun         │
│ Sara          │ Meera        │
└───────────────┴──────────────┘
