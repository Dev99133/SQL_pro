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
6 rows in set (0.089 sec)

mysql>
mysql> CREATE DATABASE data_transformer;
Query OK, 1 row affected (0.130 sec)

mysql> USE data_transformer;
Database changed
mysql>
mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     RegistrationDate DATE
    -> );
Query OK, 0 rows affected (1.032 sec)

mysql>
mysql> INSERT INTO Customers VALUES
    -> (1, 'John', 'Doe', '  john.doe@email.com  ', '2022-03-15'),
    -> (2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
    -> (3, 'Joshi', 'Dev', 'jdev86654@gmail.com', '2022-03-20'),
    -> (4, 'Morasiya', 'Prerita', 'preri.dd@email.com', '2023-07-20');
Query OK, 4 rows affected (0.094 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10,2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.930 sec)

mysql>
mysql> INSERT INTO Orders VALUES
    -> (101, 1, '2023-07-01', 150.50),
    -> (102, 2, '2023-07-03', 200.75),
    -> (103, 3, '2023-07-05', 300.25),
    -> (104, 4, '2023-07-20', 220.30);
Query OK, 4 rows affected (0.081 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Employees (
    ->     EmployeeID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Department VARCHAR(50),
    ->     HireDate DATE,
    ->     Salary DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.333 sec)

mysql>
mysql> INSERT INTO Employees VALUES
    -> (1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000),
    -> (2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000),
    -> (3, 'Joshi', 'Dev', 'Manager', '2022-07-20', 60000),
    -> (4, 'Morasiya', 'Prerita', 'Owner', '2015-08-20', 100000);
Query OK, 4 rows affected (0.083 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> select * from Employees;
+------------+-----------+----------+------------+------------+-----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary    |
+------------+-----------+----------+------------+------------+-----------+
|          1 | Mark      | Johnson  | Sales      | 2020-01-15 |  50000.00 |
|          2 | Susan     | Lee      | HR         | 2021-03-20 |  55000.00 |
|          3 | Joshi     | Dev      | Manager    | 2022-07-20 |  60000.00 |
|          4 | Morasiya  | Prerita  | Owner      | 2015-08-20 | 100000.00 |
+------------+-----------+----------+------------+------------+-----------+
4 rows in set (0.028 sec)

mysql>
mysql>
mysql> select o.OrderID, c.FirstName, c.LastName, o.TotalAmount
    -> from Orders o
    -> INNER JOIN Customers c on o.CustomerID = c.CustomerID;
+---------+-----------+----------+-------------+
| OrderID | FirstName | LastName | TotalAmount |
+---------+-----------+----------+-------------+
|     101 | John      | Doe      |      150.50 |
|     102 | Jane      | Smith    |      200.75 |
|     103 | Joshi     | Dev      |      300.25 |
|     104 | Morasiya  | Prerita  |      220.30 |
+---------+-----------+----------+-------------+
4 rows in set (0.021 sec)

mysql>
mysql>
mysql> SELECT c.FirstName, o.OrderID, o.TotalAmount
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
+-----------+---------+-------------+
| FirstName | OrderID | TotalAmount |
+-----------+---------+-------------+
| John      |     101 |      150.50 |
| Jane      |     102 |      200.75 |
| Joshi     |     103 |      300.25 |
| Morasiya  |     104 |      220.30 |
+-----------+---------+-------------+
4 rows in set (0.007 sec)

mysql>
mysql> SELECT c.FirstName, o.OrderID, o.TotalAmount
    -> FROM Customers c
    -> RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
+-----------+---------+-------------+
| FirstName | OrderID | TotalAmount |
+-----------+---------+-------------+
| John      |     101 |      150.50 |
| Jane      |     102 |      200.75 |
| Joshi     |     103 |      300.25 |
| Morasiya  |     104 |      220.30 |
+-----------+---------+-------------+
4 rows in set (0.005 sec)

mysql>
mysql> SELECT c.CustomerID, o.OrderID
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
    ->
    -> UNION
    ->
    -> SELECT c.CustomerID, o.OrderID
    -> FROM Customers c
    -> RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
+------------+---------+
| CustomerID | OrderID |
+------------+---------+
|          1 |     101 |
|          2 |     102 |
|          3 |     103 |
|          4 |     104 |
+------------+---------+
4 rows in set (0.110 sec)

mysql>
mysql> SELECT * FROM Customers
    -> WHERE CustomerID IN (
    ->     SELECT CustomerID
    ->     FROM Orders
    ->     WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
    -> );
+------------+-----------+----------+---------------------+------------------+
| CustomerID | FirstName | LastName | Email               | RegistrationDate |
+------------+-----------+----------+---------------------+------------------+
|          3 | Joshi     | Dev      | jdev86654@gmail.com | 2022-03-20       |
|          4 | Morasiya  | Prerita  | preri.dd@email.com  | 2023-07-20       |
+------------+-----------+----------+---------------------+------------------+
2 rows in set (0.070 sec)

mysql>
mysql> SELECT * FROM Employees
    -> WHERE Salary > (SELECT AVG(Salary) FROM Employees);
+------------+-----------+----------+------------+------------+-----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary    |
+------------+-----------+----------+------------+------------+-----------+
|          4 | Morasiya  | Prerita  | Owner      | 2015-08-20 | 100000.00 |
+------------+-----------+----------+------------+------------+-----------+
1 row in set (0.007 sec)

mysql>
mysql>
mysql> SELECT
    ->     OrderID,
    ->     YEAR(OrderDate) AS OrderYear,
    ->     MONTH(OrderDate) AS OrderMonth
    -> FROM Orders;
+---------+-----------+------------+
| OrderID | OrderYear | OrderMonth |
+---------+-----------+------------+
|     101 |      2023 |          7 |
|     102 |      2023 |          7 |
|     103 |      2023 |          7 |
|     104 |      2023 |          7 |
+---------+-----------+------------+
4 rows in set (0.039 sec)

mysql>
mysql>
mysql> SELECT
    ->     OrderID,
    ->     DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
    -> FROM Orders;
+---------+----------------+
| OrderID | DaysDifference |
+---------+----------------+
|     101 |            956 |
|     102 |            954 |
|     103 |            952 |
|     104 |            937 |
+---------+----------------+
4 rows in set (0.062 sec)

mysql>
mysql> SELECT
    ->     OrderID,
    ->     DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
    -> FROM Orders;
+---------+---------------+
| OrderID | FormattedDate |
+---------+---------------+
|     101 | 01-Jul-2023   |
|     102 | 03-Jul-2023   |
|     103 | 05-Jul-2023   |
|     104 | 20-Jul-2023   |
+---------+---------------+
4 rows in set (0.043 sec)

mysql>
mysql> SELECT
    ->     CONCAT(FirstName, ' ', LastName) AS FullName
    -> FROM Customers;
+------------------+
| FullName         |
+------------------+
| John Doe         |
| Jane Smith       |
| Joshi Dev        |
| Morasiya Prerita |
+------------------+
4 rows in set (0.032 sec)

mysql>
mysql> SELECT
    ->     REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedName
    -> FROM Customers;
+-------------+
| UpdatedName |
+-------------+
| Jonathan    |
| Jane        |
| Joshi       |
| Morasiya    |
+-------------+
4 rows in set (0.037 sec)

mysql>
mysql> SELECT
    ->     UPPER(FirstName) AS FirstName_Upper,
    ->     LOWER(LastName) AS LastName_Lower
    -> FROM Customers;
+-----------------+----------------+
| FirstName_Upper | LastName_Lower |
+-----------------+----------------+
| JOHN            | doe            |
| JANE            | smith          |
| JOSHI           | dev            |
| MORASIYA        | prerita        |
+-----------------+----------------+
4 rows in set (0.054 sec)

mysql>
mysql> SELECT
    ->     TRIM(Email) AS CleanEmail
    -> FROM Customers;
+----------------------+
| CleanEmail           |
+----------------------+
| john.doe@email.com   |
| jane.smith@email.com |
| jdev86654@gmail.com  |
| preri.dd@email.com   |
+----------------------+
4 rows in set (0.004 sec)

mysql>
mysql> SELECT
    ->     OrderID,
    ->     TotalAmount,
    ->     SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
    -> FROM Orders;
+---------+-------------+--------------+
| OrderID | TotalAmount | RunningTotal |
+---------+-------------+--------------+
|     101 |      150.50 |       150.50 |
|     102 |      200.75 |       351.25 |
|     103 |      300.25 |       651.50 |
|     104 |      220.30 |       871.80 |
+---------+-------------+--------------+
4 rows in set (0.067 sec)

mysql>
mysql> SELECT
    ->     OrderID,
    ->     TotalAmount,
    ->     RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
    -> FROM Orders;
+---------+-------------+-----------+
| OrderID | TotalAmount | OrderRank |
+---------+-------------+-----------+
|     103 |      300.25 |         1 |
|     104 |      220.30 |         2 |
|     102 |      200.75 |         3 |
|     101 |      150.50 |         4 |
+---------+-------------+-----------+
4 rows in set (0.029 sec)

mysql>
mysql> SELECT
    ->     OrderID,
    ->     TotalAmount,
    ->     CASE
    ->         WHEN TotalAmount > 1000 THEN '10% Discount'
    ->         WHEN TotalAmount > 500 THEN '5% Discount'
    ->         ELSE 'No Discount'
    ->     END AS Discount
    -> FROM Orders;
+---------+-------------+-------------+
| OrderID | TotalAmount | Discount    |
+---------+-------------+-------------+
|     101 |      150.50 | No Discount |
|     102 |      200.75 | No Discount |
|     103 |      300.25 | No Discount |
|     104 |      220.30 | No Discount |
+---------+-------------+-------------+
4 rows in set (0.005 sec)

mysql>
mysql>
mysql> SELECT
    ->     OrderID,
    ->     TotalAmount,
    ->     CASE
    ->         WHEN TotalAmount > 1000 THEN '10% Discount'
    ->         WHEN TotalAmount > 500 THEN '5% Discount'
    ->         ELSE 'No Discount'
    ->     END AS Discount
    -> FROM Orders;
+---------+-------------+-------------+
| OrderID | TotalAmount | Discount    |
+---------+-------------+-------------+
|     101 |      150.50 | No Discount |
|     102 |      200.75 | No Discount |
|     103 |      300.25 | No Discount |
|     104 |      220.30 | No Discount |
+---------+-------------+-------------+
4 rows in set (0.004 sec)

mysql>
mysql>
mysql> SELECT
    ->     FirstName,
    ->     Salary,
    ->     CASE
    ->         WHEN Salary >= 60000 THEN 'High'
    ->         WHEN Salary >= 50000 THEN 'Medium'
    ->         ELSE 'Low'
    ->     END AS SalaryCategory
    -> FROM Employees;
+-----------+-----------+----------------+
| FirstName | Salary    | SalaryCategory |
+-----------+-----------+----------------+
| Mark      |  50000.00 | Medium         |
| Susan     |  55000.00 | Medium         |
| Joshi     |  60000.00 | High           |
| Morasiya  | 100000.00 | High           |
+-----------+-----------+----------------+
4 rows in set (0.010 sec)