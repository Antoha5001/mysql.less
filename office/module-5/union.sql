-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module5;
USE module5;


-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM courses.courses;
CREATE TABLE teachers SELECT * FROM courses.teachers;
CREATE TABLE schedule SELECT * FROM courses.schedule;
CREATE TABLE department SELECT * FROM courses.department;
-- --------------------------------------------------------------
(
	-- Какие курсы проводились 5 января
	SELECT SUBSTRING(title,1,20) AS `Курс`
		FROM courses, schedule
		WHERE  idcourses = courses_idcourses AND date_course = '2012-01-05'
)
UNION DISTINCT
(
	-- Произвольный запрос по шаблону
	SELECT "Реклама!!!"
)
UNION DISTINCT
(
	SELECT title FROM courses
		WHERE courses.title LIKE '%php%'
)
ORDER BY 1
\g	
----------------------------------------------------------------


