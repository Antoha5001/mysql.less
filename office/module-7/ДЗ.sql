1. ѕри удалении названи€ страны, удал€ть все ее города.
2. ѕри обновлении названи€ страны, мен€ть принадлежность ее городов (они будут принадлежать стране с новым названием ).


DELIMITER |
DROP TRIGGER IF EXISTS tg_country_delete |
CREATE TRIGGER tg_country_delete AFTER DELETE ON country
FOR EACH ROW BEGIN
	-- ≈сли удал€ем страну...
	DELETE FROM city WHERE countrycode = OLD.code;
END;
|
DELIMITER ;

DELIMITER |
DROP TRIGGER IF EXISTS tg_country_update |
CREATE TRIGGER tg_country_update AFTER UPDATE ON country
FOR EACH ROW BEGIN
	-- ≈сли обновл€ем страну...
	UPDATE city SET countrycode = NEW.code WHERE countrycode = OLD.code;
END;
|
DELIMITER ;
DELETE FROM country WHERE code='USA';
SELECT * FROM city WHERE countrycode='USA';

UPDATE country SET code = 'RRR' WHERE code = 'RF1';
SELECT * FROM city WHERE countrycode='RRR';






