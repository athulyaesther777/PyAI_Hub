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
D CREATE TABLE customers (customer_id INTEGER, name TEXT, city TEXT);
D CREATE TABLE orders (order_id INTEGER, customer_id INTEGER, amount INTEGER);
D SHOW TABLES;
┌──────────────┐
│     name     │
│   varchar    │
├──────────────┤
│ class_a      │
│ class_b      │
│ customers    │
│ employees    │
│ marks        │
│ orders       │
│ sales        │
│ student_info │
│ students     │
└──────────────┘
D INSERT INTO customers VALUES (1, 'Arun', 'Chennai'), (2, 'Meera', 'Mumbai'), (3, 'Ravi', 'Delhi');
D INSERT INTO orders VALUES ( 101, 1, 5000), (102, 1, 7000), (103, 2, 3000), (104, 3, 8000);
D SELECT * FROM customers;
┌─────────────┬─────────┬─────────┐
│ customer_id │  name   │  city   │
│    int32    │ varchar │ varchar │
├─────────────┼─────────┼─────────┤
│           1 │ Arun    │ Chennai │
│           2 │ Meera   │ Mumbai  │
│           3 │ Ravi    │ Delhi   │
└─────────────┴─────────┴─────────┘
D SELECT * FROM orders;
┌──────────┬─────────────┬────────┐
│ order_id │ customer_id │ amount │
│  int32   │    int32    │ int32  │
├──────────┼─────────────┼────────┤
│      101 │           1 │   5000 │
│      102 │           1 │   7000 │
│      103 │           2 │   3000 │
│      104 │           3 │   8000 │
└──────────┴─────────────┴────────┘
D SELECT customers.name, orders.amount FROM customers JOIN orders ON customers.customer_id = orders.customer_id;
┌─────────┬────────┐
│  name   │ amount │
│ varchar │ int32  │
├─────────┼────────┤
│ Arun    │   7000 │
│ Meera   │   3000 │
│ Ravi    │   8000 │
│ Arun    │   5000 │
└─────────┴────────┘
D SELECT customers.name, SUM(orders.amount) AS total_spend FROM customers JOIN orders ON customers.customer_id = orders.customer_id;
Binder Error:
column "name" must appear in the GROUP BY clause or must be part of an aggregate function.
Either add it to the GROUP BY list, or use "ANY_VALUE(name)" if the exact value of "name" is not important.

LINE 1: SELECT customers.name, SUM(orders.amount) AS total_spend FROM cust...
               ^
D SELECT customers.name, SUM(orders.amount) AS total_spend FROM customers JOIN orders ON customers.customer_id = orders.customer_id GROUP BY customers.name;
┌─────────┬─────────────┐
│  name   │ total_spend │
│ varchar │   int128    │
├─────────┼─────────────┤
│ Arun    │       12000 │
│ Ravi    │        8000 │
│ Meera   │        3000 │
└─────────┴─────────────┘
D SELECT customers.name, SUM(orders.amount) AS total_spent, CASE  WHEN SUM(orders.amount) >= 7000 THEN 'High Value' ELSE 'Low Value' END AS customer_type FROM customers JOIN orders ON customers.customer_id = orders.customer_id GROUP BY customers.name;
┌─────────┬─────────────┬───────────────┐
│  name   │ total_spent │ customer_type │
│ varchar │   int128    │    varchar    │
├─────────┼─────────────┼───────────────┤
│ Meera   │        3000 │ Low Value     │
│ Arun    │       12000 │ High Value    │
│ Ravi    │        8000 │ High Value    │
└─────────┴─────────────┴───────────────┘
