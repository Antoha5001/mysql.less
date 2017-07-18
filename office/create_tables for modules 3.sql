SHOW DATABASES;
use course; SHOW tables;
DESC lessons;
CREATE DATABASE IF NOT EXISTS course;
USE course;
SHOW TABLES ;
CREATE TABLE IF NOT EXISTS teachers
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код учителя',
  name VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Имя учителя',
  addr VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'Адрес учителя',
  PRIMARY KEY (id)
) COMMENT 'Таблица учителя с первичным ключом';

CREATE TABLE IF NOT EXISTS courses
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код курса',
  title VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Название курса',
  length TINYINT NOT NULL DEFAULT 0 COMMENT 'Продолжительность курса, часов',
  description VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'Описание курса',
  cathegory VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Категория курса',
  PRIMARY KEY (id)
) COMMENT 'Таблица курсов с первичным ключом';

CREATE TABLE IF NOT EXISTS lessons
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Код курса',
  teacher INT,
  course INT,
  room CHAR(5) NOT NULL DEFAULT 0 COMMENT 'Номер кабинета',
  length TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Продолжительность урока, часов',
  lesson_date DATETIME COMMENT 'Дата урока',
  PRIMARY KEY (id)
) COMMENT 'Таблица уроков с первичным ключом';