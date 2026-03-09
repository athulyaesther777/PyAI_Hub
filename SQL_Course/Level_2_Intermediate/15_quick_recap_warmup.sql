C:\Program Files\DuckDB\duckdb.exe (PID 3368)
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D SELECT * FROM sales;
┌──────────┬───────────────┬─────────┬─────────┬────────┬────────────┐
│ order_id │ customer_name │  city   │ product │ amount │ order_date │
│  int32   │    varchar    │ varchar │ varchar │ int32  │    date    │
├──────────┼───────────────┼─────────┼─────────┼────────┼────────────┤
│        1 │ Arun          │ Chennai │ Laptop  │  70000 │ 2024-01-10 │
│        2 │ Meera         │ Mumbai  │ Phone   │  30000 │ 2024-01-12 │
│        3 │ Ravi          │ Chennai │ Tablet  │  20000 │ 2024-01-12 │
│        4 │ Sara          │ Chennai │ Phone   │  32000 │ 2024-01-15 │
│        5 │ John          │ Mumbai  │ Laptop  │  68000 │ 2024-01-18 │
│        6 │ Priya         │ Delhi   │ Laptop  │  72000 │ 2024-01-20 │
│        7 │ Kiran         │ Chennai │ Tablet  │  21000 │ 2024-01-22 │
└──────────┴───────────────┴─────────┴─────────┴────────┴────────────┘
D SHOW TABLES;
┌──────────┐
│   name   │
│ varchar  │
├──────────┤
│ marks    │
│ sales    │
│ students │
└──────────┘
D SELECT * FROM sales WHERE city = 'Chennai';
┌──────────┬───────────────┬─────────┬─────────┬────────┬────────────┐
│ order_id │ customer_name │  city   │ product │ amount │ order_date │
│  int32   │    varchar    │ varchar │ varchar │ int32  │    date    │
├──────────┼───────────────┼─────────┼─────────┼────────┼────────────┤
│        1 │ Arun          │ Chennai │ Laptop  │  70000 │ 2024-01-10 │
│        3 │ Ravi          │ Chennai │ Tablet  │  20000 │ 2024-01-12 │
│        4 │ Sara          │ Chennai │ Phone   │  32000 │ 2024-01-15 │
│        7 │ Kiran         │ Chennai │ Tablet  │  21000 │ 2024-01-22 │
└──────────┴───────────────┴─────────┴─────────┴────────┴────────────┘
D SELECT SUM(amount) AS total_sales FROM sales ;
┌─────────────┐
│ total_sales │
│   int128    │
├─────────────┤
│   313000    │
└─────────────┘
D SELECT city , SUM(amount) AS total_sales FROM sales GROUP BY city;
┌─────────┬─────────────┐
│  city   │ total_sales │
│ varchar │   int128    │
├─────────┼─────────────┤
│ Chennai │      143000 │
│ Mumbai  │       98000 │
│ Delhi   │       72000 │
└─────────┴─────────────┘
D SELECT city, SUM(amount) AS total_sales FROM sales GROUP BY city ORDER BY total_sales DESC;
┌─────────┬─────────────┐
│  city   │ total_sales │
│ varchar │   int128    │
├─────────┼─────────────┤
│ Chennai │      143000 │
│ Mumbai  │       98000 │
│ Delhi   │       72000 │
└─────────┴─────────────┘
D SELECT city, SUM(amount) AS total_sales FROM sales GROUP BY city ORDER BY city DESC;
┌─────────┬─────────────┐
│  city   │ total_sales │
│ varchar │   int128    │
├─────────┼─────────────┤
│ Mumbai  │       98000 │
│ Delhi   │       72000 │
│ Chennai │      143000 │
└─────────┴─────────────┘
D SELECT city, SUM(amount) AS total_sales FROM sales GROUP BY city ORDER BY city ;
┌─────────┬─────────────┐
│  city   │ total_sales │
│ varchar │   int128    │
├─────────┼─────────────┤
│ Chennai │      143000 │
│ Delhi   │       72000 │
│ Mumbai  │       98000 │
└─────────┴─────────────┘
D
