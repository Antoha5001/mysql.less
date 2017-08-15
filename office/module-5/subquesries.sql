-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module5;
USE module5;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM courses.courses;
CREATE TABLE teachers SELECT * FROM courses.teachers;
CREATE TABLE schedule SELECT * FROM courses.schedule;
CREATE TABLE department SELECT * FROM courses.department;

-- Какие курсы читались в комплексах Таганский и Бауманский
SELECT courses.title, date_course
	FROM courses 
		INNER JOIN schedule ON idcourses = courses_idcourses
		INNER JOIN department ON department_iddepartment = iddepartment
	WHERE name IN ('Таганский', 'Бауманский')
\g


-- В каких комплексах были занятия между 5-м и 25-м числами января
SELECT name
	FROM schedule INNER JOIN department ON department_iddepartment = iddepartment
	WHERE date_course BETWEEN '2012-01-05' AND '2012-02-25';
	
	
	

-- Вложенный запрос
SELECT DISTINCT courses.title, hours
	FROM courses 
		INNER JOIN schedule ON idcourses = courses.idcourses
	WHERE department_iddepartment IN 
	(
		-- В каких комплексах были занятия 
	SELECT iddepartment
		FROM  department INNER JOIN schedule  ON department_iddepartment = iddepartment
		WHERE date_course BETWEEN '2012-01-05' AND '2012-02-25'
	)
\g







-- Использование EXISTS
INSERT INTO schedule (idschedule, courses_idcourses, teachers_idteachers, department_iddepartment,date_course)
	VALUES (7, 2, 2, 1, '2012-02-25');

-- Выбрать все курсы, которые хотя не читались преподавателями
SELECT courses.title
	FROM courses
	WHERE NOT EXISTS 
	(
		SELECT * FROM schedule
			WHERE courses_idcourses = courses.idcourses
	)
\g	
	
-- Псевдонимы

-- Когда и где читался курс PHP
SELECT s.date_course, d.name 
	FROM courses as c INNER JOIN schedule AS s ON c.idcourses = s.courses_idcourses
					  INNER JOIN department AS d ON s.department_iddepartment = d.iddepartment
	WHERE c.title LIKE '%php%';
	
	

CREATE TABLE city SELECT * FROM world.city;
	
-- Пример тормозного запроса
SELECT COUNT(*) 
	FROM city c1 
	WHERE EXISTS (SELECT * FROM city c2 WHERE c1.name = c2.name)
\g	
-- Пример тормозного запроса
SELECT COUNT(*) 
	FROM city c1 INNER JOIN city c2 
	WHERE EXISTS  (SELECT * FROM city c2 WHERE c1.name = c2.name)
\g
	

	