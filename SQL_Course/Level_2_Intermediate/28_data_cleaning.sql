
PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SHOW TABLES;
┌──────────────┐
│     name     │
│   varchar    │
├──────────────┤
│ class_a      │
│ class_b      │
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
│         27 │ Esther  │    24 │  Kerala   │
├────────────┴─────────┴───────┴───────────┤
│ 15 rows                        4 columns │
└──────────────────────────────────────────┘
D SELECT name , COALESCE(city, 'Unknown') AS city FROM students;
┌─────────┬───────────┐
│  name   │   city    │
│ varchar │  varchar  │
├─────────┼───────────┤
│ Arun    │ Chennai   │
│ Meera   │ Mumbai    │
│ Rahul   │ Delhi     │
│ Ananya  │ Bangalore │
│ Kiran   │ Chennai   │
│ Deepa   │ Chennai   │
│ Arav    │ Mumbai    │
│ Sneha   │ Mumbai    │
│ Karen   │ Chennai   │
│ Deepak  │ Chennai   │
│ Ravi    │ Delhi     │
│ Sara    │ Unknown   │
│ John    │ Unknown   │
│ Neha    │ Hyderabad │
│ Esther  │  Kerala   │
├─────────┴───────────┤
│ 15 rows   2 columns │
└─────────────────────┘
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
│         27 │ Math    │    57 │
│         28 │ Science │    45 │
│         29 │ Math    │    37 │
│         17 │ Math    │    80 │
│         18 │ Science │    90 │
│         99 │ Math    │    80 │
├────────────┴─────────┴───────┤
│ 12 rows            3 columns │
└──────────────────────────────┘
D SELECT DISTINCT * FROM marks;
┌────────────┬─────────┬───────┐
│ student_id │ subject │ score │
│   int32    │ varchar │ int32 │
├────────────┼─────────┼───────┤
│          1 │ Science │    90 │
│         28 │ Science │    45 │
│          2 │ Math    │    78 │
│          3 │ Science │    88 │
│         27 │ Math    │    57 │
│         17 │ Math    │    80 │
│         18 │ Science │    90 │
│          1 │ Math    │    85 │
│         99 │ Math    │    80 │
│         12 │ Math    │    92 │
│         29 │ Math    │    37 │
├────────────┴─────────┴───────┤
│ 11 rows            3 columns │
└──────────────────────────────┘
D INSERT INTO students VALUE (7, 'Estty', 23, ' Goa');
Parser Error:
syntax error at or near "VALUE"

LINE 1: INSERT INTO students VALUE (7, 'Estty', 23, ' Goa');
                             ^
