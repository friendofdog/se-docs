Statements
==========

There are five basic SQL commands (statements):

- [CREATE](#create)
- [SELECT](#select)
- [INSERT](#insert)
- [UPDATE](#update)
- [DELETE](#delete)

These statements can be classified as one of the following:

- Data definition language (DDL): define, change, or drop data
- Data manipulation language (DML): read and modify data

CREATE
------

`CREATE` is a DDL statement which creates a database, schema, or table.

The syntax for creating a table is as follows:

```SQL
CREATE TABLE [database_name.][schema_name.]table_name (
    primary_column data_type PRIMARY KEY NOT NULL,
    column_1 data_type NOT NULL,
    column_2 data_type,
    ...,
    table_constraints
);
```

- `database_name` uses default database unless specified
- `schema_name` uses default schema unless specified
- `table_name` is required
- `primary_column` is the primary key column, as specified by `PRIMARY KEY` keyword
- `data_type` is one of the [data types](#data-types) listed above
- `column_1` and `column_2` are columns; `column_1` has `NON NULL` so it can't be empty
- `table_constraints` are contraints which apply to this table

SELECT
------

`SELECT` is a DML statement used to construct a query to the database. The returned information from a query is called a "result set".

The below will list all `id` and `name` from the table `customers`.

```SQL
SELECT id, name from customers ;
```

You can also query all rows under `customers` by using `*`:

```SQL
SELECT * from customers ;
```

This could be thousands of rows. You can use the expression `LIMIT` to put a cap on the number of rows returned.

```SQL
SELECT * from customers LIMIT 10 ;
```

A `SELECT` statement can further specify which information to query by including a `WHERE` clause. The below will list `id` and `name` from the table `customers` but only if the `id` is greater than 5.

```SQL
SELECT id, name from customers WHERE id > 5 ;
```

The part which follows `WHERE`, `id > 5` is called the "predicate". This is a mandatory search condition which evaluates to True, False, or Unknown.

`COUNT()` will returns the number of rows matching a query, as opposed to the rows themselves. The below returns an integer representing the number of rows where id is greater than 5.

```SQL
SELECT COUNT(id) from customers WHERE id > 5 ;
```

`DISTINCT` removes duplicate values from the result set. The below will return a list of countries which won a gold medal (Olympics), but will not list a country more than once (since it is possible to win a gold medal more than once).

```SQL
SELECT DISTINCT country from countries WHERE medal_type = 'gold' ;
```

INSERT
------

`INSERT` is a DML statement used to add new rows to a table. The syntax is illustrated below, where two rows are being added into a table, `coutries`.

```SQL
INSERT INTO countries
  (country_id, name, iso_code, language)
VALUES
  (123, 'Japan', 'JP', 'JA'),
  (124, 'China', 'CN', 'ZH')
```

It is important the values in the `VALUES` clause line up 1:1 with the specified columns. Also, note that you can add as many rows as you want at a time.

UPDATE
------

`UPDATE` is a DML statement which alters existing data in a table.

DELETE
------

[write this part]

Sources
-------

- https://www.sqlservertutorial.net/sql-server-basics/
