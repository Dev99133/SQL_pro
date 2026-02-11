mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ab                 |
| data_digger        |
| data_transformer   |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.038 sec)

mysql>
mysql> CREATE DATABASE university_db;
Query OK, 1 row affected (0.188 sec)

mysql> USE university_db;
Database changed
mysql>
mysql> CREATE TABLE Students (
    ->     StudentID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     BirthDate DATE,
    ->     EnrollmentDate DATE
    -> );
Query OK, 0 rows affected (0.420 sec)

mysql>
mysql> INSERT INTO Students VALUES
    -> (1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
    -> (2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-20', '2021-08-01');
Query OK, 2 rows affected (0.126 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Students VALUES
    -> (1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
    ->
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql>
mysql> INSERT INTO Students VALUES
    -> (3, 'Joshi','Dev', 'jdev86654@gmail.com', '2003-07-20', '2022-08-07'),
    -> (4, 'Morasiya', 'Prerita', 'preri.dd@gmail.com', '2000-08-17', '2022-08-08');
Query OK, 2 rows affected (0.068 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> show tables;
+-------------------------+
| Tables_in_university_db |
+-------------------------+
| students                |
+-------------------------+
1 row in set (0.048 sec)

mysql> select*from students;
+-----------+-----------+----------+----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com   | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com | 1999-05-20 | 2021-08-01     |
|         3 | Joshi     | Dev      | jdev86654@gmail.com  | 2003-07-20 | 2022-08-07     |
|         4 | Morasiya  | Prerita  | preri.dd@gmail.com   | 2000-08-17 | 2022-08-08     |
+-----------+-----------+----------+----------------------+------------+----------------+
4 rows in set (0.004 sec)

mysql>
mysql> CREATE TABLE Departments (
    ->     DepartmentID INT PRIMARY KEY,
    ->     DepartmentName VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.249 sec)

mysql>
mysql> INSERT INTO Departments VALUES
    -> (1, 'Computer Science'),
    -> (2, 'Mathematics'),
    -> (3, 'Python'),
    -> (4, 'AI/ML');
Query OK, 4 rows affected (0.082 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Courses (
    ->     CourseID INT PRIMARY KEY,
    ->     CourseName VARCHAR(100),
    ->     DepartmentID INT,
    ->     Credits INT,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    -> );
Query OK, 0 rows affected (0.585 sec)

mysql>
mysql> INSERT INTO Courses VALUES
    -> (101, 'Introduction to SQL', 1, 3),
    -> (102, 'Data Structures', 2, 4),
    -> (103, 'Matplotlib', 3, 5),
    -> (104, 'Seaborn', 4,6);
Query OK, 4 rows affected (0.083 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Instructors (
    ->     InstructorID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     DepartmentID INT,
    ->     FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    -> );
Query OK, 0 rows affected (0.805 sec)

mysql>
mysql> INSERT INTO Instructors VALUES
    -> (1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
    -> (2, 'Bob', 'Lee', 'bob.lee@univ.com', 2),
    -> (3, 'Deva', 'Joshi', 'dev.joshi@univ.com', 3),
    -> (4, 'Prerita', 'Morasiya', 'preri.mor@univ.com', 4);
Query OK, 4 rows affected (0.081 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE TABLE Enrollments (
    ->     EnrollmentID INT PRIMARY KEY,
    ->     StudentID INT,
    ->     CourseID INT,
    ->     EnrollmentDate DATE,
    ->     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    ->     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
    -> );
Query OK, 0 rows affected (0.674 sec)

mysql>
mysql> INSERT INTO Enrollments VALUES
    -> (1, 1, 101, '2022-08-01'),
    -> (2, 2, 102, '2021-08-01'),
    -> (3, 3, 103, '2022-08-07'),
    -> (4, 4, 104, '2022-08-08');
Query OK, 4 rows affected (0.083 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO Students VALUES
    -> (5, 'Rahul', 'Patel', 'rahul@email.com', '2001-03-10', '2023-08-01');
Query OK, 1 row affected (0.081 sec)

mysql> ^C
mysql> SELECT * FROM Students;
+-----------+-----------+----------+----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com   | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com | 1999-05-20 | 2021-08-01     |
|         3 | Joshi     | Dev      | jdev86654@gmail.com  | 2003-07-20 | 2022-08-07     |
|         4 | Morasiya  | Prerita  | preri.dd@gmail.com   | 2000-08-17 | 2022-08-08     |
|         5 | Rahul     | Patel    | rahul@email.com      | 2001-03-10 | 2023-08-01     |
+-----------+-----------+----------+----------------------+------------+----------------+
5 rows in set (0.011 sec)

mysql>
mysql> UPDATE Students
    -> SET Email = 'john.updated@email.com'
    -> WHERE StudentID = 1;
Query OK, 1 row affected (0.073 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> DELETE FROM Students
    -> WHERE StudentID = 3;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`university_db`.`enrollments`, CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`))
mysql>
mysql>
mysql> SELECT * FROM Students
    -> WHERE EnrollmentDate > '2022-12-31';
+-----------+-----------+----------+-----------------+------------+----------------+
| StudentID | FirstName | LastName | Email           | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+-----------------+------------+----------------+
|         5 | Rahul     | Patel    | rahul@email.com | 2001-03-10 | 2023-08-01     |
+-----------+-----------+----------+-----------------+------------+----------------+
1 row in set (0.032 sec)

mysql>
mysql> SELECT c.CourseName
    -> FROM Courses c
    -> JOIN Departments d ON c.DepartmentID = d.DepartmentID
    -> WHERE d.DepartmentName = 'Mathematics'
    -> LIMIT 5;
+-----------------+
| CourseName      |
+-----------------+
| Data Structures |
+-----------------+
1 row in set (0.055 sec)

mysql>
mysql> SELECT CourseID, COUNT(StudentID) AS TotalStudents
    -> FROM Enrollments
    -> GROUP BY CourseID
    -> HAVING COUNT(StudentID) > 5;
Empty set (0.021 sec)

mysql>
mysql>
mysql> SELECT StudentID
    -> FROM Enrollments
    -> WHERE CourseID IN (101, 102)
    -> GROUP BY StudentID
    -> HAVING COUNT(DISTINCT CourseID) = 2;
Empty set (0.053 sec)

mysql> SELECT DISTINCT StudentID
    -> FROM Enrollments
    -> WHERE CourseID IN (101, 102);
+-----------+
| StudentID |
+-----------+
|         1 |
|         2 |
+-----------+
2 rows in set (0.012 sec)

mysql>
mysql> SELECT AVG(Credits) AS AvgCredits
    -> FROM Courses;
+------------+
| AvgCredits |
+------------+
|     4.5000 |
+------------+
1 row in set (0.009 sec)

mysql>
mysql> ALTER TABLE Instructors ADD Salary DECIMAL(10,2);
Query OK, 0 rows affected (0.467 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> UPDATE Instructors SET Salary = 70000 WHERE InstructorID = 1;
Query OK, 1 row affected (0.048 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Instructors SET Salary = 65000 WHERE InstructorID = 2;
Query OK, 1 row affected (0.051 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> SELECT MAX(Salary)
    -> FROM Instructors i
    -> JOIN Departments d ON i.DepartmentID = d.DepartmentID
    -> WHERE d.DepartmentName = 'Computer Science';
+-------------+
| MAX(Salary) |
+-------------+
|    70000.00 |
+-------------+
1 row in set (0.007 sec)

mysql>
mysql> SELECT d.DepartmentName, COUNT(e.StudentID) AS TotalStudents
    -> FROM Departments d
    -> JOIN Courses c ON d.DepartmentID = c.DepartmentID
    -> JOIN Enrollments e ON c.CourseID = e.CourseID
    -> GROUP BY d.DepartmentName;
+------------------+---------------+
| DepartmentName   | TotalStudents |
+------------------+---------------+
| Computer Science |             1 |
| Mathematics      |             1 |
| Python           |             1 |
| AI/ML            |             1 |
+------------------+---------------+
4 rows in set (0.034 sec)

mysql>
mysql> SELECT s.FirstName, c.CourseName
    -> FROM Students s
    -> INNER JOIN Enrollments e ON s.StudentID = e.StudentID
    -> INNER JOIN Courses c ON e.CourseID = c.CourseID;
+-----------+---------------------+
| FirstName | CourseName          |
+-----------+---------------------+
| John      | Introduction to SQL |
| Jane      | Data Structures     |
| Joshi     | Matplotlib          |
| Morasiya  | Seaborn             |
+-----------+---------------------+
4 rows in set (0.011 sec)

mysql>
mysql> SELECT s.FirstName, c.CourseName
    -> FROM Students s
    -> LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
    -> LEFT JOIN Courses c ON e.CourseID = c.CourseID;
+-----------+---------------------+
| FirstName | CourseName          |
+-----------+---------------------+
| John      | Introduction to SQL |
| Jane      | Data Structures     |
| Joshi     | Matplotlib          |
| Morasiya  | Seaborn             |
| Rahul     | NULL                |
+-----------+---------------------+
5 rows in set (0.011 sec)

mysql>
mysql> SELECT * FROM Students
    -> WHERE StudentID IN (
    ->     SELECT StudentID
    ->     FROM Enrollments
    ->     WHERE CourseID IN (
    ->         SELECT CourseID
    ->         FROM Enrollments
    ->         GROUP BY CourseID
    ->         HAVING COUNT(StudentID) > 10
    ->     )
    -> );
Empty set (0.051 sec)

mysql>
mysql> SELECT StudentID, YEAR(EnrollmentDate) AS EnrollmentYear
    -> FROM Students;
+-----------+----------------+
| StudentID | EnrollmentYear |
+-----------+----------------+
|         1 |           2022 |
|         2 |           2021 |
|         3 |           2022 |
|         4 |           2022 |
|         5 |           2023 |
+-----------+----------------+
5 rows in set (0.009 sec)

mysql>
mysql>
mysql> SELECT CONCAT(FirstName, ' ', LastName) AS InstructorName
    -> FROM Instructors;
+------------------+
| InstructorName   |
+------------------+
| Alice Johnson    |
| Bob Lee          |
| Deva Joshi       |
| Prerita Morasiya |
+------------------+
4 rows in set (0.009 sec)

mysql>
mysql>
mysql> SELECT
    ->     CourseID,
    ->     COUNT(StudentID) OVER (ORDER BY CourseID) AS RunningTotal
    -> FROM Enrollments;
+----------+--------------+
| CourseID | RunningTotal |
+----------+--------------+
|      101 |            1 |
|      102 |            2 |
|      103 |            3 |
|      104 |            4 |
+----------+--------------+
4 rows in set (0.012 sec)

mysql>
mysql>
mysql> SELECT
    ->     StudentID,
    ->     EnrollmentDate,
    ->     CASE
    ->         WHEN EnrollmentDate <= DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
    ->         THEN 'Senior'
    ->         ELSE 'Junior'
    ->     END AS StudentLevel
    -> FROM Students;
+-----------+----------------+--------------+
| StudentID | EnrollmentDate | StudentLevel |
+-----------+----------------+--------------+
|         1 | 2022-08-01     | Junior       |
|         2 | 2021-08-01     | Senior       |
|         3 | 2022-08-07     | Junior       |
|         4 | 2022-08-08     | Junior       |
|         5 | 2023-08-01     | Junior       |
+-----------+------------