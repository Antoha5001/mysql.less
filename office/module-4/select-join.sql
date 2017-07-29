-- Создание базы данных
USE module4;

-- Объединение через WHERE
SELECT teachers.name, schedule.*
	FROM schedule, teachers, courses
	WHERE schedule.idschedule = 1
	  AND teachers.idteachers = schedule.idschedule;
	  
-- Объединение через WHERE смотрим кто вел первый курс и чему он был посвящен
SELECT teachers.name, courses.title
	FROM schedule, teachers, courses
	WHERE schedule.idschedule = 1
	  AND teachers.idteachers = schedule.idschedule
	  AND schedule.idschedule = courses.idcourses;
	  


-- Полное объединение
SELECT schedule.*, teachers.*
	FROM schedule, teachers;
	  
-- Кто из преподавателей читал курсы 
SELECT teachers.idteachers,teachers.name, teachers_idteachers
	FROM teachers 
		INNER JOIN schedule ON teachers.idteachers = teachers_idteachers;


-- Кто из преподавателей читал курсы в комплексе Таганский
SELECT DISTINCT 
		teachers.name 	-- Имя преподаавтеля
	FROM teachers
		INNER JOIN schedule ON teachers.idteachers = teachers_idteachers
		INNER JOIN department ON department_iddepartment = department.iddepartment
	WHERE department.name LIKE '%Таганский%'
	ORDER BY teachers.name;
	
	
-- Проверяем кто где читал курсы
SELECT DISTINCT 
		teachers.name, 	-- Имя преподавателя
		department.name -- Название комплекса
	FROM teachers
		INNER JOIN schedule ON teachers.idteachers = teachers_idteachers
		INNER JOIN department ON department_iddepartment = department.iddepartment
	ORDER BY teachers.name;
	
	
	   
-- Какие курсы читает преподаватель ИВАНОВ
SELECT DISTINCT courses.title
	FROM courses
		INNER JOIN schedule ON courses.idcourses =  courses_idcourses
		INNER JOIN teachers ON teachers.idteachers = teachers_idteachers
	WHERE teachers.name = 'Иванов Иван Иванович';
	
	
-- Еще один препод
INSERT INTO teachers (name) VALUES ('Новый препод');	

-- Когда последний раз преподаватели вели занятия
-- Если бы была дата!
SELECT teachers.name, MAX(schedule.lesson_date)
	FROM teachers
		INNER JOIN schedule ON teachers.idteachers = teachers_idteachers
	GROUP BY teachers.name;

	
	
	
-- Полный список преподавателей и даты, когда они вели занятия прошлый раз
SELECT teachers.name, MAX(lessons.lesson_date)
	FROM teachers
		LEFT JOIN lessons ON teachers.id = lessons.teacher
	GROUP BY teachers.name
	ORDER BY 1;

	