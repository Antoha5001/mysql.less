SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`t1`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t1` (
  `i1` INT NOT NULL ,
  `c1` VARCHAR(45) NULL ,
  PRIMARY KEY (`i1`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`t2`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`t2` (
  `i2` INT NOT NULL ,
  `c2` VARCHAR(45) NULL ,
  PRIMARY KEY (`i2`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`t1`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`t1` (`i1`, `c1`) VALUES (1, 'a');
INSERT INTO `mydb`.`t1` (`i1`, `c1`) VALUES (2, 'b');
INSERT INTO `mydb`.`t1` (`i1`, `c1`) VALUES (3, 'c');

COMMIT;

-- -----------------------------------------------------
-- Data for table `mydb`.`t2`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`t2` (`i2`, `c2`) VALUES (2, 'c');
INSERT INTO `mydb`.`t2` (`i2`, `c2`) VALUES (3, 'b');
INSERT INTO `mydb`.`t2` (`i2`, `c2`) VALUES (4, 'a');

COMMIT;



-- Просто объединение
SELECT * FROM t1;

-- Полное объединение (по-другому: перекрестное, декартово)
SELECT t1.*, t2.* FROM t1,t2;
SELECT t1.*, t2.* FROM t1 CROSS JOIN t2;
SELECT * FROM t2 STRAIGHT JOIN t1 ;
SELECT * FROM t2 INNER JOIN t1 ;
SELECT * FROM t2 JOIN t1;

--Полное объединение с условием
SELECT t1.*, t2.* FROM t1,t2 WHERE t1.i1 = t2.i2;
SELECT t1.*, t2.* FROM t1 CROSS JOIN t2 WHERE t1.i1 = t2.i2;
SELECT * FROM t2 STRAIGHT JOIN t1 ON i2= i1 ;
SELECT * FROM t2 INNER JOIN t1 ON i2= i1;
SELECT * FROM t2 JOIN t1 ON i2= i1;

/*
STRAIGHT_JOIN заставляет оптимизатор объединять таблицы в том порядке, в котором они перечислены в FROM пункта. Вы можете использовать это для ускорения запросов, если оптимизатор соединяет таблицы в неоптимальном порядке.
*/

-- Левое и правое объединения

--Если использовать перекрестное объединение, то будут показаны записи только с 2 и 3. То же, что и полное с условием
SELECT t1.*, t2.* FROM t1,t2 WHERE t1.i1 = t2.i2;

-- Левое объединение
SELECT t1.*, t2.* FROM t1 LEFT JOIN t2 ON t1.i1 = t2.i2;
SELECT t1.*, t2.* FROM t1 LEFT OUTER JOIN t2 ON t1.i1 = t2.i2;

-- Правое объединение
SELECT t1.*, t2.* FROM t1 RIGHT JOIN t2 ON t1.i1 = t2.i2;
SELECT t1.*, t2.* FROM t1 RIGHT OUTER JOIN t2 ON t1.i1 = t2.i2;

-- FULL OUTER JOIN напрямую нереализован
SELECT * FROM t1 AS tab1
LEFT OUTER JOIN t2 AS tab2 ON tab1.i1 = tab2.i2
UNION
SELECT * FROM t1 AS tab1
RIGHT OUTER JOIN t2 AS tab2 ON tab1.i1 = tab2.i2;

http://www.kitebird.com/mysql-book/3ed.php