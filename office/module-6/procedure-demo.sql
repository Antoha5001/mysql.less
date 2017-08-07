-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module6;
USE module6;

-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM courses.courses;
CREATE TABLE teachers SELECT * FROM courses.teachers;
CREATE TABLE schedule SELECT * FROM courses.schedule;
CREATE TABLE department SELECT * FROM courses.department;

-- Процедура возвращает число записей в указанной таблице
DELIMITER |
DROP PROCEDURE IF EXISTS sp_table_records |
CREATE PROCEDURE sp_table_records (IN my_table VARCHAR(50))
BEGIN
	SELECT table_rows
		FROM information_schema.tables
		WHERE table_name = my_table
		  AND table_schema = 'module6';
END;
|
DELIMITER ;


DELIMITER |
DROP PROCEDURE IF EXISTS sp_table_records |
CREATE PROCEDURE sp_table_records (IN my_table VARCHAR(50))
BEGIN
	SELECT table_rows 
		FROM information_schema.tables
		WHERE table_name = my_table
		  AND table_schema = 'module6';
END;
|
DELIMITER ;


-- Вызов процедуры
SET @courses='courses';
CALL sp_table_records(@courses);


-- Создание функции
DELIMITER |
DROP FUNCTION IF EXISTS sf_table_records |
CREATE FUNCTION sf_table_records (my_table CHAR(20)) RETURNS INTEGER
BEGIN	

		SELECT table_rows INTO @c
		FROM information_schema.tables
		WHERE table_name = my_table
		  AND table_schema = 'module6';	  
	RETURN @c;
END|
DELIMITER ;


-- Вызов функции
SET @courses='courses';
SELECT sf_table_records(@courses) ;



-- Создание функции экспортирующей записи в виде ссылок
DELIMITER |
DROP FUNCTION IF EXISTS sf_link |
CREATE FUNCTION sf_link (text VARCHAR(50),href VARCHAR(50)) RETURNS VARCHAR(50)
BEGIN	
    
  
	RETURN CONCAT('<a href="',href,'">',text,'</a>');
END|
DELIMITER ;


-- Вызов функции
SET @courses='courses';
SELECT sf_link(@courses,@courses) ;









-- Процедура возвращает список таблиц и число записей в указанной БД
DELIMITER |
DROP PROCEDURE IF EXISTS sp_table_records_2 |
CREATE PROCEDURE sp_table_records_2 (IN dbName VARCHAR(50),OUT myout VARCHAR(10))
BEGIN
	SELECT table_name, table_rows
		FROM information_schema.tables
		WHERE table_schema = dbName;
	SELECT 'Привет' INTO myout;

END;
|
DELIMITER ;


-- Вызов процедуры
SET @myout='';
CALL sp_table_records_2('module6',@myout);

CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!');




