create database human_resource_project;

select*from hr;

--cleaning data

--describe the dataset

select*from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='hr';

select birthdate from hr;

--formating birthday in a proper query (yyyy,mm,dd) format 
alter table hr
alter column birthdate date;

SELECT FORMAT(birthdate, 'yyyy-MM-dd') AS FormattedBirthday
FROM hr;

--formating hire_date in a proper query (yyyy,mm,dd) format 

alter table hr
alter column hire_date date;

select FORMAT(hire_date,'yyyy-MM-dd') as hire_date
from hr;

--we have to add one new column named (age) and we have to find out the age of the employee

alter table hr
add age int ;

select *,
DATEDIFF(YEAR,birthdate,GETDATE()) as age_gap
into hr_v1
from hr;

select*from hr_v1;


--Questions
--What is the gender breakdown of employees in the company?

select gender,COUNT(*) as count
from hr_v1
group by gender;

--What is the race/ethnicity breakdown of employees in the company?

select*from hr_v1;

select race,
COUNT(*) as race_count
from hr_v1
group by race;

--What is the age distribution of employees in the company?

select 
MIN(age_gap) as min_age,
MAX(age_gap) as max_age
from hr_v1;

--How many employees work at headquarters versus remote locations?
select*from hr_v1;

select location,COUNT(*) as count_location
from hr_v1
group by location;

--How does the gender distribution vary across departments and job titles?

select gender,department,count(*) as count_distribution
from hr_v1
group by gender,department;

--What is the distribution of job titles across the company?
select jobtitle,
COUNT(*) as count_jobtitles
from hr_v1
group by jobtitle;

--Which department has the highest turnover rate?

select*from hr_v1;

--What is the distribution of employees across locations by state?

select location,COUNT(*) as count_location 
from hr_v1
group by location;


--Get the details of the employee where age greater than 35 and location_state is Ohio

select id,first_name,last_name
from hr_v1
where age_gap >35 and location_state ='Ohio';

--get the deparment which is highest employees are present 

select id,
MAX(department) as max_department,
COUNT(department) as count_department
from hr_v1
group by id,department;


  