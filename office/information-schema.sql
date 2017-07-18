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

SELECT COLUMN_NAME, data_type, COLUMN_COMMENT
        FROM information_schema.COLUMNS
        WHERE COLUMN_NAME =;