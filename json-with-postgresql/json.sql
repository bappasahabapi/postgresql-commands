-- 1.Create a table called books
create table books(
	books_id serial primary key,
	book_info JSONB
);

select * from books;

-- 2. Insert some json data

-- insert single data
insert into books(book_info)
values
('{
 	"title":"book title1",
 	"author":"author1"
 
 }');
 
 -- insert multiple data
 
 insert into books(book_info)
values
('{
 	"title":"book title2",
 	"author":"author2"
 
 }'),
 ('{
 	"title":"book title3",
 	"author":"author3"
 
 }'),
 ('{
 	"title":"book title4",
 	"author":"author4"
 
 }');
 
--  3.1 Lets use selectors (->, ->>)
--  The opetator(->) returns the json field as a field in quotes
 
select book_info from books;

select book_info -> 'title'from books;
 
 --  The opetator(->>) returns the json field as a field as text;
 
 select book_info ->> 'title'from books;
 
select book_info ->>'title',book_info ->'author'from books; 
 
select 
	book_info ->>'title' as title,
	book_info ->'author' as author
from books; 
 
 
-- 4. select and filter records
select 
	book_info ->>'title' as title,
	book_info ->'author' as author
from books
where book_info->>'author'='author1';
 