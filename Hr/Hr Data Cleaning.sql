
Use hrs;


Select * from hr;


Alter table hr 
Change ï»¿id emp_id varchar(20) Null;


Select * from hr;


Describe hr;


Select birthdate from hr;


Set sql_safe_updates=0;


Update hr
Set birthdate=Case
	when birthdate like '%/%' Then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    when birthdate like '%-%' Then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    else null
End;


Alter table hr
Modify column birthdate Date;


Select birthdate from hr;


Update hr
Set hire_date=Case
	when hire_date like '%/%' Then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    when hire_date like '%-%' Then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    else null
End;


ALTER TABLE hr
MODIFY COLUMN hire_date DATE;


Select termdate from hr;


UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;


SELECT termdate from hr;


SET sql_mode = 'ALLOW_INVALID_DATES';


ALTER TABLE hr
MODIFY COLUMN termdate DATE;


Alter table hr Add Column age Int;


Update hr
Set age = timestampdiff(Year, birthdate, CURDATE());


Select birthdate,age from hr;


Select count(*) from hr Where age < 18;


Select termdate from hr;


Select min(age) as youngest,
	max(age) as oldest
    from hr;