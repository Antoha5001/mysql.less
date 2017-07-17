
-- Создание бызы данных
/*
  Если с пробелом, ставить апостроф
*/

DROP DATABASE IF EXISTS module3;
CREATE DATABASE module3 COLLATE utf8_general_ci;
CREATE DATABASE `module 3`;
/*CREATE DATABASE [module 3]; -- MS SQL*/
CREATE DATABASE IF NOT EXISTS `module3`;

DROP DATABASE IF EXISTS `module 3`;
DROP DATABASE IF EXISTS module3;

SHOW DATABASES;