# sql-commands

<sql queries:
     
     
###	🗽Creating table:
     
	create table student
	(
		name varchar(100)
	);

     

###	🗽 renaming table :
     
	alter table student rename to students_details;

### 🗽delete table
	drop table students_details ;


### 🗽 Creating table 
	create table student_details
	(
		roll numeric,
		"name" varchar(20),
		gender varchar(10),
		"age" numeric,
		primary key(roll)
	);
     
### 🗽Insert data into the table
     
	insert into student_details (roll,"name",gender,"age")
	values (101,'messi','male',25);

### 🗽 Insert another data into the table
	insert into student_details (roll,"name",gender,"age")
	values (102,'mbappi','male',22);

### 🗽 Insert multiple data ata a time in the table
	insert into student_details (roll,"name",gender,"age")
	values 
	(103,'threebappi','male',22),
	(104,'fourbappi','female',24),
	(105,'fivebappi','male',26);


### 🔥 SELECT STATEMENT 

####	-- To find out colum name from student_details table
     
	select * from student_details;
	select name from student_details ;
	select distinct gender from student_details ;
	select distinct age from student_details ;
     
---
	select 5+2;

	select upper('This is uppper'); 
	select upper (name) from student_details;
  ---

### 🔥-- WHERE clause : 
####	--for finding data based on condition
     
	select name from student_details where gender ='female';
	select * from student_details;
	select concat ('name','is') from student_details;


--- update satement
     
	update student_details set age =10 where roll=101;

-- delete statement
-- delete from table_name where condition ;
     
	delete from student_details where roll 101;


-- ALTER statement: is used for column add/delete/rename;
     
	alter table student_details add column country varchar(20);

-- add multiple column to a table 
	alter table student_details 
	add salary numeric,
	add location varchar,
	add phone numeric;



--			Joining table ---
-- First table is: studetent_details [roll,name,gender,age,country,salary,location,phone]
-- Second table is: sudents_results[roll,reg,gpa,department]

	select * from student_details;
	select * from student_results;

	create table student_results
	(
		roll numeric,
		reg numeric,
		gpa numeric,
		department varchar,
		primary key(roll)
	);

	insert into student_results (roll,reg,gpa,department)
	values 
	(101,20152307,4.4,'science'),
	(102,20152308,3.4,'science'),
	(103,20152309,5.4,'science'),
	(104,20152303,7.4,'science');


	select * from student_details join student_results on student_details.roll =student_results.roll;

	SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
	FROM Orders
	INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

-- inner join 
     
	select student_details.roll , student_results.reg,student_details.gender ,student_results.department 
	from student_results 
	inner join student_details  on student_details.roll =student_results.roll ;

---left join
     
	select student_details.roll ,student_results.department,student_results.gpa  
	from student_results
	left join student_details  on student_results.roll = student_details; 

-- right join 
     
     
        
---------------------------------------------
### Example Data Table:
     
	ALTER TABLE public.example_data 
		ADD footbal_team varchar(100);
	
	
	
💡Create:
     
	create table example_data( 
		id serial,
		"name" varchar(100),
		email varchar(100),
		country varchar(100),
		acc_number varchar(100),
		branch int,
		apply_date varchar(100)
	);

💡Select:
     
	SELECT id, "name", email, country, acc_number, branch, apply_date
	FROM public.example_data;

💡Insert:
     
	INSERT INTO public.example_data
	("name", email, country, acc_number, branch, apply_date)
	VALUES('', '', '', '', 0, '');
     
💡Update:
     
	UPDATE public.example_data
	SET  "name"='bbb', email='up@date', country='updesh', acc_number='44', branch=7, apply_date='33-33-33' where id=6;
     
💡Delete:
     
	DELETE FROM public.example_data
	where id=6;
     
     
## Demo Data Table:


	create table demo_data( 
		id serial,
		"name" varchar(100),
		email varchar(100),
		acc_number varchar(100),
		branch int,
		apply_date varchar(100)
	);
     

	SELECT id, "name", email, country, acc_number, branch, apply_date
	FROM public.example_data;


	create table rm_branch (
		id serial,
		"name" varchar(64),
		created_on varchar(64),
		created_by varchar(64)

	);

	INSERT INTO public.rm_branch
	("name", created_on, created_by)
	VALUES('rm-three', '', '');


