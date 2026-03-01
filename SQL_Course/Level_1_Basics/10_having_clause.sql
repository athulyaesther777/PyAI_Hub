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
D SELECT city , COUNT(*) AS total_students FROM students GROUP BY city;
┌───────────┬────────────────┐
│   city    │ total_students │
│  varchar  │     int64      │
├───────────┼────────────────┤
│ Mumbai    │              1 │
│ Delhi     │              1 │
│ Chennai   │              1 │
│ Bangalore │              1 │
└───────────┴────────────────┘
D SELECT city , COUNT(*) AS total_students FROM students WHERE age > 21 GROUP BY city;
┌─────────┬────────────────┐
│  city   │ total_students │
│ varchar │     int64      │
├─────────┼────────────────┤
│ Mumbai  │              1 │
│ Delhi   │              1 │
└─────────┴────────────────┘
D SELECT city , COUNT(*) AS total_students FROM students  GROUP BY city HAVING COUNT(*) > 2;
┌─────────┬────────────────┐
│  city   │ total_students │
│ varchar │     int64      │
├─────────┴────────────────┤
│          0 rows          │
└──────────────────────────┘
D SELECT city, COUNT(*) AS total_students FROM students WHERE age > 20 GROUP BY city HAVING COUNT(*) >1;
┌─────────┬────────────────┐
│  city   │ total_students │
│ varchar │     int64      │
├─────────┴────────────────┤
│          0 rows          │
└──────────────────────────┘
D SELECT city, COUNT(*) AS total_students FROM students HAVING COUNT(*) GROUP BY city;
Parser Error:
syntax error at or near "GROUP"

LINE 1: ..., COUNT(*) AS total_students FROM students HAVING COUNT(*) GROUP BY city;
                                                                      ^
D
