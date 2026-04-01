
PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SELECT * FROM students WHERE student_id IN  ( SELECT student_id FROM marks WHERE score >= 80);
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Arun    │    21 │ Chennai │
│          3 │ Rahul   │    23 │ Delhi   │
│         12 │ Kiran   │    21 │ Chennai │
│         17 │ Deepak  │    25 │ Chennai │
└────────────┴─────────┴───────┴─────────┘
D SELECT * FROM students s WHERE EXSIST (SELECT 1 FROM marks m WHERE  s.student_id = m.student_id AND m.score >= 80);
Parser Error:
syntax error at or near "SELECT"

LINE 1: SELECT * FROM students s WHERE EXSIST (SELECT 1 FROM marks m WHERE  s.student_id = m.student_id...
                                               ^
D SELECT * FROM students s WHERE EXISTS (SELECT 1 FROM marks m WHERE  s.student_id = m.student_id AND m.score >= 80);
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Arun    │    21 │ Chennai │
│          3 │ Rahul   │    23 │ Delhi   │
│         12 │ Kiran   │    21 │ Chennai │
│         17 │ Deepak  │    25 │ Chennai │
└────────────┴─────────┴───────┴─────────┘
D SELECT students s WHERE EXISTS (SELECT 1 FROM marks m WHERE s.student_id = m.student_id);
Binder Error:
Referenced table "s" not found!

LINE 1: ...ELECT students s WHERE EXISTS (SELECT 1 FROM marks m WHERE s.student_id = m.student_id);
                                                                      ^
D SELECT * FROM  students s WHERE EXISTS (SELECT 1 FROM marks m WHERE s.student_id = m.student_id);
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Arun    │    21 │ Chennai │
│          2 │ Meera   │    22 │ Mumbai  │
│          3 │ Rahul   │    23 │ Delhi   │
│         12 │ Kiran   │    21 │ Chennai │
│         17 │ Deepak  │    25 │ Chennai │
└────────────┴─────────┴───────┴─────────┘
D SELECT * FROM  students s WHERE IN (SELECT 1 FROM marks m WHERE s.student_id = m.student_id);
Parser Error:
syntax error at or near "IN"

LINE 1: SELECT * FROM  students s WHERE IN (SELECT 1 FROM marks m WHERE s.student_id = m.student_id...
                                        ^
D SELECT * FROM  students WHERE student_id IN (SELECT student_id FROM marks);
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Arun    │    21 │ Chennai │
│          2 │ Meera   │    22 │ Mumbai  │
│          3 │ Rahul   │    23 │ Delhi   │
│         12 │ Kiran   │    21 │ Chennai │
│         17 │ Deepak  │    25 │ Chennai │
└────────────┴─────────┴───────┴─────────┘
D
