

--TODO: ALL SELECT commands

CREATE DATABASE bs_movies;

drop table movies;
drop table directors;

select * from directors;
select * from actors;
select * from movies;
select * from movies_revenues;
select * from movies_actors;

--TODO: create table actors();
-- TODO: create table directors();
--TODO: create table movie()--> must have foreign key director_id;
--TODO: create a movies_revenues table();


--TAsk: 2 : Insert Data into table:

-- After makeing first insert sqquencially
-- Insert data into table: directors
-- Insert data into table: actors
-- Insert data into table: movies
-- Insert data into table: movies_revenues
-- Insert data into table: movies_actors


--TODO: ALL SELECT commands

drop table movies;
drop table directors;

select * from directors;
select * from actors;
select * from movies;
select * from movies_revenues;
select * from movies_actors;


--- Task : Creating Table first:

--TODO: 15.creating actors table:
CREATE TABLE actors (
	actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name varchar(150) not null,
	gender char(1),
	date_of_birth date,
	add_date date,
	update_date date
	
);
--TODO: 16.creating directors table:
create table directors (
	director_id serial primary key,
	first_name varchar(150),
	last_name varchar(150),
	date_of_birth date,
	nationality varchar(20),
	add_date date,
	update_date date
);

-- TODO:17.creating movies table:
-- First, create the table properly
CREATE TABLE movies (
  movie_id SERIAL PRIMARY KEY,
  movie_name VARCHAR(100) NOT NULL,
  movie_length INT,
  movie_lang VARCHAR(20),
  release_date DATE,
  age_certificate VARCHAR(10),
  director_id INT REFERENCES directors(director_id)
);

-- Then, insert your records
INSERT INTO movies (movie_name, movie_length, movie_lang, release_date, age_certificate, director_id)
VALUES
('A Clockwork Orange', 112, 'English', '1972-02-02', '18', 13),
('Apocalypse Now', 168, 'English', '1979-08-15', '15', 9),
('Battle Royale', 111, 'Japanese', '2001-01-04', '18', 10),
('Blade Runner', 121, 'English', '1982-06-25', '15', 27);




--TODO: 18.creating movies_revenues table:
create table movies_revenues (
	revenue_id serial primary key,
	movie_id int references movies(movie_id),
	revenues_domestic numeric (10,2),
	revenues_international numeric (10,2)
);

--TODO: 19.creating movies_actions junction table:
create table movies_actors (
	movie_id int references movies(movie_id),
	actor_id int references actors(actor_id),
	primary key (movie_id,actor_id)
);


















