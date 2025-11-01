## Working on Postgresql

### 👍 To Perform the AGGREGATE Fuction 


 
## 📂 Database Setup

1. First we need to make a database

```sql
CREATE DATABASE bs_movies;
```

<details>
<summary>🧱 Step 2: Create <b>Tables</b> </summary>
<br>
Go to the file <b>create_tables.sql</b> and execuate query

<br>

```sql

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

-- End of table creation

```
</details>



<details>
<summary>🧱 Step 3: Insert <b>data sequencially</b> to the  Table</summary>

<b>TAsk: 2 : Insert Data into table:</b>


- After makeing first insert squencially
- Insert data into table: directors
- Insert data into table: actors
- Insert data into table: movies
- Insert data into table: movies_revenues
- Insert data into table: movies_actors

<br>

```sql
-- ---------------------------------------------------
--  Records of 'movies' database > table : directors
-- ---------------------------------------------------
INSERT INTO directors (first_name,last_name,date_of_birth,nationality) VALUES
('Tomas','Alfredson','1965-04-01','Swedish'),
('Paul','Anderson','1970-06-26','American'),
('Wes','Anderson','1969-05-01','American'),
('Richard','Ayoade','1977-06-12','British'),
('Luc','Besson','1959-03-18','French'),
('James','Cameron','1954-08-16','American'),
('Guillermo','del Toro','1964-10-09','Mexican'),
('Victor','Fleming','1889-02-23','American'),
('Francis','Ford Coppola','1939-04-07','American'),
('Kinji','Fukasaku','1930-07-03','Japanese'),
('Florian ','Henckel von Donnersmarck','1973-05-02','German'),
('Terry','Jones','1942-02-01','British'),
('Stanley','Kubrick','1928-07-26','American'),
('John','Lasseter','1957-01-12','American'),
('Ang','Lee','1954-10-23','Chinese'),
('Bruce','Lee','1940-11-27','Chinese'),
('George','Lucas','1944-05-14','American'),
('Martin','McDonagh','1970-03-26','British'),
('James','McTeigue','1967-12-29','Australian'),
('Fernando','Meirelles','1955-11-09','Brazilian'),
('Hayao ','Miyazaki','1941-01-05','Japanese'),
('Paulo','Morelli','1966-03-10','Brazilian'),
('Chan-wook','Park','1963-08-23','South Korean'),
('Sam','Raimi','1959-10-23','American'),
('Mark','Romanek','1959-09-18','American'),
('Martin','Scorsese','1942-11-17','American'),
('Ridley','Scott','1937-11-30','British'),
('Tony','Scott','1944-06-21','British'),
('Zack','Snyder','1966-03-01','American'),
('Sion','Sono','1961-12-18','Japanese'),
('Steven','Spielberg','1946-12-18','American'),
('Robert','Stevenson','1905-03-31','British'),
('Quentin','Tarantino','1963-03-27','American'),
('Robert','Wise','1914-09-10','American'),
('Kar Wai','Wong','1958-07-17','Chinese'),
('Robert','Zemeckis','1952-05-14','American'),
('Yimou','Zhang','1950-04-02','Chinese');

```

