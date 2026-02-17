-- 📁 File Name: 03_first_select_query.sql
-- 🎬 Title: SQL for Data Analysis | Episode 3 — Your First SELECT Query (DuckDB)

-- 💻 Step 1: Open/Create Persistent Database
-- Command: duckdb pyaihub_analytics.db

-- 💻 Step 2: Create Table (Foundation First)
CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER,
    name TEXT,
    age INTEGER,
    city TEXT
);

-- 💻 Step 3: Insert Sample Data
INSERT INTO students VALUES
(1, 'Arun', 21, 'Chennai'),
(2, 'Meera', 22, 'Mumbai'),
(3, 'Rahul', 23, 'Delhi'),
(4, 'Ananya', 20, 'Bangalore');

-- 💻 Step 4: Verify Table Exists
SHOW TABLES;

-- 💻 Step 5: Now Write First SELECT Query
-- The star (*) selects all columns
SELECT * FROM students;

-- 💻 Step 6: Select Specific Columns
SELECT name, age FROM students;

/* =========================================
                OUTPUT
=========================================

YES. 🔥

[Step 4 Output: SHOW TABLES]
┌──────────┐
│   name   │
├──────────┤
│ students │
└──────────┘

[Step 5 Output: SELECT * FROM students]
┌────────────┬────────┬─────┬───────────┐
│ student_id │  name  │ age │   city    │
├────────────┼────────┼─────┼───────────┤
│     1      │ Arun   │ 21  │ Chennai   │
│     2      │ Meera  │ 22  │ Mumbai    │
│     3      │ Rahul  │ 23  │ Delhi     │
│     4      │ Ananya │ 20  │ Bangalore │
└────────────┴────────┴─────┴───────────┘

[Step 6 Output: SELECT name, age FROM students]
┌────────┬─────┐
│  name  │ age │
├────────┼─────┤
│ Arun   │ 21  │
│ Meera  │ 22  │
│ Rahul  │ 23  │
│ Ananya │ 20  │
└────────┴─────┘

=========================================
*/
