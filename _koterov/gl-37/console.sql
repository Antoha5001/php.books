CREATE DATABASE IF NOT EXISTS phpbook DEFAULT CHARSET UTF8;

SHOW DATABASES ;
USE phpbook;
SHOW TABLES ;

CREATE TABLE authors (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name TINYTEXT,
  password TINYTEXT,
  email TINYTEXT,
  url TEXT,
  icq TINYTEXT,
  about TEXT,
  photo TINYTEXT,
  put_date DATETIME DEFAULT NULL ,
  last_visit DATETIME DEFAULT NULL ,
  themes INT(10) DEFAULT NULL ,
  status_user ENUM('user','moderator','admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (id)
);
DROP TABLE authors;
DESC authors;

CREATE TABLE forums(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name TINYTEXT,
  forums_rule TEXT,
  logo TINYTEXT,
  pos INT(11) DEFAULT NULL ,
  visible ENUM('hide','show') NOT NULL DEFAULT 'show',
  PRIMARY KEY (id)
);

CREATE TABLE themes(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name TINYTEXT,
  author TINYTEXT,
  id_authors INT(11) DEFAULT NULL ,
  visible ENUM('hide','show') NOT NULL DEFAULT 'show',
  id_forums INT(11) DEFAULT NULL ,
  put_date DATETIME DEFAULT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE posts(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name TINYTEXT,
  url TEXT,
  file TINYTEXT,
  author TINYTEXT,
  id_authors INT(11) DEFAULT NULL ,
  visible ENUM('hide','show') NOT NULL DEFAULT 'show',
  put_date DATETIME DEFAULT NULL ,
  parent_post INT(11) DEFAULT NULL ,
  theme_id INT(11) DEFAULT NULL ,
  PRIMARY KEY (id)
);

ALTER TABLE forums ADD test INT(11) AFTER name;
DESC  forums;

ALTER TABLE forums CHANGE test new_test TEXT;

ALTER TABLE forums CHANGE new_test new_test INT(5);

ALTER TABLE forums DROP new_test;

CREATE TABLE tbl(
  id INT(11) NOT NULL DEFAULT 5,
  cat_id INT(11) DEFAULT NULL
);

DESC tbl;
INSERT INTO tbl VALUE (10,20);
INSERT INTO tbl (id) VALUE (11);
INSERT INTO tbl (cat_id, id ) VALUE (10,20);
INSERT INTO tbl (cat_id, id, put_date, visit_date ) VALUE (100,20,'2018-01-28 22:12:43',"2018-01-28");
INSERT INTO tbl (cat_id, id, put_date, visit_date ) VALUE (101,21,NOW(),NOW());
INSERT IGNORE INTO tbl (cat_id, id, put_date, visit_date ) VALUE (103,NULL ,NOW(),NOW());
INSERT INTO tbl ( ) VALUE ();

ALTER TABLE tbl ADD put_date DATETIME NOT NULL DEFAULT "2018-01-01 12:00:00";
ALTER TABLE tbl ADD visit_date DATE NOT NULL DEFAULT "2018-01-01";
ALTER TABLE tbl ADD PRIMARY KEY (id);
ALTER TABLE tbl CHANGE id id INT(11) AUTO_INCREMENT ;



UPDATE tbl SET visit_date = "2018-01-28" WHERE id = 5;

UPDATE tbl  SET id = 19 WHERE cat_id = 100;

INSERT INTO tbl SET id = 50, cat_id = 100;
DELETE * FROM tbl;
SELECT * FROM tbl;

CREATE TABLE catalogs(
  catalog_id INT(11) NOT NULL ,
  name TINYTEXT NOT NULL
);

DESC catalogs;
SELECT * FROM catalogs;

INSERT INTO catalogs VALUES (1, 'Процессоры');
INSERT INTO catalogs VALUES (2, "Оперативная память");
INSERT INTO catalogs VALUES (3, 'Видеокарты "Geforce 8"');