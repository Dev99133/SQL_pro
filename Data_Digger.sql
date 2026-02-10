Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 9.5.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
mysql>
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ab                 |
| data_digger        |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.241 sec)

mysql> use data_digger;
Database changed
mysql> show tables;
+-----------------------+
| Tables_in_data_digger |
+-----------------------+
| customers             |
+-----------------------+
1 row in set (0.067 sec)

mysql> select * from customers;
+------------+---------+-------------------+-------------+
| CustomerID | name    | Email             | address     |
+------------+---------+-------------------+-------------+
|          1 | Alice   | alice@gmail.com   | Ahmedabad   |
|          2 | Bob     | bob@gmail.com     | Surat       |
|          3 | Charlie | charlie@gmail.com | Vadodara    |
|          4 | David   | david@gmail.com   | Rajkot      |
|          5 | Alice   | alice2@gmail.com  | Gandhinagar |
+------------+---------+-------------------+-------------+
5 rows in set (0.028 sec)

mysql> use data_digger;
Database changed
mysql>
mysql> creat table Orders (
    ->     OrderID INT PRIMARY KEY AUTO_INCREMENT,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10,2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'creat table Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID ' at line 1
mysql> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql>
mysql>
mysql>
mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY AUTO_INCREMENT,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10,2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (1.120 sec)

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_data_digger |
+-----------------------+
| customers             |
| orders                |
+-----------------------+
2 rows in set (0.013 sec)

mysql> SELECT * from orders;
Empty set (0.048 sec)

mysql>
mysql>
mysql> CREATE TABLE Products (
    ->     ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ->     ProductName VARCHAR(100),
    ->     Price DECIMAL(10,2),
    ->     Stock INT
    -> );
Query OK, 0 rows affected (0.438 sec)

mysql>
mysql> CREATE TABLE OrderDetails (
    ->     OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    ->     OrderID INT,
    ->     ProductID INT,
    ->     Quantity INT,
    ->     SubTotal DECIMAL(10,2),
    ->     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ->     FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    -> );
Query OK, 0 rows affected (0.887 sec)

mysql> show tables;
+-----------------------+
| Tables_in_data_digger |
+-----------------------+
| customers             |
| orderdetails          |
| orders                |
| products              |
+-----------------------+
4 rows in set (0.016 sec)

mysql>
mysql>
mysql> SELECT * FROM Customers;
+------------+---------+-------------------+-------------+
| CustomerID | name    | Email             | address     |
+------------+---------+-------------------+-------------+
|          1 | Alice   | alice@gmail.com   | Ahmedabad   |
|          2 | Bob     | bob@gmail.com     | Surat       |
|          3 | Charlie | charlie@gmail.com | Vadodara    |
|          4 | David   | david@gmail.com   | Rajkot      |
|          5 | Alice   | alice2@gmail.com  | Gandhinagar |
+------------+---------+-------------------+-------------+
5 rows in set (0.035 sec)

mysql>
mysql>
mysql> update Customers
    -> set address = 'Mumbai'
    -> where CustomerId = 1;
Query OK, 1 row affected (0.135 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers;
+------------+---------+-------------------+-------------+
| CustomerID | name    | Email             | address     |
+------------+---------+-------------------+-------------+
|          1 | Alice   | alice@gmail.com   | Mumbai      |
|          2 | Bob     | bob@gmail.com     | Surat       |
|          3 | Charlie | charlie@gmail.com | Vadodara    |
|          4 | David   | david@gmail.com   | Rajkot      |
|          5 | Alice   | alice2@gmail.com  | Gandhinagar |
+------------+---------+-------------------+-------------+
5 rows in set (0.004 sec)

mysql>
mysql> DELETE FROM Customers
    -> WHERE CustomerID = 5;
Query OK, 1 row affected (0.105 sec)

mysql> SELECT * FROM Customers
    -> WHERE Name = 'Alice';
+------------+-------+-----------------+---------+
| CustomerID | name  | Email           | address |
+------------+-------+-----------------+---------+
|          1 | Alice | alice@gmail.com | Mumbai  |
+------------+-------+-----------------+---------+
1 row in set (0.011 sec)

mysql> insert into Orders (CustomerID, OrderDate, TotalAmount) VALUES
    -> (1, CURDATE(), 4500),
    -> (2, CURDATE() - INTERVAL 5 DAY, 3000),
    -> (3, CURDATE() - INTERVAL 15 DAY, 7000),
    -> (1, CURDATE() - INTERVAL 25 DAY, 12000),
    -> (2, CURDATE() - INTERVAL 40 DAY, 2000);
Query OK, 5 rows affected (0.109 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select*from Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-02-10 |     4500.00 |
|       2 |          2 | 2026-02-05 |     3000.00 |
|       3 |          3 | 2026-01-26 |     7000.00 |
|       4 |          1 | 2026-01-16 |    12000.00 |
|       5 |          2 | 2026-01-01 |     2000.00 |
+---------+------------+------------+-------------+
5 rows in set (0.012 sec)

mysql>
mysql> SELECT * FROM Orders
    -> WHERE CustomerID = 1;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-02-10 |     4500.00 |
|       4 |          1 | 2026-01-16 |    12000.00 |
+---------+------------+------------+-------------+
2 rows in set (0.010 sec)

mysql>
mysql> UPDATE Orders
    -> SET TotalAmount = 5000
    -> WHERE OrderID = 1;
Query OK, 1 row affected (0.079 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> DELETE FROM Orders
    -> WHERE OrderID = 5;
Query OK, 1 row affected (0.089 sec)

mysql> SELECT * FROM Orders
    -> WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-02-10 |     5000.00 |
|       2 |          2 | 2026-02-05 |     3000.00 |
|       3 |          3 | 2026-01-26 |     7000.00 |
|       4 |          1 | 2026-01-16 |    12000.00 |
+---------+------------+------------+-------------+
4 rows in set (0.039 sec)

mysql>
mysql> SELECT
    ->     MAX(TotalAmount) AS Highest,
    ->     MIN(TotalAmount) AS Lowest,
    ->     AVG(TotalAmount) AS Average
    -> FROM Orders;
+----------+---------+-------------+
| Highest  | Lowest  | Average     |
+----------+---------+-------------+
| 12000.00 | 3000.00 | 6750.000000 |
+----------+---------+-------------+
1 row in set (0.107 sec)

mysql>
mysql> INSERT INTO Products (ProductName, Price, Stock) VALUES
    -> ('Laptop', 55000, 10),
    -> ('Mobile', 20000, 15),
    -> ('Headphones', 1500, 50),
    -> ('Keyboard', 800, 0),
    -> ('Monitor', 12000, 8);
Query OK, 5 rows affected (0.072 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from products;
+-----------+-------------+----------+-------+
| ProductID | ProductName | Price    | Stock |
+-----------+-------------+----------+-------+
|         1 | Laptop      | 55000.00 |    10 |
|         2 | Mobile      | 20000.00 |    15 |
|         3 | Headphones  |  1500.00 |    50 |
|         4 | Keyboard    |   800.00 |     0 |
|         5 | Monitor     | 12000.00 |     8 |
+-----------+-------------+----------+-------+
5 rows in set (0.004 sec)

mysql>
mysql>  SELECT * FROM Products
    -> ORDER BY Price DESC;
+-----------+-------------+----------+-------+
| ProductID | ProductName | Price    | Stock |
+-----------+-------------+----------+-------+
|         1 | Laptop      | 55000.00 |    10 |
|         2 | Mobile      | 20000.00 |    15 |
|         5 | Monitor     | 12000.00 |     8 |
|         3 | Headphones  |  1500.00 |    50 |
|         4 | Keyboard    |   800.00 |     0 |
+-----------+-------------+----------+-------+
5 rows in set (0.010 sec)

mysql> UPDATE Products
    -> SET Price = 18000
    -> WHERE ProductName = 'Mobile';
Query OK, 1 row affected (0.089 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> DELETE FROM Products
    -> WHERE Stock = 0;
Query OK, 1 row affected (0.073 sec)

mysql>
mysql> SELECT * FROM Products
    -> WHERE Price BETWEEN 500 AND 2000;
+-----------+-------------+---------+-------+
| ProductID | ProductName | Price   | Stock |
+-----------+-------------+---------+-------+
|         3 | Headphones  | 1500.00 |    50 |
+-----------+-------------+---------+-------+
1 row in set (0.041 sec)

mysql>
mysql> SELECT
    ->     MAX(Price) AS MostExpensive,
    ->     MIN(Price) AS Cheapest
    -> FROM Products;
+---------------+----------+
| MostExpensive | Cheapest |
+---------------+----------+
|      55000.00 |  1500.00 |
+---------------+----------+
1 row in set (0.010 sec)

mysql>
mysql>
mysql> INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
    -> (1, 1, 1, 55000),
    -> (1, 3, 2, 3000),
    -> (2, 2, 1, 18000),
    -> (3, 5, 1, 12000),
    -> (4, 1, 2, 110000);
Query OK, 5 rows affected (0.119 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from OrderDetails;
+---------------+---------+-----------+----------+-----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal  |
+---------------+---------+-----------+----------+-----------+
|             1 |       1 |         1 |        1 |  55000.00 |
|             2 |       1 |         3 |        2 |   3000.00 |
|             3 |       2 |         2 |        1 |  18000.00 |
|             4 |       3 |         5 |        1 |  12000.00 |
|             5 |       4 |         1 |        2 | 110000.00 |
+---------------+---------+-----------+----------+-----------+
5 rows in set (0.004 sec)

mysql>
mysql>
mysql> SELECT * FROM OrderDetails
    -> WHERE OrderID = 1;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 | 55000.00 |
|             2 |       1 |         3 |        2 |  3000.00 |
+---------------+---------+-----------+----------+----------+
2 rows in set (0.010 sec)

mysql>
mysql> SELECT SUM(SubTotal) AS TotalRevenue
    -> FROM OrderDetails;
+--------------+
| TotalRevenue |
+--------------+
|    198000.00 |
+--------------+
1 row in set (0.010 sec)

mysql>
mysql>
mysql> SELECT ProductID, SUM(Quantity) AS TotalOrdered
    -> FROM OrderDetails
    -> GROUP BY ProductID
    -> ORDER BY TotalOrdered DESC
    -> LIMIT 3;
+-----------+--------------+
| ProductID | TotalOrdered |
+-----------+--------------+
|         1 |            3 |
|         3 |            2 |
|         2 |            1 |
+-----------+--------------+
3 rows in set (0.013 sec)

mysql>
mysql> SELECT ProductID, COUNT(*) AS TimesSold
    -> FROM OrderDetails
    -> WHERE ProductID = 1;
+-----------+-----------+
| ProductID | TimesSold |
+-----------+-----------+
|         1 |         2 |
+-----------+-----------+