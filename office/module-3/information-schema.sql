/*INFORMATION_SCHEMA обеспечивает подключение к БД метаданных с информацией о MySQL сервере,
такой как названия БД или таблиц, тип столбцов и привилегиях. Например 

+---------------------------------------+
| Tables_in_information_schema          |
+---------------------------------------+
| CHARACTER_SETS                        |
| COLLATIONS                            |
| COLLATION_CHARACTER_SET_APPLICABILITY |
| COLUMNS                               |
| COLUMN_PRIVILEGES                     |
| ENGINES                               |
| EVENTS                                |
| FILES                                 |
| GLOBAL_STATUS                         |
| GLOBAL_VARIABLES                      |
| KEY_COLUMN_USAGE                      |
| PARTITIONS                            |
| PLUGINS                               |
| PROCESSLIST                           |
| PROFILING                             |
| REFERENTIAL_CONSTRAINTS               |
| ROUTINES                              |
| SCHEMATA                              |
| SCHEMA_PRIVILEGES                     |
| SESSION_STATUS                        |
| SESSION_VARIABLES                     |
| STATISTICS                            |
| TABLES                                |
| TABLE_CONSTRAINTS                     |
| TABLE_PRIVILEGES                      |
| TRIGGERS                              |
| USER_PRIVILEGES                       |
| VIEWS                                 |
+---------------------------------------+
*/

-- Схема БД сервера
USE information_schema;

-- Таблицы схемы
SHOW TABLES;

-- Таблицы БД
DESC tables;

-- Список таблиц указанной БД
SELECT table_name, table_comment
	FROM information_schema.tables
	WHERE table_schema = 'module3';

-- Спецификация колонок для таблицы table2 БД module3
SELECT column_name, data_type, column_comment
	FROM information_schema.columns
	WHERE table_schema = 'module3'
	  AND table_name = 'table2';
	
-- Список БД	
SELECT *
	FROM information_schema.schemata \G