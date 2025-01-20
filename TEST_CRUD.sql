CREATE DATABASE shirts_db;

SHOW DATABASES;

SELECT DATABASE();

USE shirts_db;

SELECT DATABASE();

CREATE TABLE shirts(
shirt_id INT PRIMARY KEY AUTO_INCREMENT,
article varchar(15),
color varchar(15),
shirt_size VARCHAR(3),
last_worn INT);

SHOW TABLES;

DESC shirts;

INSERT INTO shirts (article,color,shirt_size,last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);


INSERT INTO shirts (article,color,shirt_size,last_worn) VALUES ('polo shirt','purple','M',50);


SELECT article, color
FROM shirts;

SELECT article,color,shirt_size,last_worn
FROM shirts
WHERE shirt_size='M';

CREATE TEMPORARY TABLE temp_shirts AS
SELECT *
FROM shirts
WHERE article = 'polo shirt';

SELECT *
FROM temp_shirts;

UPDATE shirts
SET shirt_size = 'L'
WHERE shirt_id IN (SELECT shirt_id FROM temp_shirts);

DROP TABLE temp_shirts;

CREATE TEMPORARY TABLE temp_shirts AS
SELECT * 
FROM shirts
WHERE last_worn = 15;

SELECT *
FROM temp_shirts;

UPDATE shirts
SET last_worn = 0
WHERE shirt_id IN (SELECT shirt_id FROM temp_shirts);

CREATE TEMPORARY TABLE temp_shirts AS
SELECT *
FROM shirts
WHERE color = 'white';

SELECT *
FROM temp_shirts;

UPDATE shirts
SET shirt_size = 'XS', color = 'off white'
WHERE shirt_id IN (SELECT shirt_id FROM temp_shirts);


DROP TABLE temp_shirts;

CREATE TEMPORARY TABLE temp_shirts AS
SELECT *
FROM shirts
WHERE last_worn = 200;

SELECT *
FROM temp_shirts;

DELETE FROM shirts
WHERE shirt_id IN (SELECT shirt_id FROM temp_shirts);

SELECT *
FROM shirts;

DROP TABLE temp_shirts;

CREATE TEMPORARY TABLE temp_shirts AS
SELECT *
FROM shirts
WHERE article = 'tank top';

SELECT *
FROM temp_shirts;

DELETE FROM shirts
WHERE shirt_id IN (SELECT shirt_id FROM temp_shirts);


DROP TABLE temp_shirts;

CREATE TEMPORARY TABLE temp_shirts AS
SELECT *
FROM shirts;

SELECT *
FROM temp_shirts;

DELETE FROM shirts
WHERE shirt_id IN (SELECT shirt_id FROM temp_shirts);

DROP TABLE shirts;