```sql
-- ---------------------------------------------------
--  Records of 'movies' database > table : actors
-- ---------------------------------------------------
INSERT INTO actors (first_name,last_name,gender,date_of_birth) VALUES
('Malin','Akerman','F','1978-05-12'),
('Tim','Allen','M','1953-06-13'),
('Julie','Andrews','F','1935-10-01'),
('Ivana','Baquero','F','1994-06-11'),
('Lorraine','Bracco','F','1954-10-02'),
('Alice','Braga','F','1983-04-15'),
('Marlon','Brando','M','1924-04-03'),
('Adrien','Brody','M','1973-04-14'),
('Peter','Carlberg','M','1950-12-08'),
('Gemma','Chan','F','1982-11-29'),
('Chen','Chang','M','1976-10-14'),
('Graham','Chapman','M','1941-01-08'),
('Pei-pei','Cheng','F','1946-12-04'),
('Maggie ','Cheung','F','1964-09-20'),
('Min-sik','Choi','M','1962-05-30'),
('Yun-fat','Chow','M','1955-05-18'),
('John','Cleese','M','1939-10-27'),
('Paddy','Considine','M','1973-09-05'),
('Abbie','Cornish','F','1982-08-07'),
('Brian','Cox','M','1946-06-01'),
('Scatman','Crothers','M','1910-05-23'),
('Russell','Crowe','M','1964-04-07'),
('Tom','Cruise','M','1962-07-03'),
('Darlan','Cunha','M','1988-07-26'),
('Willem','Dafoe','M','1955-07-22'),
('Paul','Dano','M','1984-06-19'),
('Daniel','Day-Lewis','M','1957-04-29'),
('Robert','De Niro','M','1943-08-17'),
(null,'Denden','M','1950-01-23'),
('Leonardo','DiCaprio','M','1974-11-11'),
('Peter','Dinklage','M','1969-06-11'),
('Hiroki','Doi','M','1999-08-10'),
('Kirsten','Dunst','F','1982-04-30'),
('Shelley','Duvall','F','1949-07-07'),
('Ralph','Fiennes','M','1962-12-22'),
('Leandro','Firmino','M','1978-06-23'),
('Carrie','Fisher','F','1956-10-21'),
('Harrison','Ford','M','1942-07-13'),
('Jodie','Foster','F','1962-11-19'),
('James','Franco','M','1978-04-19'),
('Dillon','Freasier','M','1996-03-06'),
('Tatsuya','Fujiwara','M','1982-05-15'),
('Mitsuru','Fukikoshi','M','1965-02-17'),
('Clark','Gable','M','1901-02-01'),
('Mason','Gamble','M','1986-01-16'),
('Xian','Gao','M',null),
('Andrew','Garfield','M','1983-08-20'),
('Judy','Garland','F','1922-06-10'),
('Martina','Gedeck','F','1961-09-14'),
('Jeff','Goldblum','M','1952-10-22'),
('Carla','Gugino','F','1971-08-29'),
('Alec','Guiness','M','1914-04-02'),
('Jackey','Haley','M','1961-07-14'),
('Mark','Hamill','M','1951-09-25'),
('Tom','Hanks','M','1956-07-09'),
('Daryl','Hannah','F','1958-12-03'),
('Woody','Harrelson','M','1961-07-23'),
('Rutger','Hauer','M','1944-01-23'),
('Sally','Hawkins','F','1976-04-27'),
('Kare','Hedebrant','M','1995-06-28'),
('Rumi','Hiiragi','F','1987-08-01'),
('Ian','Holm','M','1931-09-12'),
('Dennis','Hopper','M','1936-05-17'),
('Eric','Idle','M','1943-03-29'),
('Miyu','Irino','M','1988-02-19'),
('Samuel','Jackson','M','1948-12-21'),
('Terry','Jones','M','1942-02-01'),
('Milla','Jovovich','F','1975-12-17'),
('Megumi','Kagurazaka','F','1981-09-28'),
('Takeshi','Kaneshiro','M','1973-10-11'),
('Hei-Jung','Kang','F','1982-01-04'),
('Irfan','Khan','M','1967-01-07'),
('Nicole','Kidman','F','1967-06-20'),
('Val','Kilmer','M','1959-12-31'),
('Takeshi','Kitano','M','1947-01-18'),
('Keira','Knightley','F','1985-03-26'),
('Sebastian','Koch','M','1962-05-31'),
('Asuka','Kurosawa','F','1971-12-22'),
('Andy','Lau','M','1961-09-27'),
('Jude','Law','M','1972-12-29'),
('Lina','Leandersson','F','1995-09-27'),
('Bruce','Lee','M','1940-11-27'),
('Vivien','Leigh','F','1913-11-05'),
('Tony','Leung','M','1962-06-27'),
('Ray','Liotta','M','1954-12-18'),
('Danny','Lloyd','M','1972-10-13'),
('Sihung','Lung','M','1930-01-01'),
('Aki','Maeda','F','1985-07-11'),
('Tobey','Maguire','M','1975-06-27'),
('Francis','McDormand','F','1957-06-23'),
('Malcolm','McDowell','M','1943-06-13'),
('Alfred','Molina','M','1953-05-24'),
('Cathy','Moriarty','F','1960-11-29'),
('Ulrich','Muhe','M','1953-06-20'),
('Carey','Mulligan','F','1985-05-28'),
('Bill','Murray','M','1950-09-21'),
('Mari','Natsuki','F','1952-05-02'),
('Jack','Nicholson','M','1937-04-22'),
('Connie','Nielsen','F','1965-07-03'),
('Ika','Nord','F','1960-04-29'),
('Chuck','Norris','M','1940-03-10'),
('Edward','Norton','M','1969-08-18'),
('Gary','Oldman','M','1958-03-21'),
('Yasmin','Paige','F','1991-06-24'),
('Michael','Palin','M','1943-05-05'),
('Rebecca','Pan','F','1931-12-29'),
('Joe','Pesci','M','1943-02-09'),
('Joaquin','Phoenix','M','1974-10-28'),
('Natilie','Portman','F','1981-06-09'),
('Per','Ragnar','M','1941-05-29'),
('Oliver','Reed','M','1938-02-13'),
('Jean','Reno','M','1948-07-30'),
('Tony','Revolori','M','1996-04-28'),
('Craig','Roberts','M','1991-01-21'),
('Sam','Rockwell','M','1968-11-05'),
('Alexandre','Rodrigues','M','1983-05-21'),
('Saoirse','Ronan','F','1994-04-12'),
('Roy','Scheider','M','1932-11-10'),
('Jason','Schwartzmann','M','1980-06-26'),
('Suraj','Sharma','M','1993-03-21'),
('Martin','Sheen','M','1940-08-03'),
('Douglas','Silva','M','1988-09-27'),
('Dandan','Song','F','1961-08-25'),
('Rafe','Spall','M','1983-03-10'),
('Tilda','Swinton','F','1960-11-05'),
('George','Tokoro','M','1955-01-26'),
('Noah','Taylor','M','1969-09-04'),
('Uma','Thurman','F','1970-04-29'),
('John','Travolta','M','1954-02-18'),
('Chris','Tucker','M','1971-08-31'),
('Dick','Van Dyke','M','1925-12-13'),
('Hugo','Weaving','M','1960-04-04'),
('Olivia','Williams','F','1968-07-26'),
('Mykelti','Williamson','M','1957-03-04'),
('Bruce','Willis','M','1955-03-19'),
('Luke','Wilson','M','1971-09-21'),
('Owen','Wilson','M','1968-11-18'),
('Patrick','Wilson','M','1973-07-03'),
('Kate','Winslet','F','1975-10-05'),
('Faye','Wong','F','1969-08-08'),
('Robin','Wright','F','1966-04-08'),
('Michelle','Yeoh','F','1962-08-06'),
('Ji-tae','Yoo','M','1976-04-13'),
('Jin-seo','Yoon','F','1983-08-05'),
('Sean','Young','F','1959-11-20'),
('Billy','Zane','M','1966-02-24'),
('Ziyi','Zhang','F','1979-02-09');

```


