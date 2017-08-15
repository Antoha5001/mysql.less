-- Создание базы данных
CREATE DATABASE IF NOT EXISTS module7;
USE module7;
-- Копия таблиц для демонстрации
CREATE TABLE courses SELECT * FROM course.courses;
CREATE TABLE teachers SELECT * FROM course.teachers;
CREATE TABLE lessons SELECT * FROM course.lessons;


LOCK TABLES teachers READ;

SELECT name FROM teachers;

INSERT INTO teachers (id, name) VALUES (11, 'Новый преподаватель');
INSERT DELAYED INTO teachers (id, name) VALUES (11, 'Новый преподаватель');

UNLOCK TABLES;

LOCK TABLES teachers WRITE, courses WRITE;

SELECT name FROM teachers;

DELETE FROM teachers WHERE id = 10;

UNLOCK TABLES;

-- "Блокировка" записей
1 'abc'
2 'abc'
SELECT GET_LOCK('1abc', 10);
SELECT RELEASE_LOCK('1abc');





