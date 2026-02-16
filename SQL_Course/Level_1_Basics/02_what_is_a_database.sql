PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
D CREATE TABLE students ( student_id INTEGER, name TEXT, age INTEGER, city TEXT);
D INSERT INTO  studnets  VALUES (1, 'Arun', 21, 'Chennai'), (2, 'Meera', 22, 'Mumbai');
Catalog Error:
Table with name studnets does not exist!
Did you mean "students"?
D INSERT INTO  students  VALUES (1, 'Arun', 21, 'Chennai'), (2, 'Meera', 22, 'Mumbai');
D SELECT * FROM students;
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Arun    │    21 │ Chennai │
│          2 │ Meera   │    22 │ Mumbai  │
└────────────┴─────────┴───────┴─────────┘
D