```sql
-- ---------------------------------------------------
--  Records of 'movies' database > table : movies
-- ---------------------------------------------------
INSERT INTO movies (movie_name,movie_length,movie_lang,release_date,age_certificate,director_id) VALUES
('A Clockwork Orange','112','English','1972-02-02','18','13'),
('Apocalypse Now','168','English','1979-08-15','15','9'),
('Battle Royale ','111','Japanese','2001-01-04','18','10'),
('Blade Runner ','121','English','1982-06-25','15','27'),
('Chungking Express','113','Chinese','1996-08-03','15','35'),
('City of God','145','Portuguese','2003-01-17','18','20'),
('City of Men','140','Portuguese','2008-02-29','15','22'),
('Cold Fish','108','Japanese','2010-09-12','18','30'),
('Crouching Tiger Hidden Dragon','139','Chinese','2000-07-06','12','15'),
('Eyes Wide Shut','130','English','1999-07-16','18','13'),
('Forrest Gump','119','English','1994-07-06','PG','36'),
('Gladiator','165','English','2000-05-05','15','27'),
('Gone with the Wind','123','English','1939-12-15','PG','8'),
('Goodfellas','148','English','1990-09-19','15','26'),
('Grand Budapest Hotel','117','English','2014-07-03','PG','3'),
('House of Flying Daggers','134','Chinese','2004-03-12','12','37'),
('In the Mood for Love','124','Chinese','2001-02-02','12','35'),
('Jaws','134','English','1975-06-20','12','31'),
('Leon','123','English','1994-11-18','15','5'),
('Let the Right One In','128','Swedish','2008-10-24','15','1'),
('Life of Brian','126','English','1979-08-17','15','12'),
('Life of Pi','129','English','2012-11-21','PG','15'),
('Mary Poppins','87','English','1964-08-29','U','32'),
('Never Let Me Go','117','English','2010-09-15','15','25'),
('Oldboy','130','Korean','2005-03-25','18','23'),
('Pans Labyrinth','98','Spanish','2006-12-29','PG','7'),
('Ponyo','107','Japanese','2009-08-14','U','21'),
('Pulp Fiction','136','English','1994-10-14','15','33'),
('Raging Bull','132','English','1980-11-14','18','26'),
('Rushmore','104','English','1998-11-12','12','3'),
('Spider-Man','118','English','2002-05-03','PG','24'),
('Spider-Man 2','115','English','2004-06-30','PG','24'),
('Spider-Man 3','112','English','2007-05-04','PG','24'),
('Spirited Away','120','Japanese','2001-06-19','U','21'),
('Star Wars: A New Hope','123','English','1977-05-25','PG','17'),
('Star Wars: Empire Strikes Back','150','English','1980-05-21','PG','17'),
('Star Wars: Return of the Jedi','139','English','1983-05-25','PG','17'),
('Submarine','115','English','2011-06-03','15','4'),
('Taxi Driver','117','English','1976-02-7','15','26'),
('The Darjeeling Limited','119','English','2007-09-29','PG','3'),
('The Fifth Element','149','English','1997-05-09','12','5'),
('The Lives of Others','165','German','2007-02-09','15','11'),
('The Shining','126','English','1980-05-23','18','13'),
('The Sound of Music','91','English','1965-03-02','U','34'),
('The Wizard of Oz','120','English','1939-08-25','U','8'),
('There Will Be Blood','168','English','2007-12-26','15','2'),
('Three Billboards Outside Ebbing, Missouri ','134','English','2017-11-10','15','18'),
('Titanic','143','English','1997-12-19','12','6'),
('Top Gun','121','English','1986-05-16','12','28'),
('Toy Story','95','English','1995-11-22','U','14'),
('V for Vendetta','140','English','2006-03-17','12','19'),
('Watchmen','138','English','2009-03-06','12','29'),
('Way of the Dragon ','99','Chinese','1972-06-01','12','16');

```
```sql
-- ---------------------------------------------------------
--  Records of 'movies' database > table : movies_revenues
-- ---------------------------------------------------------
INSERT INTO movies_revenues (revenue_id,movie_id,revenues_domestic,revenues_international) VALUES
('1','45','22.2','1.3'),
('2','13','199.4','201.2'),
('3','23','102.1',NULL),
('4','44','158.7',NULL),
('6','1','27.1',NULL),
('7','53',NULL,NULL),
('17','18','260.3','210.9'),
('9','39','28.1',NULL),
('5','35','461.2','314.2'),
('13','2','83.4',NULL),
('15','21','19.6',NULL),
('8','36','290.3','247.8'),
('11','43','44.1',NULL),
('12','29','23.1',NULL),
('14','4','33.3',NULL),
('10','37','309.1','166.2'),
('16','49','180.1','177.3'),
('18','14','46.6',NULL),
('21','11','330.3','348.1'),
('20','28','107.9','106.2'),
('19','19',NULL,NULL),
('23','50','192.1','182.4'),
('22','5',NULL,NULL),
('27','41','64.1','200.3'),
('24','48','659.2','1528.1'),
('25','30','16.9',NULL),
('26','10','55.7','106.3'),
('30','12','188.2','273.4'),
('28','9','128.1','85.1'),
('29','3',NULL,NULL),
('32','17','2.9','10.2'),
('31','34','11.1','265.4'),
('33','31','404.1','418.1'),
('37','6','8.2','23.5'),
('35','16','11.1','82.5'),
('36','32','374.1','410.4'),
('34','25','1.1','13.8'),
('38','51','71.2','62.5'),
('40','26','37.8','46.4'),
('48','42','11.3','66.1'),
('39','33','337','554'),
('51','40','11.9','23.2'),
('41','46','39.9','35.8'),
('42','7','0.3','2.2'),
('49','20','2.1','9.1'),
('45','52','107.5','77.5'),
('44','27','15.1','186.7'),
('47','8',NULL,NULL),
('46','24','2.4','7.1'),
('43','38','0.5','0.4'),
('50','22','124.9','484.1'),
('52','15','59.3','115.5'),
('53','47','54.5','104.7');

```
```sql
-- ---------------------------------------------------------
--  Records of 'movies' database > table : movies_actors
-- ---------------------------------------------------------
INSERT INTO movies_actors (movie_id,actor_id) VALUES
('1','52'),
('2','50'),
('3','23'),
('4','26'),
('5','14'),
('6','6'),
('7','2'),
('8','15'),
('8','40'),
('9','20'),
('10','38'),
('11','9'),
('12','21'),
('13','9'),
('14','17'),
('15','25'),
('16','9'),
('17','21'),
('18','38'),
('19','47'),
('20','30'),
('21','43'),
('22','12'),
('23','10'),
('23','49'),
('24','7'),
('25','15'),
('25','31'),
('25','32'),
('25','33'),
('26','46'),
('27','46'),
('28','14'),
('28','29'),
('28','39'),
('29','8'),
('30','48'),
('31','47'),
('32','27'),
('33','31'),
('33','32'),
('33','33'),
('34','43'),
('35','15'),
('36','6'),
('37','35'),
('37','36'),
('37','37'),
('38','2'),
('38','4'),
('38','35'),
('38','36'),
('38','37'),
('39','39'),
('40','31'),
('40','32'),
('40','33'),
('41','46'),
('42','3'),
('43','8'),
('44','13'),
('45','30'),
('46','9'),
('47','24'),
('48','45'),
('49','42'),
('50','15'),
('51','52'),
('52','35'),
('53','52');

```
</details>

