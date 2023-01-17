-





--TODO: 1. Combine movies and directors table

select * from movies
order by director_id;

select * from directors;


--FIXME: 	directors.director_id =movie.director_id
--- joins table in normal way

select
	movies.movie_id,
	movies.movie_name,
	movies.director_id,
	
	directors.first_name
	
from movies
inner join directors
on movies.director_id =directors.director_id

---TODO: 2. joins with an alias way
select
	m.movie_id,
	m.movie_name,
	
	d.first_name
	
from movies m
inner join directors d
on m.director_id =d.director_id

---TODO: 3. Filter some records
select
	m.movie_id,
	m.movie_name,
	m.director_id,
	m.movie_lang,
	
	d.first_name
	
from movies m
inner join directors d
on m.director_id =d.director_id
where m.movie_lang='English'

---FIXME: ########################
select
	m.movie_id,
	m.movie_name,
	m.director_id,
	m.movie_lang,
	
	d.first_name
	
from movies m
inner join directors d
on m.director_id =d.director_id
where m.movie_lang='English'
and d.director_id =3

---TODO: 4. Using tablename.* or table_alias.* instead of individul column name
select
	m.*,
	
	d.*
	
from movies m
inner join directors d
on m.director_id =d.director_id


--TODO: 5.' USING' keyword when we have common column
select *
from movies
inner join directors using(director_id)


--FIXME: ######## connect more than two column
-- connect 'movies','directors' and 'movies-revenues' table
-- find out the common column 

-- movies-> directors ; movies.director_id = directors.director_id
-- movies-> movies_revenues; movies.movie_id =movies_revenues.movie_id

select *
from movies
inner join directors using (director_id)
inner join movies_revenues using (movie_id)




---TODO: 6. -------------------------->    Inner join filter data  <-------------------------------------------

--FIXME: select movie name, director name, domestic revenues for all japanese movies
select 
*
from movies m
inner join directors d on m.director_id =d.director_id
inner join movies_revenues mr on m.movie_id =mr.movie_id
where 
	m.movie_lang ='Japanese'

--FIXME: final query 
select 
	m.movie_name,
	
	d.first_name,
	d.last_name,
	
	mr.revenues_domestic
from movies m
inner join directors d on m.director_id =d.director_id
inner join movies_revenues mr on m.movie_id =mr.movie_id
where 
	m.movie_lang ='Japanese'

--FIXME: select movie name ,director name, for all English Chinese and Japaneses movies where domestic revenues is greater then 100

select 
*
from movies m
inner join directors d on m.director_id =d.director_id
inner join movies_revenues mr on m.movie_id =mr.movie_id
where
	m.movie_lang in ('English','Chinese','Japanese')
	AND mr.revenues_domestic > 400

--FIXME:
select 
	m.movie_name,
	
	d.first_name,
	d.last_name,
	
	mr.revenues_domestic
	
from movies m
inner join directors d on m.director_id =d.director_id
inner join movies_revenues mr on m.movie_id =mr.movie_id
where
	m.movie_lang in ('English','Chinese','Japanese')
	AND mr.revenues_domestic > 300
order by 4 desc



-- TODO: SELECT movie name, director name, movie language,total revenues for all top 5 movies
-- Calculation part is here:

select
	m.movie_name,
	
	d.first_name,
	d.last_name,
	
	mr.revenues_domestic,
	mr.revenues_international,
	
	(mr.revenues_domestic + mr.revenues_international)as "Total Revenues"
	
from movies m
inner join directors d on m.director_id =d.director_id
inner join movies_revenues mr on m.movie_id =mr.movie_id
order by 6 desc nulls last
limit 5

--- TODO: What were the top 10 most pofitable movies between year 2005 and 2008 
--Print the  movie name, director name, movie language, total revenues, for the three tables.

select
	m.movie_name,
	m.movie_lang,
	m.release_date,
	
	d.first_name,
	d.last_name,
	
	mr.revenues_domestic,
	mr.revenues_international,
	
	(mr.revenues_domestic + mr.revenues_international)as "Total Revenues"
	
from movies m
inner join directors d on m.director_id =d.director_id
inner join movies_revenues mr on m.movie_id =mr.movie_id
where
	m.release_date between '2005-01-01' and '2008-12-31'
order by 7 desc nulls last
limit 10


-- TODO: 7. inner join tables with different columns data types

create table t1(test int);

create table t2 (test varchar(10));

-- this is not working
select 
*
from t1
inner join t2 on t1.test =t2.test

-- to solve the problem use cast

select 
*
from t1
inner join t2 on t1.test =cast(t2.test as int)

