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
D INSERT INTO students VALUES (12, 'Kiran', 21, 'Chennai'),(13, 'Deepa', 21, 'Chennai'), (14, 'Arav', 22, 'Mumbai'), (15, 'Sneha', 22, 'Mumbai);
┬╖
Parser Error:
unterminated quoted string at or near "'Mumbai);"

LINE 1: ... 21, 'Chennai'), (14, 'Arav', 22, 'Mumbai'), (15, 'Sneha', 22, 'Mumbai);
                                                                          ^
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D INSERT INTO students VALUES (12, 'Kiran', 21, 'Chennai'),(13, 'Deepa', 21, 'Chennai'), (14, 'Arav', 22, 'Mumbai'), (15, 'Sneha', 22, 'Mumbai');
D SELECT * FROM students;
┌────────────┬─────────┬───────┬───────────┐
│ student_id │  name   │  age  │   city    │
│   int32    │ varchar │ int32 │  varchar  │
├────────────┼─────────┼───────┼───────────┤
│          1 │ Arun    │    21 │ Chennai   │
│          2 │ Meera   │    22 │ Mumbai    │
│          3 │ Rahul   │    23 │ Delhi     │
│          4 │ Ananya  │    20 │ Bangalore │
│         12 │ Kiran   │    21 │ Chennai   │
│         13 │ Deepa   │    21 │ Chennai   │
│         14 │ Arav    │    22 │ Mumbai    │
│         15 │ Sneha   │    22 │ Mumbai    │
└────────────┴─────────┴───────┴───────────┘
D SELECT city, age, COUNT(*) AS total_students FROM students GROUP BY city, age ORDER BY city age;
Parser Error:
syntax error at or near "age"

LINE 1: ... total_students FROM students GROUP BY city, age ORDER BY city age;
                                                                          ^
D SELECT city, age, COUNT(*) AS total_students FROM students GROUP BY city, age ORDER BY city ,age;
┌───────────┬───────┬────────────────┐
│   city    │  age  │ total_students │
│  varchar  │ int32 │     int64      │
├───────────┼───────┼────────────────┤
│ Bangalore │    20 │              1 │
│ Chennai   │    21 │              3 │
│ Delhi     │    23 │              1 │
│ Mumbai    │    22 │              3 │
└───────────┴───────┴────────────────┘
D INSERT INTO students VALUES (16, 'Karen', 21, 'Chennai'),(17, 'Deepak', 25, 'Chennai');
D SELECT * FROM students;
┌────────────┬─────────┬───────┬───────────┐
│ student_id │  name   │  age  │   city    │
│   int32    │ varchar │ int32 │  varchar  │
├────────────┼─────────┼───────┼───────────┤
│          1 │ Arun    │    21 │ Chennai   │
│          2 │ Meera   │    22 │ Mumbai    │
│          3 │ Rahul   │    23 │ Delhi     │
│          4 │ Ananya  │    20 │ Bangalore │
│         12 │ Kiran   │    21 │ Chennai   │
│         13 │ Deepa   │    21 │ Chennai   │
│         14 │ Arav    │    22 │ Mumbai    │
│         15 │ Sneha   │    22 │ Mumbai    │
│         16 │ Karen   │    21 │ Chennai   │
│         17 │ Deepak  │    25 │ Chennai   │
├────────────┴─────────┴───────┴───────────┤
│ 10 rows                        4 columns │
└──────────────────────────────────────────┘
D SELECT city, age, COUNT(*) FROM students GROUP BY city, age ORDER BY city, age;
┌───────────┬───────┬──────────────┐
│   city    │  age  │ count_star() │
│  varchar  │ int32 │    int64     │
├───────────┼───────┼──────────────┤
│ Bangalore │    20 │            1 │
│ Chennai   │    21 │            4 │
│ Chennai   │    25 │            1 │
│ Delhi     │    23 │            1 │
│ Mumbai    │    22 │            3 │
└───────────┴───────┴──────────────┘
D SELECT city , age, COUNT(*) AS total_students FROM students WHERE age > 20 GROUP BY city, age ORDER BY city, age;
┌─────────┬───────┬────────────────┐
│  city   │  age  │ total_students │
│ varchar │ int32 │     int64      │
├─────────┼───────┼────────────────┤
│ Chennai │    21 │              4 │
│ Chennai │    25 │              1 │
│ Delhi   │    23 │              1 │
│ Mumbai  │    22 │              3 │
└─────────┴───────┴────────────────┘
D SELECT city, age, COUNT(*) AS total_students FROM students GROUP BY city, age HAVING COUNT(*) > 1 ORDER BY city, age;
┌─────────┬───────┬────────────────┐
│  city   │  age  │ total_students │
│ varchar │ int32 │     int64      │
├─────────┼───────┼────────────────┤
│ Chennai │    21 │              4 │
│ Mumbai  │    22 │              3 │
└─────────┴───────┴────────────────┘
D SELECT city, age, COUNT(*) AS total_students FROM students GROUP BY city, age;
┌───────────┬───────┬────────────────┐
│   city    │  age  │ total_students │
│  varchar  │ int32 │     int64      │
├───────────┼───────┼────────────────┤
│ Chennai   │    25 │              1 │
│ Mumbai    │    22 │              3 │
│ Delhi     │    23 │              1 │
│ Chennai   │    21 │              4 │
│ Bangalore │    20 │              1 │
└───────────┴───────┴────────────────┘
D SELECT city, age, COUNT(*) AS total_students FROM students GROUP BY city, age HAVING COUNT(*) > 1;
┌─────────┬───────┬────────────────┐
│  city   │  age  │ total_students │
│ varchar │ int32 │     int64      │
├─────────┼───────┼────────────────┤
│ Mumbai  │    22 │              3 │
│ Chennai │    21 │              4 │
└─────────┴───────┴────────────────┘
D SELECT city, age, COUNT(*) AS total_students FROM students GROUP BY city, age HAVING COUNT(*) > 1 ORDER BY city, age;
┌─────────┬───────┬────────────────┐
│  city   │  age  │ total_students │
│ varchar │ int32 │     int64      │
├─────────┼───────┼────────────────┤
│ Chennai │    21 │              4 │
│ Mumbai  │    22 │              3 │
└─────────┴───────┴────────────────┘
D
