-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module6;
USE module6;


-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM courses.courses;
CREATE TABLE teachers SELECT * FROM courses.teachers;
CREATE TABLE schedule SELECT * FROM courses.schedule;
CREATE TABLE department SELECT * FROM courses.department;

-- Создание процедуры
DELIMITER |
DROP PROCEDURE IF EXISTS sp_sample_1 |
CREATE PROCEDURE sp_sample_1()
BEGIN
	SELECT 'Список предодавателей' AS ' ';
	SELECT name FROM teachers ORDER BY name;
END;
|
DELIMITER ;

-- Вызов процедуры
CALL sp_sample_1();


-- Процедуры с параметрами
DELIMITER |
DROP PROCEDURE IF EXISTS sp_course_by_date |

CREATE PROCEDURE sp_course_by_date (IN idteacher INT, IN date_course DATE)
BEGIN
	SELECT courses.idcourses, courses.title
		FROM courses
			INNER JOIN schedule ON idcourses = courses_idcourses
		WHERE schedule.date_course = date_course
		  AND teachers_idteachers = idteacher;
END;
|

DELIMITER ;

-- Вызов процедуры
CALL sp_course_by_date (2, '2012-01-05');
CALL sp_course_by_date (2, '2012-02-25');



-- Какие занятия были в указанный месяц и год
DELIMITER |
DROP PROCEDURE IF EXISTS sp_course_by_dates |

CREATE PROCEDURE sp_course_by_dates 
	(IN date_start DATE, IN date_end DATE, OUT record_count INT)
BEGIN
	-- Создадим временную таблицу с результатами запроса
	CREATE TEMPORARY TABLE course_by_dates_results
		SELECT courses.idcourses, courses.title
			FROM courses
				INNER JOIN schedule ON courses.idcourses = courses_idcourses
			WHERE schedule.date_course BETWEEN date_start AND date_end;
	-- Посчитаем сколько в ней записей в переменную
	SELECT COUNT(*) INTO record_count 
		FROM course_by_dates_results;
	-- Вернем результат
	SELECT * 
		FROM course_by_dates_results;	
	-- Удалим временную таблицу
	DROP TEMPORARY TABLE course_by_dates_results;
END;
|

DELIMITER ;

-- Вызов процедуры
CALL sp_course_by_dates ('2012-01-01', '2012-06-01', @count);
SELECT @count;

-- Коды ошибок
-- http://dev.mysql.com/doc/refman/5.1/en/error-messages-server.html



-- Какие занятия были в указанный месяц и год
DELIMITER |
DROP PROCEDURE IF EXISTS sp_course_by_dates |

CREATE PROCEDURE sp_course_by_dates 
	(IN date_start DATE, IN date_end DATE, OUT record_count INT)
BEGIN
	-- Создадим временную таблицу с результатами запроса
	CREATE TEMPORARY TABLE course_by_dates_results
		SELECT courses.idcourses, courses.title
			FROM courses
				INNER JOIN schedule ON courses.idcourses = courses_idcourses
			WHERE schedule.date_course BETWEEN date_start AND date_end;
			
	-- Посчитаем сколько в ней записей в переменную
	SELECT COUNT(*) INTO record_count 
		FROM course_by_dates_results;
	
	-- Проверим, сколько записей удалось выбрать
	IF record_count = 0 THEN
		-- Данных нет. Вернем предупреждающую таблицу
		SELECT NULL AS id, 'Данных нет' AS title;
	ELSE
		-- Вернем результат
		SELECT * 
			FROM course_by_dates_results;	
	END IF;
	
	-- Удалим временную таблицу
	DROP TEMPORARY TABLE course_by_dates_results;	
END;
|

DELIMITER ;

-- Вызов процедуры
CALL sp_course_by_dates ('2013-01-15', '2013-02-25', @count);
SELECT @count;

-- Вызов процедуры
CALL sp_course_by_dates ('2011-10-01', '2012-02-10', @count);
SELECT @count;

