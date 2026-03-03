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
│         12 │ Kiran   │    21 │ Chennai   │
│         13 │ Deepa   │    21 │ Chennai   │
│         14 │ Arav    │    22 │ Mumbai    │
│         15 │ Sneha   │    22 │ Mumbai    │
│         16 │ Karen   │    21 │ Chennai   │
│         17 │ Deepak  │    25 │ Chennai   │
├────────────┴─────────┴───────┴───────────┤
│ 10 rows                        4 columns │
└──────────────────────────────────────────┘
D SHOW TABLES;
┌──────────┐
│   name   │
│ varchar  │
├──────────┤
│ students │
└──────────┘
D CREATE TABLE marks ( student_id INTEGER, subject TEXT , score INTEGER);
D INSERT INTO marks VALUES (1, 'Math', 85), (1, 'Science', 90), (2, 'Math', 78), (3, 'Science', 88), (12, 'Math', 92);
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
└────────────┴─────────┴───────┘
D SHOW TABLES;
┌──────────┐
│   name   │
│ varchar  │
├──────────┤
│ marks    │
│ students │
└──────────┘
D SELECT students.name, marks.subjects, marks.score FROM students JOIN marks ON students.student_id = marks.student_id;
Binder Error:
Table "marks" does not have a column named "subjects"

Candidate bindings: : "subject"

LINE 1: SELECT students.name, marks.subjects, marks.score FROM students JOIN marks ON...
                              ^
D SELECT students.name, marks.subject, marks.score FROM students JOIN marks ON students.student_id = marks.student_id;
┌─────────┬─────────┬───────┐
│  name   │ subject │ score │
│ varchar │ varchar │ int32 │
├─────────┼─────────┼───────┤
│ Arun    │ Science │    90 │
│ Meera   │ Math    │    78 │
│ Rahul   │ Science │    88 │
│ Arun    │ Math    │    85 │
│ Kiran   │ Math    │    92 │
└─────────┴─────────┴───────┘
D SELECT students.name, marks.subject, marks.score FROM students JOIN marks ON students.student_id = marks.student_;
Binder Error:
Table "marks" does not have a column named "student_"

Candidate bindings: : "student_id"

LINE 1: ... marks.score FROM students JOIN marks ON students.student_id = marks.student_;
                                                                          ^
D SELECT students.name, marks.subject, marks.score FROM students JOIN marks ON students.student_id = marks.score;
┌─────────┬─────────┬───────┐
│  name   │ subject │ score │
│ varchar │ varchar │ int32 │
├─────────┴─────────┴───────┤
│          0 rows           │
└───────────────────────────┘
D
