
-- select column_name from table_name;
SELECT * FROM movies;

-- Sum with SUM function
-- SELECT SUM(column_name) FROM table_name 

-- ################################################

--todo:1 Lets look at all movies revenues records;

-- SELECT * from movies_revenues;

--todo 2: Get total domestic revenues for all movies

-- SELECT 
--     revenues_domestic
-- FROM movies_revenues;

SELECT 
    SUM(revenues_domestic) 
FROM movies_revenues;

--todo 3: Get total domestic revenues for all movies where domestic revenue is greater than 200

-- first try to find all the revenus [select revenues_domestic from movies_revenues]
-- second apply the condition

SELECT 
    revenues_domestic
FROM movies_revenues
WHERE 
    revenues_domestic > 200;


--todo 4: Find the total movie length of all english language movies


--  SELECT * from movies;

-- SELECT 
--     movie_length
-- FROM movies
-- WHERE
--     movie_lang ='English';    
SELECT 
    SUM(movie_length)
FROM movies
WHERE
    movie_lang ='English';    

--todo 5: Can I Sum all the movies name

-- NO this is not working bcz numbers are allowed
-- SELECT * from movies;
-- SELECT movie_name from movies;


-- todo: 8. 
-- using sum WITHOUT DISTINCT
-- Get total domestic revenue for all movies

SELECT 
    SUM(revenues_domestic)
FROM movies_revenues;


-- Using sum without DISTINCT
SELECT 
    SUM(DISTINCT(revenues_domestic))
FROM movies_revenues;

-- Using sum without DISTINCT
-- distinct will ignore all null and duplicate values.

SELECT * FROM movies_revenues
ORDER BY revenues_domestic;