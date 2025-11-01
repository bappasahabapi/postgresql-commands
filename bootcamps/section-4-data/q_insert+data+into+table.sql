CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(150),
	age INT
);

SELECT * FROM customers;

--  Inser single data into the table: 
INSERT INTO customers (first_name, last_name, email, age)
VALUES ('Adnan','Waheed','a@b.com',40);

-- Inser multiple data into the table:
INSERT INTO customers (first_name, last_name)
VALUES 
('ADNAN','WAHEED'),
('JOHN','ADAMS'),
('LINDA','ABE');
  