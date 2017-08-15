
-- Создание таблицы
/*
-- Пример
CREATE TABLE  t (name_cell CHAR(20) CHARACTER SET utf8 COLLATE utf8_bin);

CREATE TABLE  lookup
(id INT, INDEX USING BTREE (id)) ENGINE = MEMORY;

CREATE TABLE test (a INT NOT NULL AUTO_INCREMENT, PRIMARY KEY (a), KEY (b))
  ENGINE = MyISAM SELECT b, c FROM test2;*/

-- Создание таблицы с помощью описания
CREATE TABLE IF NOT EXISTS table2
(
  id INT UNSIGNED NOT NULL  AUTO_INCREMENT COMMENT 'Код товара',
  name VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'Название товара',
  price FLOAT NOT NULL  DEFAULT 0 COMMENT 'Цена товара',
  PRIMARY KEY (id)
) COMMENT 'Таблица товара с первичным ключом';

DESC table1;

-- Удаление таблицы
DROP TABLE IF EXISTS table2;

-- Создание таблицы по образцу
CREATE TABLE table3 LIKE table2;


-- Создание таблицы на основе запроса
CREATE TABLE table4 COMMENT 'Результаты запроса'
    SELECT user, host
    FROM mysql.user;

-- Создание ВРЕМЕННОЙ таблицы на основе запроса
CREATE TEMPORARY TABLE table5 COMMENT 'Результаты запроса'
    SELECT user, host
    FROM mysql.user;


