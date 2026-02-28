
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
D SELECT COUNT(*) FROM students;
┌──────────────┐
│ count_star() │
│    int64     │
├──────────────┤
│      4       │
└──────────────┘
D SELECT city , COUNT(*)
┬╖
Binder Error:
Referenced column "city" was not found because the FROM clause is missing

LINE 1: SELECT city , COUNT(*)
               ^
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SELECT city , COUNT(*) FROM students GROUP BY  city;
┌───────────┬──────────────┐
│   city    │ count_star() │
│  varchar  │    int64     │
├───────────┼──────────────┤
│ Mumbai    │            1 │
│ Delhi     │            1 │
│ Chennai   │            1 │
│ Bangalore │            1 │
└───────────┴──────────────┘
D SELECT city , AVG(age) FROM students GROUP BY city;
┌───────────┬──────────┐
│   city    │ avg(age) │
│  varchar  │  double  │
├───────────┼──────────┤
│ Chennai   │     21.0 │
│ Bangalore │     20.0 │
│ Mumbai    │     22.0 │
│ Delhi     │     23.0 │
└───────────┴──────────┘
D SELECT city , name, COUNT(*) FROM students GROUP BY city;
Binder Error:
column "name" must appear in the GROUP BY clause or must be part of an aggregate function.
Either add it to the GROUP BY list, or use "ANY_VALUE(name)" if the exact value of "name" is not important.

LINE 1: SELECT city , name, COUNT(*) FROM students GROUP BY city;
                      ^
D SELECT city , name, COUNT(*) FROM students GROUP BY city,name;
┌───────────┬─────────┬──────────────┐
│   city    │  name   │ count_star() │
│  varchar  │ varchar │    int64     │
├───────────┼─────────┼──────────────┤
│ Delhi     │ Rahul   │            1 │
│ Bangalore │ Ananya  │            1 │
│ Chennai   │ Arun    │            1 │
│ Mumbai    │ Meera   │            1 │
└───────────┴─────────┴──────────────┘
D SELECT city , COUNT(*) FROM students WHERE age > 20 GROUP BY city;
┌─────────┬──────────────┐
│  city   │ count_star() │
│ varchar │    int64     │
├─────────┼──────────────┤
│ Chennai │            1 │
│ Mumbai  │            1 │
│ Delhi   │            1 │
└─────────┴──────────────┘
D SELECT city, COUNT(*) AS total_students FROM students GROUP BY city;
┌───────────┬────────────────┐
│   city    │ total_students │
│  varchar  │     int64      │
├───────────┼────────────────┤
│ Mumbai    │              1 │
│ Delhi     │              1 │
│ Chennai   │              1 │
│ Bangalore │              1 │
└───────────┴────────────────┘
D
