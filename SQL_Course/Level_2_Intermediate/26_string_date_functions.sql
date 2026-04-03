PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SHOW TABLES;
┌──────────────┐
│     name     │
│   varchar    │
├──────────────┤
│ employees    │
│ marks        │
│ sales        │
│ student_info │
│ students     │
└──────────────┘
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
D SELECT  name, UPPER(name) AS upper_name , LOWER(name) AS lower_name FROM students;
┌─────────┬────────────┬────────────┐
│  name   │ upper_name │ lower_name │
│ varchar │  varchar   │  varchar   │
├─────────┼────────────┼────────────┤
│ Arun    │ ARUN       │ arun       │
│ Meera   │ MEERA      │ meera      │
│ Rahul   │ RAHUL      │ rahul      │
│ Ananya  │ ANANYA     │ ananya     │
│ Kiran   │ KIRAN      │ kiran      │
│ Deepa   │ DEEPA      │ deepa      │
│ Arav    │ ARAV       │ arav       │
│ Sneha   │ SNEHA      │ sneha      │
│ Karen   │ KAREN      │ karen      │
│ Deepak  │ DEEPAK     │ deepak     │
│ Ravi    │ RAVI       │ ravi       │
│ Sara    │ SARA       │ sara       │
│ John    │ JOHN       │ john       │
│ Neha    │ NEHA       │ neha       │
├─────────┴────────────┴────────────┤
│ 14 rows                 3 columns │
└───────────────────────────────────┘
D SELECT name , LENGTH(name) AS name_length FROM students;
┌─────────┬─────────────┐
│  name   │ name_length │
│ varchar │    int64    │
├─────────┼─────────────┤
│ Arun    │           4 │
│ Meera   │           5 │
│ Rahul   │           5 │
│ Ananya  │           6 │
│ Kiran   │           5 │
│ Deepa   │           5 │
│ Arav    │           4 │
│ Sneha   │           5 │
│ Karen   │           5 │
│ Deepak  │           6 │
│ Ravi    │           4 │
│ Sara    │           4 │
│ John    │           4 │
│ Neha    │           4 │
├─────────┴─────────────┤
│ 14 rows     2 columns │
└───────────────────────┘
D  SELECT name, city, name || ' - ' || city AS full_info FROM students;
┌─────────┬───────────┬────────────────────┐
│  name   │   city    │     full_info      │
│ varchar │  varchar  │      varchar       │
├─────────┼───────────┼────────────────────┤
│ Arun    │ Chennai   │ Arun - Chennai     │
│ Meera   │ Mumbai    │ Meera - Mumbai     │
│ Rahul   │ Delhi     │ Rahul - Delhi      │
│ Ananya  │ Bangalore │ Ananya - Bangalore │
│ Kiran   │ Chennai   │ Kiran - Chennai    │
│ Deepa   │ Chennai   │ Deepa - Chennai    │
│ Arav    │ Mumbai    │ Arav - Mumbai      │
│ Sneha   │ Mumbai    │ Sneha - Mumbai     │
│ Karen   │ Chennai   │ Karen - Chennai    │
│ Deepak  │ Chennai   │ Deepak - Chennai   │
│ Ravi    │ Delhi     │ Ravi - Delhi       │
│ Sara    │ NULL      │ NULL               │
│ John    │ NULL      │ NULL               │
│ Neha    │ Hyderabad │ Neha - Hyderabad   │
├─────────┴───────────┴────────────────────┤
│ 14 rows                        3 columns │
└──────────────────────────────────────────┘
D SELECT * FROM student_info;
┌────────────┬──────────────┬───────────────┐
│ student_id │ phone_number │ date_of_birth │
│   int32    │   varchar    │     date      │
├────────────┼──────────────┼───────────────┤
│          1 │ 7777777      │ 2001-07-02    │
│          2 │ 8888888      │ 2009-11-27    │
│          3 │  5555555     │ 2007-07-07    │
└────────────┴──────────────┴───────────────┘
D SELECT date_of_birth EXTRACT(YEAR FROM date_of_birth) AS birth_year FROM student_info;
Parser Error:
syntax error at or near "EXTRACT"

LINE 1: SELECT date_of_birth EXTRACT(YEAR FROM date_of_birth) AS birth_year FROM student...
                             ^
D SELECT date_of_birth, EXTRACT(YEAR FROM date_of_birth) AS birth_year FROM student_info;
┌───────────────┬────────────┐
│ date_of_birth │ birth_year │
│     date      │   int64    │
├───────────────┼────────────┤
│ 2001-07-02    │       2001 │
│ 2009-11-27    │       2009 │
│ 2007-07-07    │       2007 │
└───────────────┴────────────┘
D SELECT date_of_birth, EXTRACT(MONTH FROM date_of_birth) AS birth_month FROM student_info;
┌───────────────┬─────────────┐
│ date_of_birth │ birth_month │
│     date      │    int64    │
├───────────────┼─────────────┤
│ 2001-07-02    │           7 │
│ 2009-11-27    │          11 │
│ 2007-07-07    │           7 │
└───────────────┴─────────────┘
D SELECT CURRENT_DATE;
┌──────────────┐
│ CURRENT_DATE │
│     date     │
├──────────────┤
│ 2026-04-03   │
└──────────────┘
D