---

## 👫 Counting results via COUNT function

<details>
<summary>🧱 Counting results via <b>COUNT</b> function</summary>

- open file `session-15-aggregate-count.sql`

<br>

```sql
--!statement: count results using COUNT from movies table
--**: Working on : COUNT, WHERE
########
-- SELECT COUNT (*) FROM tableName
-- SELECT COUNT(column_name) from tablename

--todo: 1. count all records
-- count total number of movies

-- SELECT * FROM movies;
SELECT COUNT(movie_name) from movies;

--todO:2. count all records of a specific column

-- SELECT  from movies; output: 53
SELECT 
    movie_length as movLength
from movies;


SELECT 
    COUNT (movie_length)
FROM movies ;


--todO:3. using COUNT with distinct/unique movie language
-- test without distinct: ans : 53

-- SELECT * FROM movies;
SELECT movie_lang FROM movies;
SELECT 
   COUNT(movie_lang)
FROM movies;

-- count using distinct : ans: 8
SELECT 
    COUNT(DISTINCT(movie_lang))
FROM movies;

--todo: 4 Count all distinct movie directors

SELECT * FROM movies;
SELECT 
    director_id
 FROM movies;

SELECT 
COUNT(DISTINCT(director_id))
FROM directors;


--todo: 5. count all english movies
-- Where claues
-- where clause run before grouping

select * from movies
ORDER BY movie_lang ASC;

SELECT
    COUNT(*)
FROM movies
WHERE 
    movie_lang='Japanese';

```
</details>


