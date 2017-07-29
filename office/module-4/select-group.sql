-- Создание базы данных
USE module4;

-- Сколько часов в расписании того или иного преподавателя
SELECT name, SUM(hours)
	FROM schedule, courses, teachers
	WHERE idcourses = courses_idcourses AND
		  teachers_idteachers = idteachers
	GROUP BY name;

SELECT name, title, SUM(hours)
	FROM schedule, courses, teachers
	WHERE idcourses = courses_idcourses AND
		  teachers_idteachers = idteachers
	GROUP BY name, title;
	

-- Замена DISTINCT
SELECT DISTINCT courses_idcourses
	FROM schedule;

SELECT courses_idcourses
	FROM schedule
	GROUP BY courses_idcourses;


SELECT name, SUBSTRING(title, 1, 15), SUM(hours)
	FROM schedule, courses, teachers
	WHERE idcourses = courses_idcourses AND
		  teachers_idteachers = idteachers
	GROUP BY name, title WITH ROLLUP;
	

-- варианты работы с датами
SELECT YEAR(lesson_date), MONTH(lesson_date), SUM(length)
	FROM schedule
	GROUP BY YEAR(lesson_date), MONTH(lesson_date);	 


SELECT YEAR(lesson_date), MONTH(lesson_date), SUM(length)
	FROM schedule 
	WHERE teacher IN (1,3,5)
	GROUP BY YEAR(lesson_date), MONTH(lesson_date);	 	

SELECT YEAR(lesson_date), MONTH(lesson_date), SUM(length)
	FROM schedule
	WHERE teachers_idteachers IN (1,3,5)
	GROUP BY YEAR(lesson_date), MONTH(lesson_date) WITH ROLLUP;	
	
SELECT YEAR(lesson_date), MONTH(lesson_date), SUM(length)
	FROM schedule
	WHERE teachers_idteachers IN (1,3,5)
	GROUP BY YEAR(lesson_date), MONTH(lesson_date) 
	HAVING SUM(length) > 30;		
	
	
	SELECT name, SUBSTRING(title, 1, 15), SUM(hours)
	FROM schedule, courses, teachers
	WHERE idcourses = courses_idcourses AND
		  teachers_idteachers = idteachers
	GROUP BY name, title WITH ROLLUP
	HAVING title IS NULL;

-- WHERE
-- GROUP
-- HAVING
-- ORDER
-- LIMIT
	
	
	
	
	