SHOW DATABASES;
use course; SHOW tables;
DESC lessons;
CREATE DATABASE IF NOT EXISTS course;
USE course;
SHOW TABLES ;

-- Создание БД
DROP TABLE IF EXISTS teachers;
CREATE TABLE IF NOT EXISTS teachers
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код учителя',
  name VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Имя учителя',
  addr VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'Адрес учителя',
  CONSTRAINT pkId PRIMARY KEY (id)
) COMMENT 'Таблица учителя с первичным ключом';

DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код курса',
  title VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Название курса',
  length TINYINT NOT NULL DEFAULT 0 COMMENT 'Продолжительность курса, часов',
  description VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'Описание курса',
  cathegory VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Категория курса',
  previous INT DEFAULT 0 COMMENT 'Требования к курсу',
  CONSTRAINT pkId PRIMARY KEY (id),
  INDEX ixPrevious (previous),
  CONSTRAINT fkPrevious FOREIGN KEY (previous) REFERENCES (id)
) COMMENT 'Таблица курсов с первичным ключом';

DROP TABLE IF EXISTS lessons;
CREATE TABLE IF NOT EXISTS lessons
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код урока',
  teacher INT,
  course INT,
  room CHAR(5) NOT NULL DEFAULT 0 COMMENT 'Номер кабинета',
  length TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Продолжительность урока, часов',
  lesson_date DATETIME COMMENT 'Дата урока',
  CONSTRAINT pkId PRIMARY KEY (id),
  INDEX ixTeacher (teacher),
  CONSTRAINT fkTeacher FOREIGN KEY (teacher) REFERENCES teachers(id),
  INDEX ixCourse (course),
  CONSTRAINT fkCourse FOREIGN KEY (course) REFERENCES courses(id)
) COMMENT 'Таблица уроков с первичным ключом';