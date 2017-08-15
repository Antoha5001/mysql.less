-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module4;
USE module4;

-- Таблица с данными
CREATE TABLE courses1 ENGINE=MyISAM SELECT * FROM courses.courses;

-- Создадим полнотекстовый индекс
CREATE FULLTEXT INDEX ixFullText ON courses1 (title, description);

-- Поиск в режиме естественного языка
SELECT * 
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST ('курс mysql')\G
	
SELECT title, hours 
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST ('курс mysql' IN NATURAL LANGUAGE MODE);


	
-- Поиск в режиме естественного языка
SELECT title, hours 
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST ('основы программирования' IN NATURAL LANGUAGE MODE);

-- Поиск в режиме логического сравнения
SELECT title, hours 
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST ('+mysql -уровень' IN BOOLEAN MODE);

-- Поиск в режиме логического сравнения
SELECT title, hours 
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST ('-mysql +программ*' IN BOOLEAN MODE);		
		
-- Поиск в смешанном режиме (сортировка в режиме естественного языка, фильтрация в режиме логичесом)
-- Логический режим с сортировкой по релевантности
SELECT SUBSTRING(title,1,30), hours, 
		MATCH (title, description) AGAINST ('android'  IN NATURAL LANGUAGE MODE) AS score  
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST ('android' IN BOOLEAN MODE)
	ORDER BY score DESC;
	

SELECT title, hours, 
		MATCH (title, description) AGAINST ('php'  IN NATURAL LANGUAGE MODE) AS score  
	FROM courses1
	WHERE MATCH (title, description) 
		AGAINST ('php' IN BOOLEAN MODE)
	ORDER BY score DESC;	
	
	
	
	
-- ft_min_word_len = 3	
		
-- Переиндексация
REPAIR TABLE courses1 QUICK;
		