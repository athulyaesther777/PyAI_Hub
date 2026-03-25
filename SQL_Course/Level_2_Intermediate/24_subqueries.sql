
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
├────────────┴─────────┴───────┤
│ 11 rows            3 columns │
└──────────────────────────────┘
D SELECT AVG(score) FROM marks;
┌───────────────────┐
│    avg(score)     │
│      double       │
├───────────────────┤
│ 74.72727272727273 │
└───────────────────┘
D SELECT * FROM marks WHERE score > ( SELECT AVG(score) FROM marks);
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
│         17 │ Math    │    80 │
│         18 │ Science │    90 │
└────────────┴─────────┴───────┘
D SELECT student_id, score , (SELECT AVG(score) FROM marks) AS average_score FROM marks;
┌────────────┬───────┬───────────────────┐
│ student_id │ score │   average_score   │
│   int32    │ int32 │      double       │
├────────────┼───────┼───────────────────┤
│          1 │    85 │ 74.72727272727273 │
│          1 │    90 │ 74.72727272727273 │
│          2 │    78 │ 74.72727272727273 │
│          3 │    88 │ 74.72727272727273 │
│         12 │    92 │ 74.72727272727273 │
│         99 │    80 │ 74.72727272727273 │
│         27 │    57 │ 74.72727272727273 │
│         28 │    45 │ 74.72727272727273 │
│         29 │    37 │ 74.72727272727273 │
│         17 │    80 │ 74.72727272727273 │
│         18 │    90 │ 74.72727272727273 │
├────────────┴───────┴───────────────────┤
│ 11 rows                      3 columns │
└────────────────────────────────────────┘
D SELECT * FROM students WHERE student_id IN (SELECT student_id FROM marks WHERE score >= 80);
┌────────────┬─────────┬───────┬─────────┐
│ student_id │  name   │  age  │  city   │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Arun    │    21 │ Chennai │
│          3 │ Rahul   │    23 │ Delhi   │
│         12 │ Kiran   │    21 │ Chennai │
│         17 │ Deepak  │    25 │ Chennai │
└────────────┴─────────┴───────┴─────────┘
