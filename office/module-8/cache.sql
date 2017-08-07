--отдельные переменные кеша
SHOW VARIABLES LIKE 'have_query_cache';
SHOW VARIABLES LIKE 'query_cache_limit';
SHOW VARIABLES LIKE 'query_cache_min_res_unit';

--все переменные кеша
SHOW VARIABLES LIKE '%query_cache%';


SET SESSION query_cache_type = OFF;
SET GLOBAL query_cache_limit = 0;

--сброс кеша
RESET QUERY CACHE