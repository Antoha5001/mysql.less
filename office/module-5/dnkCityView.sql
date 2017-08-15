-- выбрать все города Франции во view dnkCity


DROP VIEW IF EXISTS dnkCity;
CREATE 
	DEFINER='root'@'localhost'
	SQL SECURITY DEFINER
	VIEW dnkCity AS
	 SELECT city.name
        FROM city
        WHERE city.countryCode = 'FRA';
		
-- создать изменяемый view	
DROP VIEW IF EXISTS dnkCity2;
CREATE 
	DEFINER='root'@'localhost'
	SQL SECURITY DEFINER
	VIEW dnkCity2 AS
	 SELECT * FROM city;
		
SELECT * FROM dnkCity; 
SELECT count(*) FROM dnkCity2; 

-- Обновляем отдельный город
UPDATE city
       SET countryCode = 'DNK' 
        WHERE city.name = 'Paris';

INSERT INTO dnkCity2 VALUE (NULL, 'Some city','FRA','lan', 20000000);	
		
		
		
		
		
		