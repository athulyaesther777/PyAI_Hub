PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SHOW TABLES;
┌──────────┐
│   name   │
│ varchar  │
├──────────┤
│ students │
└──────────┘
D SELECT * FROM students;
┌────────────┬─────────┬───────┬───────────┐
│ student_id │  name   │  age  │   city    │
│   int32    │ varchar │ int32 │  varchar  │
├────────────┼─────────┼───────┼───────────┤
│          1 │ Arun    │    21 │ Chennai   │
│          2 │ Meera   │    22 │ Mumbai    │
│          3 │ Rahul   │    23 │ Delhi     │
│          4 │ Ananya  │    20 │ Bangalore │
└────────────┴─────────┴───────┴───────────┘
D SELECT * FROM  students WHERE  age > 21;
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          2 │ Meera   │    22 │ Mumbai  │
│          3 │ Rahul   │    23 │ Delhi   │
└────────────┴─────────┴───────┴─────────┘
D SELECT * FROM students WHERE city = 'Mumbai';
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│     2      │ Meera   │  22   │ Mumbai  │
└────────────┴─────────┴───────┴─────────┘
D SELECT * FROM students WHERE city = "Mumbai";
Binder Error:
Referenced column "Mumbai" not found in FROM clause!
Candidate bindings: "student_id"

LINE 1: SELECT * FROM students WHERE city = "Mumbai";
                                            ^
D SELECT * FROM students WHERE city = 'Mumbai';
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│     2      │ Meera   │  22   │ Mumbai  │
└────────────┴─────────┴───────┴─────────┘
D SELECT name , age FROM students WHERE age >=21;
┌─────────┬───────┐
│  name   │  age  │
│ varchar │ int32 │
├─────────┼───────┤
│ Arun    │    21 │
│ Meera   │    22 │
│ Rahul   │    23 │
└─────────┴───────┘
D 
