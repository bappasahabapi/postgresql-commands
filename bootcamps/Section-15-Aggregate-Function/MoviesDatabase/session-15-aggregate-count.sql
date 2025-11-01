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