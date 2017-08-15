-- Создание базы данных
USE module4;
	
-- Выбрать имена и адреса всех преподавателей, отсортировать по имени
SELECT name, address
	FROM teachers
	ORDER BY name;		
	
-- Выбрать имена и адреса всех преподавателей, отсортировать по адресу
SELECT name, address
	FROM teachers
	ORDER BY 2;	
	
-- Выбрать имена и адреса всех преподавателей, в случайном порядке
SELECT name, address
	FROM teachers
	ORDER BY RAND();
	
-- Выбрать имена и адреса трех преподавателей по алфавитному порядку
SELECT name, address
	FROM teachers
	ORDER BY name
	LIMIT 3;
	
-- Выбрать имя и адрес преподавателя по алфавитному порядку на третьей позиции
SELECT name, address
	FROM teachers
	ORDER BY name
	LIMIT 3, 1;	
	
-- Выбрать имя и адрес преподавателя последнего в списке
SELECT * 
	FROM teachers
	ORDER BY idteachers DESC
	LIMIT 1;
	
	
	