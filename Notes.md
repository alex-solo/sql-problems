## Inner Join: 
Most frequently used join, it returns a result set that contains the common elements from the joined tables. Each element is selected when
the join condition is met.

## Outer Left/Right Join:
ex. users LEFT OUTER JOIN addresses


Returns result set that matches on a join condition and includes all rows from the left/right table even if condition is not met. In other words, this type of join will return all rows from the left/right table and matching rows from the right/left table.

## 3 Languages of SQL
* DDL

Data Definition Language is used to define structure or schema of the database. DDL statements can be used to create, remove or modify database objects like tables and columns.

* DML

Data Manipulation Language is used to create, read, update and delete values that are stored within relations. Responsible for retrieving/modifying data.

* DCL

Data Control Language is used to determine what various users are allowed to do when interacting with a database. It is concerned with the "security" of a database.

## GROUP BY, ORDER BY, WHERE, and HAVING

```SQL
SELECT bidders.name, count(bids.id) AS count FROM bidders JOIN bids ON bidders.id = bids.bidder_id
WHERE bidders.name LIKE 'Al%'
GROUP BY bidders.name HAVING count(bids.id) >= 3
ORDER BY count ASC;
```

## INSERT, UPDATE, DELETE, CREATE/ALTER/DROP TABLE, ADD/ALTER/DROP COLUMN.

* INSERT
```SQL
INSERT INTO items (name, initial_price, sales_price) VALUES
('Speakers', 39.99, 59.99),
('Golf Clubs', 100.00, 200.00);
```

* UPDATE
```SQL
UPDATE items SET sales_price = 250.00 WHERE id = 8;
```

* DELETE
```SQL
DELETE FROM items WHERE name = 'Television' AND sales_price IS NULL;
```

* CREATE/ALTER/DROP TABLE
###### CREATE TABLE
```SQL
CREATE TABLE people (
id integer PRIMARY KEY,
name varchar(100),
age integer,
occupation varchar(100)
);
```
###### ADD CONSTRAINT to Table
```SQL
ALTER TABLE people
ADD CONSTRAINT positive_age CHECK (age > 0);
```
OR simply:

```SQL
ALTER TABLE people
ADD CHECK (age > 0);
```
###### Add Foreign Key after Table was created
```SQL
ALTER TABLE orders
ADD CONSTRAINT orders_products_id_fkey
FOREIGN KEY (product_id) REFERENCES products (id);
```
OR simply:

```SQL
ALTER TABLE orders
ADD FOREIGN KEY (product_id) REFERENCES products (id);
```
###### Remove Foreign Key
```SQL
ALTER TABLE orders DROP CONSTRAINT orders_products_id_fkey;
```
* ADD/ALTER/DROP COLUMN
###### ADD COLUMN
```SQL
ALTER TABLE expenses
ADD COLUMN memo text NOT NULL;
```
###### DROP COLUMN
```SQL
ALTER TABLE expenses DROP memo;
```
###### ALTER COLUMN (Add Constraint, Remove Constraint, Change Data Type)
```SQL
ALTER TABLE employees
ALTER COLUMN vacation_remaining SET DEFAULT 0;
```
```SQL
ALTER TABLE names
ALTER COLUMN email DROP DEFAULT;
```
```SQL
ALTER TABLE expenses
solosphere-# ALTER COLUMN memo TYPE varchar(100);
```

## Primary, Foreign, Surrogate Keys

Keys are a special type of constraint used to establish relationships and uniqueness. They can be used to identify a specific row in the current table or refer to specific row in a different table.

* Primary Key 

is a unique identifier for a row of a data. For example "id" column uniquely identifies rows. Each table can have only one primary key.

* Foreign Key

allows us to associate a row in one table with a row in another table. This is done by setting one column in one table as a Foreign Key and having that column reference another table's Primary Key column.

* Natural Key

existing value in a dataset that can be use to uniquely identify rows of data in a dataset.

* Surrogate Key

is a value that is specifically generated to uniquely identify rows of data in a database table.

## Describe what a sequence is and what they are used for

A sequence is a feature in a database that creates a unique value. It increments the value by a specified amount and returns it.
[CREATE SEQUENCE Syntax](https://www.postgresql.org/docs/8.4/static/sql-createsequence.html)

```SQL
CREATE SEQUENCE phonebook_id_seq;
```
```SQL
SELECT nexval('phonebook_id_seq');
```
###### Use a custom sequence:
```SQL
CREATE TABLE phonebook (
id integer DEFAULT NEXTVAL('phonebook_id_seq'), 
phone VARCHAR(32)
);
```

## Define cardinality and modality.

* Cardinality

refers to the number of objects on each side of the relationship and refers to relationships between tables being one-to-one, one-to-many or many-to-many.

* Modality

indicates whether the relationship is required or optional. It is the lower bound on how many instances there can be in a relationship.

## Subqueries

###### Subquery in WHERE clause
```SQL
SELECT singers.name FROM singers
WHERE singers.id NOT IN
(SELECT singer_id FROM albums);
```
###### Subquery in FROM clause
```SQL
SELECT max(bid_counts.count) FROM
  (SELECT count(bidder_id) FROM bids
  GROUP BY bidder_id) AS bid_counts;
```
###### Subquery in SELECT clause

The subquery can refer to variables from the surrounding query which will act as constants of the subquery.
```SQL
SELECT name,
  (SELECT count(item_id) FROM bids
  WHERE item_id = items.id)
FROM items;
```
