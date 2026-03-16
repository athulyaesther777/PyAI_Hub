
PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SHOW TABLES;
┌──────────────┐
│     name     │
│   varchar    │
├──────────────┤
│ marks        │
│ sales        │
│ student_info │
│ students     │
└──────────────┘
D DROP TABLE student_info;
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
D CREATE TABLE student_info ( student_id INTEGER, phone_number TEXT, date_of_birth DATE);                                                                      ^
D INSERT INTO student_info VALUES (1, '7777777', '2001-07-02'), (2, '8888888', '2009-11-27'),(3,' 5555555', '2007-07-07');
D SELECT * FROM student_info;
┌────────────┬──────────────┬───────────────┐
│ student_id │ phone_number │ date_of_birth │
│   int32    │   varchar    │     date      │
├────────────┼──────────────┼───────────────┤
│          1 │ 7777777      │ 2001-07-02    │
│          2 │ 8888888      │ 2009-11-27    │
│          3 │  5555555     │ 2007-07-07    │
└────────────┴──────────────┴───────────────┘
D SELECT students.name, marks.subject, marks.score FROM students JOIN marks ON students.student_id = marks.student_id;
┌─────────┬─────────┬───────┐
│  name   │ subject │ score │
│ varchar │ varchar │ int32 │
├─────────┼─────────┼───────┤
│ Arun    │ Science │    90 │
│ Meera   │ Math    │    78 │
│ Rahul   │ Science │    88 │
│ Kiran   │ Math    │    92 │
│ Arun    │ Math    │    85 │
└─────────┴─────────┴───────┘
D SELECT students.student_id , students.name, marks.subject, marks.score, student_info.phone_number, student_info.date_of_birth FROM students JOIN marks ON student.student_id = marks.student_id JOIN student_info ON students.student_id = student_info.student_id;
Binder Error:
Referenced table "student" not found!
Candidate tables: "students"

LINE 1: ..., student_info.date_of_birth FROM students JOIN marks ON student.student_id = marks.student_id JOIN student_info...
                                                                    ^
D SELECT students.student_id , students.name, marks.subject, marks.score, student_info.phone_number, student_info.date_of_birth FROM students JOIN marks ON students.student_id = marks.student_id JOIN student_info ON students.student_id = student_info.student_id;
┌────────────┬─────────┬─────────┬───────┬──────────────┬───────────────┐
│ student_id │  name   │ subject │ score │ phone_number │ date_of_birth │
│   int32    │ varchar │ varchar │ int32 │   varchar    │     date      │
├────────────┼─────────┼─────────┼───────┼──────────────┼───────────────┤
│          1 │ Arun    │ Science │    90 │ 7777777      │ 2001-07-02    │
│          2 │ Meera   │ Math    │    78 │ 8888888      │ 2009-11-27    │
│          3 │ Rahul   │ Science │    88 │  5555555     │ 2007-07-07    │
│          1 │ Arun    │ Math    │    85 │ 7777777      │ 2001-07-02    │
└────────────┴─────────┴─────────┴───────┴──────────────┴───────────────┘
D
