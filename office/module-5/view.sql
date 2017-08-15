-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module5;
USE module5;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM courses.courses;
CREATE TABLE teachers SELECT * FROM courses.teachers;
CREATE TABLE schedule SELECT * FROM courses.schedule;
CREATE TABLE department SELECT * FROM courses.department;

-- Какие курсы читались текущем месяце (пример, в январе 2012)
SELECT DISTINCT title 
	FROM courses INNER JOIN schedule ON idcourses = courses_idcourses
	WHERE MONTH(date_course) = 1
	  AND YEAR(date_course) = 2012

	  
DROP VIEW IF EXISTS currCourses;
CREATE VIEW currCourses AS
	SELECT DISTINCT title
		FROM courses INNER JOIN schedule ON idcourses = courses_idcourses
		WHERE MONTH(date_course) = 1
		AND YEAR(date_course) = 2012
\g


DROP TABLE IF EXISTS product;
CREATE TABLE product
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	title VARCHAR(70) NOT NULL DEFAULT '',
	price FLOAT NOT NULL DEFAULT 0,
	quo FLOAT NOT NULL DEFAULT 0,
	PRIMARY KEY (id)
);


INSERT INTO product 
	VALUES
		(1, 'Товар 1', 123, 200),
		(2, 'Товар 2', 150, 200),
		(3, 'Товар 3', 187, 300),
		(4, 'Товар 4', 300, 400),
		(5, 'Товар 5', 225, 500);
		
INSERT INTO product 
	VALUES
		(6, 'Товар 6', 1000, 200);

-- Продукты с налогами, причем только те, которые есть на складе
DROP VIEW IF EXISTS product_with_tax;
CREATE 
	DEFINER='root'@'localhost'
	SQL SECURITY DEFINER
	VIEW product_with_tax AS
		SELECT *, price * 1.18 AS price_tax
			FROM product
			WHERE quo > 0;


SELECT * FROM product_with_tax;

DELETE FROM product_with_tax WHERE id = 5;
