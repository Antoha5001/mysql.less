-- Схема БД сервера
use information_schema;

-- Таблицы схемы
SHOW TABLES;

-- Таблицы БД
DESC TABLES;

-- Список таблиц указанной БД
SELECT TABLE_NAME,TABLE_COMMENT, TABLE_SCHEMA
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'course';

-- Спецификация колонок для таблицы table 2 БД module3
SELECT COLUMN_NAME, data_type, COLUMN_COMMENT
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'module3'
      AND TABLE_NAME = 'table2';

-- Список БД
SELECT * FROM information_schema.SCHEMATA \G;