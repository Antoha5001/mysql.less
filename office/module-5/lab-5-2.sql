-- Список стран, в которых есть города миллионники
SELECT DISTINCT country.Name
    FROM world.country 
		INNER JOIN world.city ON country.Code = city.CountryCode
    WHERE city.Population = 1000000;

-- Список стран, в которых есть города с населением более миллиона 
SELECT DISTINCT country.Name
    FROM world.country 
		INNER JOIN world.city ON country.Code = city.CountryCode
    WHERE city.Population > 1000000;
	
-- Список стран, в которых нет городов с населением более миллиона 
SELECT country.Name
    FROM world.country 
	WHERE country.Name NOT IN (
SELECT DISTINCT country.Name
    FROM world.country 
		INNER JOIN world.city ON country.Code = city.CountryCode
    WHERE city.Population > 1000000)