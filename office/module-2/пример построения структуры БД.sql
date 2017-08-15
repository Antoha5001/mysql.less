SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `courses` ;
CREATE SCHEMA IF NOT EXISTS `courses` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `courses` ;

-- -----------------------------------------------------
-- Table `courses`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `courses`.`courses` ;

CREATE  TABLE IF NOT EXISTS `courses`.`courses` (
  `idcourses` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(245) NULL ,
  `hours` TINYINT UNSIGNED NULL ,
  `description` TEXT NULL ,
  PRIMARY KEY (`idcourses`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `courses`.`teachers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `courses`.`teachers` ;

CREATE  TABLE IF NOT EXISTS `courses`.`teachers` (
  `idteachers` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `address` VARCHAR(85) NULL ,
  PRIMARY KEY (`idteachers`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `courses`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `courses`.`department` ;

CREATE  TABLE IF NOT EXISTS `courses`.`department` (
  `iddepartment` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `address` VARCHAR(100) NULL ,
  PRIMARY KEY (`iddepartment`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `courses`.`schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `courses`.`schedule` ;

CREATE  TABLE IF NOT EXISTS `courses`.`schedule` (
  `idschedule` INT NOT NULL ,
  `courses_idcourses` INT NOT NULL ,
  `teachers_idteachers` INT NOT NULL ,
  `department_iddepartment` INT NOT NULL ,
  `date_course` DATE NULL ,
  PRIMARY KEY (`idschedule`) ,
  INDEX `fk_schedule_courses` (`courses_idcourses` ASC) ,
  INDEX `fk_schedule_teachers1` (`teachers_idteachers` ASC) ,
  INDEX `fk_schedule_department1` (`department_iddepartment` ASC) ,
  CONSTRAINT `fk_schedule_courses`
    FOREIGN KEY (`courses_idcourses` )
    REFERENCES `courses`.`courses` (`idcourses` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_teachers1`
    FOREIGN KEY (`teachers_idteachers` )
    REFERENCES `courses`.`teachers` (`idteachers` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_department1`
    FOREIGN KEY (`department_iddepartment` )
    REFERENCES `courses`.`department` (`iddepartment` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `courses`.`courses`
-- -----------------------------------------------------
START TRANSACTION;
USE `courses`;
INSERT INTO `courses`.`courses` (`idcourses`, `title`, `hours`, `description`) VALUES (NULL, 'Oracle 11g: Основы SQL', 40, 'Курс обеспечивает слушателей базовыми знаниями SQL, позволяющими разработчику писать запросы к одной или нескольким таблицам, модифицировать данные таблиц и создавать объекты базы данных. Основным инструментом разработки, используемым в курсе, является Oracle SQL Developer; в качестве дополнительного используется SQL Plus.');
INSERT INTO `courses`.`courses` (`idcourses`, `title`, `hours`, `description`) VALUES (NULL, 'Основы администрирования Oracle 11g, часть I', 40, 'Цель курса — дать администратору базы данных основные знания и навыки, необходимые для администрирования базы данных Oracle 11g. В курсе рассматривается архитектура базы данных, взаимодействие между собой ее компонентов. Слушатели изучают, как устанавливается программное обеспечение и сопровождается база данных Oracle 11g. Слушатели узнают, как создается база данных, изучают средства эффективного управления компонентами базы данных, в том числе мониторинга производительности, обеспечения безопасности и выполнения резервирования и восстановления базы данных.');
INSERT INTO `courses`.`courses` (`idcourses`, `title`, `hours`, `description`) VALUES (NULL, 'MySQL 5. Проектирование и создание баз данных для web', 32, 'Сервер MySQL очень распространен и часто используется в Веб–технологиях. На этом сервере базируются большинство сайтов и решений в Интернете. На курсе «Сервер MySQL 5» рассматриваются основные приемы и методы эффективной работы с сервером MySQL 5. Данный курс предназначен для разработчиков, которые планируют использовать сервер MySQL в своей практике. Особенно курс будет интересен Веб– разработчикам, использующимм PHP и Perl. ');
INSERT INTO `courses`.`courses` (`idcourses`, `title`, `hours`, `description`) VALUES (NULL, 'PHP. Уровень 2. Разработка web - сайтов и взаимодействие с MySQL', 24, 'На курсе Вы получите необходимые навыки для создания сложных веб-сайтов на PHP. Курс PHP. Уровень 2. Разработка web-сайтов и взаимодействие с MySQL является вторым шагом в цепочке подготовки веб-мастера к получению сертификации ZCE (Zend Certified Engineer) - официального международного статуса профессионального PHP-разработчика.');
INSERT INTO `courses`.`courses` (`idcourses`, `title`, `hours`, `description`) VALUES (NULL, 'РНР. Уровень 4. Проектирование и разработка сложных веб - проектов на РНР 5', 24, 'Курс является обязательным в цепочке подготовки веб-мастера к получению сертификации ZCE (Zend Certified Engineer).');
INSERT INTO `courses`.`courses` (`idcourses`, `title`, `hours`, `description`) VALUES (NULL, 'Разработка мобильных приложений под Android', 40, 'Этот интенсивный курс поможет Вам овладеть необходимыми знаниями и навыками для разработки программного обеспечения под платформу Android. Вы изучите API Android, инструменты разработчика (SDK) и многое другое.');
INSERT INTO `courses`.`courses` (`idcourses`, `title`, `hours`, `description`) VALUES (NULL, 'IPhone. Уровень 1. Разработка мобильных приложений под IOS', 24, 'На этом курсе Вы научитесь создавать приложения для iPhone начального уровня.');
INSERT INTO `courses`.`courses` (`idcourses`, `title`, `hours`, `description`) VALUES (NULL, 'Разработка мобильных приложений под Windows Phone', 40, 'Цель курса — получение знаний и навыков, необходимых для успешной разработки мобильных приложений для новейшей платформы от Microsoft – Windows Phone.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `courses`.`teachers`
-- -----------------------------------------------------
START TRANSACTION;
USE `courses`;
INSERT INTO `courses`.`teachers` (`idteachers`, `name`, `address`) VALUES (NULL, 'Иванов Иван Иванович', 'г.Москва,ул.Строителей, д4,кв 56');
INSERT INTO `courses`.`teachers` (`idteachers`, `name`, `address`) VALUES (NULL, 'Петров Петр Петрович', 'г.Королев,ул Космонавтов,д34,кв 87');
INSERT INTO `courses`.`teachers` (`idteachers`, `name`, `address`) VALUES (NULL, 'Сидоров Сидор Сидорович', 'г.Звенигород,проспект Вернадского,д2б,кв. 11');
INSERT INTO `courses`.`teachers` (`idteachers`, `name`, `address`) VALUES (NULL, 'Емельяненко Емельян Емельянович', 'г.Москва,ул.Юных Ленинцев,д.125,кв 89');
INSERT INTO `courses`.`teachers` (`idteachers`, `name`, `address`) VALUES (NULL, 'Ильин Илья Ильич', 'г.Пушкино,ул.Гагарина,д.12, кв 89');

COMMIT;

-- -----------------------------------------------------
-- Data for table `courses`.`department`
-- -----------------------------------------------------
START TRANSACTION;
USE `courses`;
INSERT INTO `courses`.`department` (`iddepartment`, `name`, `address`) VALUES (NULL, 'Радио', 'ул. Радио, д.24, корпус 1, 2-ой подъезд, 2-ой этаж');
INSERT INTO `courses`.`department` (`iddepartment`, `name`, `address`) VALUES (NULL, 'Таганский', 'ул. Воронцовская, д. 35, корп.2, 5-ый этаж');
INSERT INTO `courses`.`department` (`iddepartment`, `name`, `address`) VALUES (NULL, 'Стилобат', 'Госпитальный переулок, д. 4/6, 2-ой этаж');
INSERT INTO `courses`.`department` (`iddepartment`, `name`, `address`) VALUES (NULL, 'Бауманский', 'ул. Бауманская, д. 6, стр. 2, бизнес-центр \"Виктория Плаза\", 4-й этаж');
INSERT INTO `courses`.`department` (`iddepartment`, `name`, `address`) VALUES (NULL, 'Белорусско-Савеловский', '3-я ул. Ямского Поля, д. 32, 1-й подъезд, 4-й этаж');
INSERT INTO `courses`.`department` (`iddepartment`, `name`, `address`) VALUES (NULL, 'Парк Победы', 'ул. Барклая, д.6, стр. 9, 3-й этаж');
INSERT INTO `courses`.`department` (`iddepartment`, `name`, `address`) VALUES (NULL, 'Полежаевский', 'ул. 4-я Магистральная, д. 11, 6-й этаж');
INSERT INTO `courses`.`department` (`iddepartment`, `name`, `address`) VALUES (NULL, 'Вернадский', 'Проспект Вернадского, д. 29, 16-й этаж');

COMMIT;


-- -----------------------------------------------------

-- Data for table `courses`.`schedule`

-- -----------------------------------------------------

START TRANSACTION;

USE `courses`;

INSERT INTO `courses`.`schedule` (`idschedule`, `courses_idcourses`, `teachers_idteachers`, `department_iddepartment`, `date_course`) VALUES (1, 1, 2, 3, '2012-01-05');

INSERT INTO `courses`.`schedule` (`idschedule`, `courses_idcourses`, `teachers_idteachers`, `department_iddepartment`, `date_course`) VALUES (2, 4, 4, 6, '2012-01-25');

INSERT INTO `courses`.`schedule` (`idschedule`, `courses_idcourses`, `teachers_idteachers`, `department_iddepartment`, `date_course`) VALUES (3, 3, 1, 2, '2011-12-27');

INSERT INTO `courses`.`schedule` (`idschedule`, `courses_idcourses`, `teachers_idteachers`, `department_iddepartment`, `date_course`) VALUES (4, 2, 3, 4, '2012-02-07');

INSERT INTO `courses`.`schedule` (`idschedule`, `courses_idcourses`, `teachers_idteachers`, `department_iddepartment`, `date_course`) VALUES (5, 4, 3, 5, '2011-10-23');



COMMIT;
