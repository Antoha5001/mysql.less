-- Создание таблицы данных
USE module3;

/************************************
* Вариант 1 Игровой
*************************************/

-- Удалить таблицу если существует
DROP TABLE IF EXISTS unit;


-- Создать таблицу юнитов
CREATE  TABLE IF NOT EXISTS unit (
  idu INT NOT NULL AUTO_INCREMENT ,
  type_unit VARCHAR(14),
  description VARCHAR(150) ,
  strength TINYINT ,
  attack TINYINT ,
  PRIMARY KEY (idu) ) ENGINE = InnoDB;

CREATE UNIQUE INDEX description_UNIQUE ON module3.unit (description ASC) ;

CREATE UNIQUE INDEX type_unit_UNIQUE ON module3.unit (type_unit ASC) ;

-- вставка данных о типах игровых объектов

INSERT INTO unit (idu, type_unit, description, strength, attack) VALUES (NULL, 'building', 'Постройка начального уровня', 10, 0);
INSERT INTO unit (idu, type_unit, description, strength, attack) VALUES (NULL, 'attacker', 'Атакующий юнит', 4, 12);


-- Создание таблицы игровых объектов game_unit
DROP TABLE IF EXISTS game_unit;
CREATE  TABLE IF NOT EXISTS game_unit (
  idgu INT NOT NULL ,
  unit_idu INT NOT NULL ,
  user_id INT NULL ,
  level SMALLINT NULL,
  PRIMARY KEY (idgu, unit_idu) ,
  CONSTRAINT fk_game_unit_unit  FOREIGN KEY (unit_idu )
    REFERENCES unit (idu )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) ENGINE = InnoDB;

CREATE INDEX fk_game_unit_unit ON module3.game_unit (unit_idu ASC) ;

-- заполнение таблицы игровыми данными
INSERT INTO game_unit (idgu, unit_idu, user_id, level) VALUES (1, 1, 1, 2);
INSERT INTO game_unit (idgu, unit_idu, user_id, level) VALUES (2, 2, 2, 3);


-- Удалить таблиц если существуют
DROP TABLE IF EXISTS game_unit;
DROP TABLE IF EXISTS unit;

-- Создание события
-- Имя должно быть уникальным в рамках схемы БД с длинной не 
-- более 64 символов. Имя события не чувствительно к регистру
-- в DO хранится исполняемый SQL-код
-- Выполнять обычный SELECT в событиях не имеет смысла, но
-- вполне можно использовать SELECT ... INTO и INSERT INTO ... SELECT
-- С событиями можно использовать всю мощь сохраненных процедур
CREATE EVENT add_level
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 SECOND
    DO UPDATE module3.game_unit SET level = level + 1;

-- Каждые три месяца начиная через неделю от текущего времени.
	CREATE EVENT add_level
    ON SCHEDULE EVERY 3 MONTH STARTS CURRENT_TIMESTAMP + INTERVAL 1 WEEK
    DO UPDATE module3.game_unit SET level = level + 1;

-- Каждую секунду
CREATE EVENT add_event
    ON SCHEDULE EVERY 1 SECOND
    COMMENT 'Add level .'
	DO UPDATE module3.game_unit SET level = level + 1;
	
-- Показать все текущие события
SHOW EVENTS\G	
-- Удалить конкретное событие
DROP EVENT add_event;	
	
--  Событие не будет исполнено если не запущен планировщик событий	
SET GLOBAL event_scheduler = ON;
SET @@global.event_scheduler = ON;
SET GLOBAL event_scheduler = 1;
SET @@global.event_scheduler = 1;

SET GLOBAL event_scheduler = OFF;
SET @@global.event_scheduler = OFF;
SET GLOBAL event_scheduler = 0;
SET @@global.event_scheduler = 0;

-- Создаем процедуру
delimiter //
CREATE PROCEDURE myproc(l INT, p INT)
 BEGIN
 UPDATE module3.game_unit SET level = level + l + p;
END
//
delimiter ;

--Можно запускать по событию сохраненную процедуру
CREATE EVENT e_call_myproc
    ON SCHEDULE
      AT CURRENT_TIMESTAMP + INTERVAL 5 SECOND
	  DO CALL myproc(5, 27);

SELECT * FROM game_unit;
