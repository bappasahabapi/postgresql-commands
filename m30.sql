-- Active: 1691336670489@@127.0.0.1@5432@module_31

DROP DATABASE test1;

CREATE DATABASE test2;

--! 01. ---------------start ------------ ----- --------

--*           Task : connected database module_30

--!todo: create | rename |update|delete -> a table

CREATE Table student(

    student_id INT,

    first_name VARCHAR(20),

    last_name VARCHAR(20),

    cgpa NUMERIC(1,2)

);

-- ALTER Table student RENAME TO learner;

-- DELETE TABLE learner;

--!todo: create a table with CONSTRAINT

CREATE table
    users(
        user_id SERIAL PRIMARY KEY,
        user_name VARCHAR(255) UNIQUE,
        email VARCHAR(255) UNIQUE
    );

CREATE table
    users1(
        user_id SERIAL PRIMARY KEY,
        user_name VARCHAR(255) UNIQUE NOT NULL,
        email VARCHAR(255) UNIQUE
    );

CREATE table
    users2(
        user_id SERIAL,
        user_name VARCHAR(255) UNIQUE NOT NULL,
        email VARCHAR(255) UNIQUE,
        PRIMARY KEY(user_id, user_name) --composit key
    );

CREATE table
    users3(
        user_id SERIAL,
        user_name VARCHAR(255) UNIQUE NOT NULL,
        email VARCHAR(255) UNIQUE,
        age INT DEFAULT 18
    );

INSERT INTO users3 VALUES (1,'John','John@gmail.com');

SELECT * FROM users3;

--! ---------------end ------------ ----- --------

--! 02. -------------------------- ----- --------

--!todo: Insertion data inito table

CREATE table
    users4(
        user_id SERIAL PRIMARY KEY,
        user_name VARCHAR(255) UNIQUE NOT NULL,
        email VARCHAR(255) UNIQUE,
        age INT DEFAULT 18
    );

SELECT * from users4;

INSERT INTO
    users4 (user_id, user_name, email, age)
VALUES (2, 'kohn', 'kohn@gmail.com', 10);

INSERT INTO
    users4 (user_name, email)
VALUES
('bappa1','bappa@gmail1.com'),
('bappa2', 'bappa@gmail2.com');

-- ## delete row from a table
TRUNCATE TABLE user4;

INSERT INTO users4 
VALUES
(7,'saan','saan@gmail.com'),
(8,'saan1','saan@gmail1.com');
--! -------------------------- ----- --------


--! 03. -------------------------- ----- --------
--                      todo: ALTER TABLE
--* add/delete/update/set initial value/ a column

CREATE table
    person(
        user_id SERIAL PRIMARY KEY,
        user_name VARCHAR(255) UNIQUE NOT NULL,
        email VARCHAR(255) UNIQUE,
        age INT DEFAULT 18
    );

SELECT * FROM person;

INSERT INTO
person (user_id, user_name, email, age)
VALUES (1, 'pohn', 'pohn@gmail.com', 10);


--!             add column to a table
ALTER TABLE person
ADD COLUMN password VARCHAR(255) DEFAULT 'admin123' NOT NULL;

ALTER TABLE person
ADD COLUMN demo INT ;

--!             Chage data type of a column

ALTER TABLE person
ALTER COLUMN demo TYPE FLOAT4;

--!             delete column to a table
ALTER TABLE person 
DROP COLUMN age;


--!            set/remove/rename default value column to a table

ALTER TABLE person
    alter COLUMN demo type TEXT;

ALTER TABLE person
    alter COLUMN demo set DEFAULT 'bangladesh';
ALTER TABLE person
     COLUMN demo DROP DEFAULT ;

INSERT into person VALUES(2,'bappa3','b@gmail.com');
SELECT * FROM person;


ALTER TABLE person
RENAME COLUMN demo TO country;

--!            add constraint column to a table



