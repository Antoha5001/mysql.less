-- Список стран в которых нет городов миллиоников
SELECT country.Name
    FROM world.country
    WHERE country.Code NOT IN
(
    -- Список кодов стран с городами миллиониками
    SELECT DISTINCT countryCode
        FROM city
        WHERE population > 500
)