
PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D CREATE TABLE class_a (name TEXT);
D CREATE TABLE class_b (name TEXT);
D INSERT INTO class_a ('Arun'),('Meera'),('Rani');
Parser Error:
syntax error at or near "'Arun'"

LINE 1: INSERT INTO class_a ('Arun'),('Meera'),('Rani');
                             ^
D INSERT INTO class_a VALUES ('Arun'),('Meera'),('Rani');
D INSERT INTO class_a VALUES ('Arun','Rani');
Binder Error:
table class_a has 1 columns but 2 values were supplied
D INSERT INTO class_b VALUES ('Arunima'),('Meraj'),('Rani');
D SELECT name FROM class_a UNION SELECT name FROM class_b;
┌─────────┐
│  name   │
│ varchar │
├─────────┤
│ Arunima │
│ Meraj   │
│ Meera   │
│ Rani    │
│ Arun    │
└─────────┘
D SELECT name FROM class_a UNION ALL SELECT name FROM class_b;
┌─────────┐
│  name   │
│ varchar │
├─────────┤
│ Arun    │
│ Meera   │
│ Rani    │
│ Arunima │
│ Meraj   │
│ Rani    │
└─────────┘
D