## 👍 Notes:

### 💯 COUNT(*) vs COUNT(1)
- Take a field nullable if its name matches the table name. Say you have values 'Banana', 'Apple', NULL, 'Pears' on fruit field. This will not count all rows, it will only yield 3, not 4



-- SELECT count(fruit) FROM fruit



-- count(1): The one-trick pony

-- =======================

-- In particular to COUNT(1), it is a one-trick pony, it works well only on one table query:



-- SELECT COUNT(1) FROM tbl

-- But when you use joins, that trick won't work on multi-table queries without its semantics being confused, and in particular you cannot write:



-- -- count the subordinates that belongs to boss

-- SELECT boss.boss_id, COUNT(subordinate.1)

-- FROM boss

-- LEFT JOIN subordinate on subordinate.boss_id = boss.boss_id

-- GROUP BY boss.id



-- Summary

-- ========

-- COUNT(*) counts the number of rows

-- COUNT(1) also counts the number of rows

###	GREATEST vs. MAX()
At first glance, the `MySQL MAX() and GREATEST()` functions perform a similar operation. They both return the maximum value from a range of values. However, there’s a difference between these two functions.


The best way to see the difference between these two functions is to compare their syntax.



`Syntax`

The syntax for each function goes like this:


- **MAX([DISTINCT] expr) [over_clause]**

- **GREATEST(value1,value2,...)**


So already, they look completely different. The MAX() function accepts the DISTINCT keyword as well as an OVER clause (and the GREATEST() function doesn’t).



However, the key difference between these two functions is in the accepted argument/s. Specifically:



- **MAX() accepts one argument**

- **GREATEST() accepts multiple arguments**


So MAX() is typically used to return the maximum value in a column in a database. The table could contain many rows, but this function returns the one with the maximum value.



GREATEST() on the other hand, returns the maximum-valued argument from the list of arguments passed to it. So you could pass say, 3 arguments to this function and it will return the one with the largest value.


MAX() Function
=============

SELECT MAX(Population) AS 'Result'

FROM City;



+----------+

| Result   |

+----------+

| 10500000 |

+----------+



GREATEST() function

=====================

The GREATEST  function returns the “greatest” or “largest” value from the list of expressions.



GREATEST ( value_1, [value_n] )



SELECT GREATEST(1, 5, 9) AS 'Result';



+--------+

| Result |

+--------+

|      9 |

+--------+



If you try to pass a single argument to the GREATEST() function you’ll get an error.