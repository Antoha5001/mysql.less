CREATE USER 'alex'@'localhost' IDENTIFIED BY 'mypass';
GRANT ALL ON module5.* TO 'alex'@'localhost';
GRANT SELECT ON *.* TO 'alex'@'localhost';

DROP USER 'alex'@'localhost';