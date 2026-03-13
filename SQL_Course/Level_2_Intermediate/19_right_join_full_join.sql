
PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SHOW TABLES;
┌──────────┐
│   name   │
│ varchar  │
├──────────┤
│ marks    │
│ sales    │
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
│         12 │ Kiran   │    21 │ Chennai   │
│         13 │ Deepa   │    21 │ Chennai   │
│         14 │ Arav    │    22 │ Mumbai    │
│         15 │ Sneha   │    22 │ Mumbai    │
│         16 │ Karen   │    21 │ Chennai   │
│         17 │ Deepak  │    25 │ Chennai   │
│         21 │ Ravi    │  NULL │ Delhi     │
│         22 │ Sara    │    21 │ NULL      │
│         23 │ John    │  NULL │ NULL      │
│         50 │ Neha    │    22 │ Hyderabad │
├────────────┴─────────┴───────┴───────────┤
│ 14 rows                        4 columns │
└──────────────────────────────────────────┘
D SELECT * FROM marks;
┌────────────┬─────────┬───────┐
│ student_id │ subject │ score │
│   int32    │ varchar │ int32 │
├────────────┼─────────┼───────┤
│          1 │ Math    │    85 │
│          1 │ Science │    90 │
│          2 │ Math    │    78 │
│          3 │ Science │    88 │
│         12 │ Math    │    92 │
│         99 │ Math    │    80 │
└────────────┴─────────┴───────┘
D SELECT  students.student_id, students.name, marks.subject,marks.score FROM students RIGHT JOIN marks ON studenta.student_id = marks.student_id;
Binder Error:
Referenced table "studenta" not found!
Candidate tables: "students"

LINE 1: ..., marks.subject,marks.score FROM students RIGHT JOIN marks ON studenta.student_id = marks.student_id;
                                                                         ^
D SELECT  students.student_id, students.name, marks.subject,marks.score FROM students RIGHT JOIN marks ON students.student_id = marks.student_id;
┌────────────┬─────────┬─────────┬───────┐
│ student_id │  name   │ subject │ score │
│   int32    │ varchar │ varchar │ int32 │
├────────────┼─────────┼─────────┼───────┤
│          1 │ Arun    │ Science │    90 │
│          2 │ Meera   │ Math    │    78 │
│          3 │ Rahul   │ Science │    88 │
│          1 │ Arun    │ Math    │    85 │
│         12 │ Kiran   │ Math    │    92 │
│       NULL │ NULL    │ Math    │    80 │
└────────────┴─────────┴─────────┴───────┘
D SELECT  students.student_id, students.name, marks.subject,marks.score FROM marks RIGHT JOIN students ON marks.student_id = students.student_id;
┌────────────┬─────────┬─────────┬───────┐
│ student_id │  name   │ subject │ score │
│   int32    │ varchar │ varchar │ int32 │
├────────────┼─────────┼─────────┼───────┤
│          1 │ Arun    │ Science │    90 │
│          2 │ Meera   │ Math    │    78 │
│          3 │ Rahul   │ Science │    88 │
│          1 │ Arun    │ Math    │    85 │
│          4 │ Ananya  │ NULL    │  NULL │
│         12 │ Kiran   │ Math    │    92 │
│         13 │ Deepa   │ NULL    │  NULL │
│         14 │ Arav    │ NULL    │  NULL │
│         15 │ Sneha   │ NULL    │  NULL │
│         16 │ Karen   │ NULL    │  NULL │
│         17 │ Deepak  │ NULL    │  NULL │
│         21 │ Ravi    │ NULL    │  NULL │
│         22 │ Sara    │ NULL    │  NULL │
│         23 │ John    │ NULL    │  NULL │
│         50 │ Neha    │ NULL    │  NULL │
├────────────┴─────────┴─────────┴───────┤
│ 15 rows                      4 columns │
└────────────────────────────────────────┘
D SELECT students.student_id, students.name, marks.subject, marks.score FROM students FULL JOIN marks ON students.student_id = marks.student_id;
┌────────────┬─────────┬─────────┬───────┐
│ student_id │  name   │ subject │ score │
│   int32    │ varchar │ varchar │ int32 │
├────────────┼─────────┼─────────┼───────┤
│          1 │ Arun    │ Science │    90 │
│          2 │ Meera   │ Math    │    78 │
│          3 │ Rahul   │ Science │    88 │
│          1 │ Arun    │ Math    │    85 │
│          4 │ Ananya  │ NULL    │  NULL │
│         12 │ Kiran   │ Math    │    92 │
│         13 │ Deepa   │ NULL    │  NULL │
│         14 │ Arav    │ NULL    │  NULL │
│         15 │ Sneha   │ NULL    │  NULL │
│         16 │ Karen   │ NULL    │  NULL │
│         17 │ Deepak  │ NULL    │  NULL │
│         21 │ Ravi    │ NULL    │  NULL │
│         22 │ Sara    │ NULL    │  NULL │
│         23 │ John    │ NULL    │  NULL │
│         50 │ Neha    │ NULL    │  NULL │
│       NULL │ NULL    │ Math    │    80 │
├────────────┴─────────┴─────────┴───────┤
│ 16 rows                      4 columns │
└────────────────────────────────────────┘
