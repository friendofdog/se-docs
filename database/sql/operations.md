Operations by Example
=====================

Joining tables
--------------

```
Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+

Address
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
```

Either of the below queries will return `FirstName, LastName, City, State` from the two above tables.

```sql
SELECT p.FirstName, p.LastName, a.City, a.State FROM Person p
LEFT JOIN Address a ON p.PersonId = a.PersonId;
```

```sql
SELECT FirstName, LastName, City, State
FROM Person LEFT JOIN Address
ON Person.PersonId = Address.PersonId
```

Fallback value
--------------

`IFNULL(a, b)` provides a default value, `b`, if `a` returns `NULL`. The below assumes a table, `Employee`, containing a column `Salary` and returns the second highest salary. If there is no second highest salary, it returns `abc`.

```sql
SELECT IFNULL(
  (SELECT DISTINCT Salary FROM Employee
    ORDER BY Salary DESC LIMIT 1 OFFSET 1),
  "abc")
```