D INSERT INTO students VALUES (7, 'Estty', 23, ' Goa');
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
│         27 │ Esther  │    24 │  Kerala   │
│          7 │ Estty   │    23 │  Goa      │
├────────────┴─────────┴───────┴───────────┤
│ 16 rows                        4 columns │
└──────────────────────────────────────────┘
D SELECT TRIM(city) AS cleas_city FROM students;
┌────────────┐
│ cleas_city │
│  varchar   │
├────────────┤
│ Chennai    │
│ Mumbai     │
│ Delhi      │
│ Bangalore  │
│ Chennai    │
│ Chennai    │
│ Mumbai     │
│ Mumbai     │
│ Chennai    │
│ Chennai    │
│ Delhi      │
│ NULL       │
│ NULL       │
│ Hyderabad  │
│ Kerala     │
│ Goa        │
├────────────┤
│  16 rows   │
└────────────┘
D INSERT INTO students VALUES (7, 'Estty', 23, 'Pu ne ');
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
│         27 │ Esther  │    24 │  Kerala   │
│          7 │ Estty   │    23 │  Goa      │
│          7 │ Estty   │    23 │ Pu ne     │
├────────────┴─────────┴───────┴───────────┤
│ 17 rows                        4 columns │
└──────────────────────────────────────────┘
D SELECT TRIM(city) AS clean_city FROM students;
┌────────────┐
│ clean_city │
│  varchar   │
├────────────┤
│ Chennai    │
│ Mumbai     │
│ Delhi      │
│ Bangalore  │
│ Chennai    │
│ Chennai    │
│ Mumbai     │
│ Mumbai     │
│ Chennai    │
│ Chennai    │
│ Delhi      │
│ NULL       │
│ NULL       │
│ Hyderabad  │
│ Kerala     │
│ Goa        │
│ Pu ne      │
├────────────┤
│  17 rows   │
└────────────┘
D UPDATE students SET city = REPLACE(city, ' ','') WHERE student_id = 7
┬╖ ;
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
│         27 │ Esther  │    24 │  Kerala   │
│          7 │ Estty   │    23 │ Goa       │
│          7 │ Estty   │    23 │ Pune      │
├────────────┴─────────┴───────┴───────────┤
│ 17 rows                        4 columns │
└──────────────────────────────────────────┘
D SELECT TRIM(city) AS cleas_city FROM students;
┌────────────┐
│ cleas_city │
│  varchar   │
├────────────┤
│ Chennai    │
│ Mumbai     │
│ Delhi      │
│ Bangalore  │
│ Chennai    │
│ Chennai    │
│ Mumbai     │
│ Mumbai     │
│ Chennai    │
│ Chennai    │
│ Delhi      │
│ NULL       │
│ NULL       │
│ Hyderabad  │
│ Kerala     │
│ Goa        │
│ Pune       │
├────────────┤
│  17 rows   │
└────────────┘
D SELECT UPPER(name) AS name_upper FROM students;
┌────────────┐
│ name_upper │
│  varchar   │
├────────────┤
│ ARUN       │
│ MEERA      │
│ RAHUL      │
│ ANANYA     │
│ KIRAN      │
│ DEEPA      │
│ ARAV       │
│ SNEHA      │
│ KAREN      │
│ DEEPAK     │
│ RAVI       │
│ SARA       │
│ JOHN       │
│ NEHA       │
│ ESTHER     │
│ ESTTY      │
│ ESTTY      │
├────────────┤
│  17 rows   │
└────────────┘
D SELECT name, score FROM marks;
Binder Error:
Referenced column "name" not found in FROM clause!
Candidate bindings: "score"

LINE 1: SELECT name, score FROM marks;
               ^
D SELECT subject, score FROM marks;
┌─────────┬───────┐
│ subject │ score │
│ varchar │ int32 │
├─────────┼───────┤
│ Math    │    85 │
│ Science │    90 │
│ Math    │    78 │
│ Science │    88 │
│ Math    │    92 │
│ Math    │    80 │
│ Math    │    57 │
│ Science │    45 │
│ Math    │    37 │
│ Math    │    80 │
│ Science │    90 │
│ Math    │    80 │
├─────────┴───────┤
│     12 rows     │
└─────────────────┘
D INSERT INTO marks VALUES(7, 'Science', -77);
D SELECT name, score FROM marks;
Binder Error:
Referenced column "name" not found in FROM clause!
Candidate bindings: "score"

LINE 1: SELECT name, score FROM marks;
               ^
D SELECT subject, score FROM marks;
┌─────────┬───────┐
│ subject │ score │
│ varchar │ int32 │
├─────────┼───────┤
│ Math    │    85 │
│ Science │    90 │
│ Math    │    78 │
│ Science │    88 │
│ Math    │    92 │
│ Math    │    80 │
│ Math    │    57 │
│ Science │    45 │
│ Math    │    37 │
│ Math    │    80 │
│ Science │    90 │
│ Math    │    80 │
│ Science │   -77 │
├─────────┴───────┤
│     13 rows     │
└─────────────────┘
D SELECT * FROM marks WHERE score >= 0;
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
│         27 │ Math    │    57 │
│         28 │ Science │    45 │
│         29 │ Math    │    37 │
│         17 │ Math    │    80 │
│         18 │ Science │    90 │
│         99 │ Math    │    80 │
├────────────┴─────────┴───────┤
│ 12 rows            3 columns │
└──────────────────────────────┘
D
