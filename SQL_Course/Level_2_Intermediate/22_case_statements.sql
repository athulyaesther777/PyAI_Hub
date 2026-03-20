
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
D SELECT *FROM marks;
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
D INSERT INTO marks VALUES (27, 'Math', 57), (28, 'Science', 45), (29, 'Math', 37);
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
└────────────┴─────────┴───────┘
D SELECT student_id, subject, score CASE WHEN score >= 50 THEN 'Pass' ELSE 'Fail' END AS result FROM  marks;
Parser Error:
syntax error at or near "CASE"

LINE 1: SELECT student_id, subject, score CASE WHEN score >= 50 THEN 'Pass' ELSE 'Fail' END AS result...
                                          ^
D SELECT student_id, subject, score, CASE WHEN score >= 50 THEN 'Pass' ELSE 'Fail' END AS result FROM  marks;
┌────────────┬─────────┬───────┬─────────┐
│ student_id │ subject │ score │ result  │
│   int32    │ varchar │ int32 │ varchar │
├────────────┼─────────┼───────┼─────────┤
│          1 │ Math    │    85 │ Pass    │
│          1 │ Science │    90 │ Pass    │
│          2 │ Math    │    78 │ Pass    │
│          3 │ Science │    88 │ Pass    │
│         12 │ Math    │    92 │ Pass    │
│         99 │ Math    │    80 │ Pass    │
│         27 │ Math    │    57 │ Pass    │
│         28 │ Science │    45 │ Fail    │
│         29 │ Math    │    37 │ Fail    │
└────────────┴─────────┴───────┴─────────┘
D SELECT student_id, subject, score, CASE WHEN score >= 75 THEN 'Excellent' WHEN score >= 50 THEN 'Average' ELSE 'Needs Improvement' END AS performance FROM marks;
┌────────────┬─────────┬───────┬───────────────────┐
│ student_id │ subject │ score │    performance    │
│   int32    │ varchar │ int32 │      varchar      │
├────────────┼─────────┼───────┼───────────────────┤
│          1 │ Math    │    85 │ Excellent         │
│          1 │ Science │    90 │ Excellent         │
│          2 │ Math    │    78 │ Excellent         │
│          3 │ Science │    88 │ Excellent         │
│         12 │ Math    │    92 │ Excellent         │
│         99 │ Math    │    80 │ Excellent         │
│         27 │ Math    │    57 │ Average           │
│         28 │ Science │    45 │ Needs Improvement │
│         29 │ Math    │    37 │ Needs Improvement │
└────────────┴─────────┴───────┴───────────────────┘
D SELECT  CASE WHEN  score >= 50 THEN 'Pass' ELSE 'Fail' END AS result , COUNT(*) AS total_students FROM marks GROUP BY result;
┌─────────┬────────────────┐
│ result  │ total_students │
│ varchar │     int64      │
├─────────┼────────────────┤
│ Pass    │              7 │
│ Fail    │              2 │
└─────────┴────────────────┘
