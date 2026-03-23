
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
D SELECT  subject , COUNT(*) AS total FROM marks GROUP BY subject;
┌─────────┬───────┐
│ subject │ total │
│ varchar │ int64 │
├─────────┼───────┤
│ Math    │     7 │
│ Science │     4 │
└─────────┴───────┘
D SELECT subject , score, COUNT(*) AS total FROM marks GROUP BY subject, score;
┌─────────┬───────┬───────┐
│ subject │ score │ total │
│ varchar │ int32 │ int64 │
├─────────┼───────┼───────┤
│ Science │    90 │     2 │
│ Science │    88 │     1 │
│ Math    │    78 │     1 │
│ Math    │    80 │     2 │
│ Math    │    57 │     1 │
│ Math    │    92 │     1 │
│ Science │    45 │     1 │
│ Math    │    37 │     1 │
│ Math    │    85 │     1 │
└─────────┴───────┴───────┘
D SELECT subject , CASE WHEN score >= 50 THEN 'Pass' ELSE 'Fail' END AS result , COUNT(*) AS total FROM marks GROUP BY  subject, result;
┌─────────┬─────────┬───────┐
│ subject │ result  │ total │
│ varchar │ varchar │ int64 │
├─────────┼─────────┼───────┤
│ Math    │ Pass    │     6 │
│ Math    │ Fail    │     1 │
│ Science │ Pass    │     3 │
│ Science │ Fail    │     1 │
└─────────┴─────────┴───────┘
D SELECT subject, COUNT(*) AS total FROM  marks GROUP BY subject HAVING COUNT(*) > 1;
┌─────────┬───────┐
│ subject │ total │
│ varchar │ int64 │
├─────────┼───────┤
│ Math    │     7 │
│ Science │     4 │
└─────────┴───────┘
D SELECT subject, score , COUNT(*) AS total FROM marks GROUP BY  subject, score HAVING COUNT(*) >= 1;
┌─────────┬───────┬───────┐
│ subject │ score │ total │
│ varchar │ int32 │ int64 │
├─────────┼───────┼───────┤
│ Math    │    92 │     1 │
│ Science │    45 │     1 │
│ Math    │    37 │     1 │
│ Science │    90 │     2 │
│ Science │    88 │     1 │
│ Math    │    85 │     1 │
│ Math    │    78 │     1 │
│ Math    │    80 │     2 │
│ Math    │    57 │     1 │
└─────────┴───────┴───────┘
D SELECT subject, score , COUNT(*) AS total FROM marks GROUP BY  subject, score HAVING COUNT(*) > 1;
┌─────────┬───────┬───────┐
│ subject │ score │ total │
│ varchar │ int32 │ int64 │
├─────────┼───────┼───────┤
│ Science │    90 │     2 │
│ Math    │    80 │     2 │
└─────────┴───────┴───────┘
D
