-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module4;
USE module4;

-- Вывод значения
SELECT 2 + 2;	
	
-- Вывод значения
SELECT 2 + 2 AS result;		
	
-- Переменные
SET @a = 'Привет мир!';
SELECT @a;	
SELECT version();	

SELECT user INTO @user 
	FROM mysql.user;

SELECT @user;

-- Копия таблиц для демонстрации
CREATE TABLE schedule SELECT * FROM courses.schedule;
CREATE TABLE teachers SELECT * FROM courses.teachers;
CREATE TABLE department SELECT * FROM courses.department;
CREATE TABLE courses SELECT * FROM courses.courses;

SELECT name AS Преподаватель, address AS Адрес
	FROM teachers;

SELECT *
	FROM teachers;
	

SELECT name, address
	FROM teachers
	ORDER BY name;	
	
SELECT name, address
	FROM teachers
	ORDER BY RAND();	
	
SELECT name, address
	FROM teachers
	ORDER BY RAND()
	LIMIT 1;
	
	
SELECT name, address
	FROM teachers
	ORDER BY name ASC;
	
SELECT name, address
	FROM teachers
	ORDER BY name DESC;	


	
SELECT name, address
	FROM teachers
	ORDER BY 1;		
	
SELECT name, address
	FROM teachers
	ORDER BY name
	LIMIT 2;	
	
SELECT name, address
	FROM teachers
	ORDER BY name
	LIMIT 2,3;	
	
	