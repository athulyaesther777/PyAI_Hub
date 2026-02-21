PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
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
D SELECT * FROM students WHERE name LIKE  'A%';
┌────────────┬─────────┬───────┬───────────┐
│ student_id │  name   │  age  │   city    │
│   int32    │ varchar │ int32 │  varchar  │
├────────────┼─────────┼───────┼───────────┤
│          1 │ Arun    │    21 │ Chennai   │
│          4 │ Ananya  │    20 │ Bangalore │
└────────────┴─────────┴───────┴───────────┘
D SELECT * FROM students WHERE name LIKE '%ru%;
┬╖
Parser Error:
unterminated quoted string at or near "'%ru%;"

LINE 1: SELECT * FROM students WHERE name LIKE '%ru%;
                                               ^
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SELECT * FROM students WHERE name LIKE '%ru%';
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│     1      │ Arun    │  21   │ Chennai │
└────────────┴─────────┴───────┴─────────┘
D SELECT * FROM students WHERE name LIKE  '%A';
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┴─────────┴───────┴─────────┤
│                 0 rows                 │
└────────────────────────────────────────┘
D SELECT * FROM students WHERE name LIKE  '%a';
┌────────────┬─────────┬───────┬───────────┐
│ student_id │  name   │  age  │   city    │
│   int32    │ varchar │ int32 │  varchar  │
├────────────┼─────────┼───────┼───────────┤
│          2 │ Meera   │    22 │ Mumbai    │
│          4 │ Ananya  │    20 │ Bangalore │
└────────────┴─────────┴───────┴───────────┘
D SELECT * FROM students WHERE name LIKE 'A_';
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┴─────────┴───────┴─────────┤
│                 0 rows                 │
└────────────────────────────────────────┘
D SELECT * FROM students WHERE name LIKE 'A___';
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│     1      │ Arun    │  21   │ Chennai │
└────────────┴─────────┴───────┴─────────┘
D SELECT * FROM students WHERE city IN ('Mumbai', 'Chennai');
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Arun    │    21 │ Chennai │
│          2 │ Meera   │    22 │ Mumbai  │
└────────────┴─────────┴───────┴─────────┘
D SELECT * FROM students WHERE city NOT IN ('Mumbai', 'Chennai');
┌────────────┬─────────┬───────┬───────────┐
│ student_id │  name   │  age  │   city    │
│   int32    │ varchar │ int32 │  varchar  │
├────────────┼─────────┼───────┼───────────┤
│          3 │ Rahul   │    23 │ Delhi     │
│          4 │ Ananya  │    20 │ Bangalore │
└────────────┴─────────┴───────┴───────────┘
D SELECT * FROM students WHERE age BETWEEN 21 AND 23;
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Arun    │    21 │ Chennai │
│          2 │ Meera   │    22 │ Mumbai  │
│          3 │ Rahul   │    23 │ Delhi   │
└────────────┴─────────┴───────┴─────────┘
D SELECT * FROM students WHERE name LIKE 'A%' AND city IN ('Chennai', 'Mumbai') AND age BETWEEN 20 AND 24;
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│     1      │ Arun    │  21   │ Chennai │
└────────────┴─────────┴───────┴─────────┘
