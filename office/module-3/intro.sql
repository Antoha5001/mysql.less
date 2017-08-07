SELECT 1+1;     # Комментарий до конца строки
SELECT 1+1;     -- Комментарий до конца строки
SELECT 1 /* Комментарий в рамках строки */ + 1;
SELECT 1+
/*
а это
многострочный комментарий
*/
1;

/*! MySQL-специфический код */

-- TEMPORARY сработает только для версии MySQL 3.23.02 и выше
CREATE /*!32302 TEMPORARY */ TABLE t (a INT);

-- Показать базы данных
SHOW DATABASES;

--http://dev.mysql.com/doc/refman/5.1/en/comments.html