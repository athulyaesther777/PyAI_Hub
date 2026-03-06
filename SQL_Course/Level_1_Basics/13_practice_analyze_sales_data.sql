PS C:\Users\athul> cd D:\temporary_datasets\VScode\SQL\SQL_Basics
PS D:\temporary_datasets\VScode\SQL\SQL_Basics> duckdb pyaihub_analytics.db
DuckDB v1.4.4 (Andium) 6ddac802ff
Enter ".help" for usage hints.
D CREATE TABLE sales ( order_id INTEGER, customer_name TEXT, city TEXT, product TEXT, amount INTEGER, order_date DATE);
D INSERT INTO sales VALUES (1, 'Arun', 'Chennai', 'Laptop', 70000, '2024-01-10'), (2, 'Meera', 'Mumbai', ,'Phone', 30000, '2024-01-12'),(3, 'Ravi', 'Chennai', 'Tablet', 20000, '2024-01-12'),(4, 'Sara', 'Chennai', 'Phone', 32000, '2024-01-15'),(5, 'John', 'Mumbai', 'Laptop', 68000, '2024-01-18'),(6, 'Priya', 'Delhi', 'Laptop', 72000, '2024-01-20'),(7, 'Kiran', 'Chennai', 'Tablet', 21000, '2024-01-22');
Parser Error:
syntax error at or near ","

LINE 1: ...', 'Laptop', 70000, '2024-01-10'), (2, 'Meera', 'Mumbai', ,'Phone', 30000, '2024-01-12'),(3, 'Ravi', 'Chennai', 'Tablet...
                                                                     ^
D INSERT INTO sales VALUES (1, 'Arun', 'Chennai', 'Laptop', 70000, '2024-01-10'), (2, 'Meera', 'Mumbai', 'Phone', 30000, '2024-01-12'),(3, 'Ravi', 'Chennai', 'Tablet', 20000, '2024-01-12'),(4, 'Sara', 'Chennai', 'Phone', 32000, '2024-01-15'),(5, 'John', 'Mumbai', 'Laptop', 68000, '2024-01-18'),(6, 'Priya', 'Delhi', 'Laptop', 72000, '2024-01-20'),(7, 'Kiran', 'Chennai', 'Tablet', 21000, '2024-01-22');
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
D SELECT SUM(amount) AS total_sales FROM sales;
┌─────────────┐
│ total_sales │
│   int128    │
├─────────────┤
│   313000    │
└─────────────┘
D SELECT AVG(amount) AS average_oder_value FROM sales;
┌────────────────────┐
│ average_oder_value │
│       double       │
├────────────────────┤
│ 44714.28571428572  │
└────────────────────┘
D SELECT AVG(amount) AS average_order_value FROM sales;
┌─────────────────────┐
│ average_order_value │
│       double        │
├─────────────────────┤
│  44714.28571428572  │
└─────────────────────┘
D SELECT COUNT(*) AS total_orders FROM sales;
┌──────────────┐
│ total_orders │
│    int64     │
├──────────────┤
│      7       │
└──────────────┘
D SELECT city, SUM(amount), AS total_sales FROM sales GROUP BY city;
Parser Error:
syntax error at or near "AS"

LINE 1: SELECT city, SUM(amount), AS total_sales FROM sales GROUP BY city;
                                  ^
D SELECT city, SUM(amount) AS total_sales FROM sales GROUP BY city;
┌─────────┬─────────────┐
│  city   │ total_sales │
│ varchar │   int128    │
├─────────┼─────────────┤
│ Chennai │      143000 │
│ Mumbai  │       98000 │
│ Delhi   │       72000 │
└─────────┴─────────────┘
D SELECT product, SUM(amount) AS total_sales FROM sales GROUP BY product;
┌─────────┬─────────────┐
│ product │ total_sales │
│ varchar │   int128    │
├─────────┼─────────────┤
│ Laptop  │      210000 │
│ Phone   │       62000 │
│ Tablet  │       41000 │
└─────────┴─────────────┘
D SELECT MAX(amount) AS highest_order FROM sales;
┌───────────────┐
│ highest_order │
│     int32     │
├───────────────┤
│     72000     │
└───────────────┘
D
