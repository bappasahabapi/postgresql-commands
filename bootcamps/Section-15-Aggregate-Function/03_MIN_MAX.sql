-- MIN MAX FUNCTION

###########################
-- SELECT MIN(column_name) from table_name;
-- SELECT MAX(column_name) from table_name;

--todo: 1. what is the longest movie in movie table --> ans: 168

-- SELECT * FROM movies;
-- SELECT movie_length FROM movies;
-- SELECT movie_length  FROM movies as m
-- ORDER BY m.movie_length DESC;

SELECT MAX(movie_length) FROM movies;

--todo: 2. what is the shortes movie in movie table --> ans: 87

SELECT MIN(movie_length) FROM movies;


--todo: 3. What is the longest movie in movies table within all english based language


-- SELECT * FROM movies;
-- SELECT 
--     movie_name
-- FROM movies
-- WHERE 
--     movie_lang ='English';
-- SELECT 
--     movie_name,
--     movie_length
-- FROM movies
-- WHERE 
--     movie_lang ='English'
-- ORDER BY movie_length DESC;
SELECT 
    MAX(movie_length)
FROM movies
WHERE 
    movie_lang ='English'
-- ORDER BY movie_length DESC;

--!fix Group this is used after filtering
SELECT 
    movie_name,
    MAX(movie_length) AS max_length
FROM movies
WHERE movie_lang = 'English'
GROUP BY movie_name; 

--!fix: Find the movie with the maximum length
SELECT 
    movie_name,
    movie_length
FROM movies
WHERE movie_lang = 'English'
ORDER BY movie_length DESC
LIMIT 1;

--!fix: ✅ Fix Option 3: Use a subquery for clarity

SELECT
    movie_name,
    movie_length
FROM
    movies
    WHERE movie_length =(
        SELECT MAX(movie_length)
        FROM movies
        WHERE movie_lang='English'
    )
AND movie_lang='English';


--todo: 4 What is the latest relase movie in en-languale

SELECT * FROM movies;
-- SELECT 
--     release_date,
--     movie_name
-- FROM movies
-- WHERE
--     movie_lang ='English'
-- ORDER BY release_date DESC
-- LIMIT 1;
SELECT 
    MAX(release_date)
FROM movies
WHERE
    movie_lang ='English'

--todo: 5 What is the first movie in chines-languale

-- SELECT * FROM movies;

SELECT 
    -- movie_name,
    -- movie_lang,
    MIN(release_date)
FROM movies
WHERE movie_lang ='Chinese'

