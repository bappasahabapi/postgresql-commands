CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(150),
	age INT
);

SELECT * FROM customers;

INSERT INTO customers (first_name, last_name, email, age)
VALUES ('Bdnan','Waheed','a@b.com',40);

-- "Inser multiple data into the table:"
INSERT INTO customers (first_name, last_name)
VALUES 
('ADNAN','WAHEED'),
('JOHN','ADAMS'),
('LINDA','ABE');

-- "insert a data with quotes"
INSERT INTO customers (first_name)
VALUES 
('Bill''O Sullivan');

SELECT * FROM customers;

-- "use 'returning' to get infor on return rows"

INSERT INTO customers (first_name)
VALUES ('HADAM');

-- "showing the only inserted row using strick"
INSERT INTO customers (first_name)
VALUES ('JOSEPH') RETURNING *;

INSERT INTO customers (first_name)
VALUES ('JOSEPH1') RETURNING customer_id;

SELECT * FROM customers;


-- "update data into table "
SELECT * FROM customers;

-- "updating a single collumn"
UPDATE customers
SET email = 'a2@bappa.com'
WHERE customer_id = 1;

-- "updating multiple column"
UPDATE customers
SET 
email = 'a2@b.com',
age = 30
WHERE customer_id = 1;


-- "updating a row and returning a updating row"
SELECT * FROM customers;

UPDATE customers
SET email = 'a2@b.com'
WHERE customer_id = 1
RETURNING *;

-- "updating all records in a table"
update customers
set is_enable ='Y'

update customers
set is_enable ='Y'
returning *;

-- "delete data from table "
SELECT * FROM customers;

DELETE FROM customers 
WHERE customer_id = 9;

DELETE FROM customers;

-- "delete data based on codition "

-- #### using UPSERT query#########
-- combination of update+insert

-- The idea is that when insert a new row into the table ,PostgreSQL will update the row if it already exists,
-- 	otherwise, it will insert the new row.

-- create sample table

CREATE TABLE t_tags( 
	id serial PRIMARY KEY,
	tag text UNIQUE,
	update_date TIMESTAMP DEFAULT NOW()	
);

-- insert some sample data

INSERT INTO t_tags (tag) values
('Pen'),
('Pencil');

-- Lets view the data

SELECT * FROM t_tags;

-- 2020-12-29 19:13:19.392095

-- Lets insert a record, on conflict do noting

INSERT INTO t_tags (tag) 
VALUES ('Pen')
ON CONFLICT (tag) 
DO 
	NOTHING;


SELECT * FROM t_tags;



-- Lets insert a record, on conflict set new values

INSERT INTO t_tags (tag) 
VALUES ('Pen')
ON CONFLICT (tag) 
DO 
	UPDATE SET
		tag = EXCLUDED.tag || '1',
		update_date = NOW();

























































