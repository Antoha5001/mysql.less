-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module7;
USE module7;

-- Посмотреть все движки и их настройки 
SHOW ENGINES;


-- InnoDB
CREATE TABLE city0 ENGINE=InnoDB  SELECT * FROM world.city;
ALTER TABLE city0 ENGINE=InnoDB;
-- Пример тормозного запроса	(мой 4.91 sec)
-- сохранить на флешке, сравнить результат
-- Слушателей: 4.68 - 4.9
SELECT COUNT(*) 
	FROM city0 c1 
	WHERE EXISTS (SELECT * FROM city0 c2 WHERE c1.name = c2.name);

-- MyISAM
CREATE TABLE city1 ENGINE=MyISAM SELECT * FROM world.city;
-- Пример тормозного запроса	(30.98 sec)
-- Слушателей: 31.53 - 29.29
SELECT COUNT(*) 
	FROM city1 c1 
	WHERE EXISTS (SELECT * FROM city1 c2 WHERE c1.name = c2.name);

-- Archive
CREATE TABLE city2 ENGINE=ARCHIVE SELECT * FROM world.city;
-- Пример тормозного запроса (6.96 sec)
-- Слушателей: 6.68 - 6.79
SELECT COUNT(*) 
	FROM city2 c1 
	WHERE EXISTS (SELECT * FROM city2 c2 WHERE c1.name = c2.name);

	
	
--  BLACKHOLE ???
CREATE TABLE city10 ENGINE=BLACKHOLE SELECT * FROM world.city;	
SELECT name 
	FROM city10 c1 
	WHERE EXISTS (SELECT * FROM city10 c2 WHERE c1.name = c2.name);	
	

-- CSV
CREATE TABLE city3 ENGINE=CSV SELECT * FROM world.city;
-- Пример тормозного запроса	(7.88 sec)
SELECT COUNT(*) 
	FROM city3 c1 
	WHERE EXISTS (SELECT * FROM city3 LIMIT 10 c2 WHERE c1.name = c2.name);
-- Слушателей: 7.72 - 7.66

-- Memory
CREATE TABLE city4 ENGINE=MEMORY SELECT * FROM world.city;

-- Пример тормозного запроса	(0.94 sec)
-- Слушателей: 0.79 
SELECT COUNT(*) 
	FROM city4 c1 
	WHERE EXISTS (SELECT * FROM city4 c2 WHERE c1.name = c2.name);

	
--  BLACKHOLE ???
CREATE TABLE city10 ENGINE=BLACKHOLE SELECT * FROM world.city;	
SELECT name 
	FROM city10 c1 
	WHERE EXISTS (SELECT * FROM city10 c2 WHERE c1.name = c2.name);	
	
	