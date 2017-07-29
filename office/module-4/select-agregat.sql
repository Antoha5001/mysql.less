-- Создание базы данных
USE module4;

-- Число часов проведенных по MySQL5.1
SELECT SUM(hours) 
	FROM schedule, courses WHERE courses_idcourses = idcourses AND idcourses = 3;

-- Проверка курса по MySQL 5.1
SELECT hours
	FROM  courses WHERE idcourses = 3;

-- Число проведенных занятий 
SELECT COUNT(*) FROM schedule;


-- Число курсов проведенных по MySQL5.1
SELECT COUNT(hours) 
	FROM schedule, courses WHERE courses_idcourses = idcourses AND idcourses = 3;




	
	   
	   