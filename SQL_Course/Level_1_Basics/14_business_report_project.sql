PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
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
D SELECT COUNT (*) AS total_orders, SUM(amount) AS total_revenue, AVG(amount) AS  average_order_value, MAX(amount) AS highest_order FROM sales;
┌──────────────┬───────────────┬─────────────────────┬───────────────┐
│ total_orders │ total_revenue │ average_order_value │ highest_order │
│    int64     │    int128     │       double        │     int32     │
├──────────────┼───────────────┼─────────────────────┼───────────────┤
│      7       │    313000     │  44714.28571428572  │     72000     │
└──────────────┴───────────────┴─────────────────────┴───────────────┘
D SELECT city, SUM(amount) AS revenue FROM sales GROUP BY city ORDER BY revenue DESC;
┌─────────┬─────────┐
│  city   │ revenue │
│ varchar │ int128  │
├─────────┼─────────┤
│ Chennai │  143000 │
│ Mumbai  │   98000 │
│ Delhi   │   72000 │
└─────────┴─────────┘
D SELECT product , SUM(amount) AS product_revenue FROM sales GROUP BY product ORDER BY product_revenue DESC;
┌─────────┬─────────────────┐
│ product │ product_revenue │
│ varchar │     int128      │
├─────────┼─────────────────┤
│ Laptop  │          210000 │
│ Phone   │           62000 │
│ Tablet  │           41000 │
└─────────┴─────────────────┘
D
