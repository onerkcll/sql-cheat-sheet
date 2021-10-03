CREATE DATABASE record_company; /* Create DB*/ 
USE record_company; 

CREATE TABLE test(
test_column INT /* create table column type of integer */
);
ALTER TABLE test /* edit this table*/
ADD another_column VARCHAR(255); /* add this column to table */
DROP TABLE test;


CREATE TABLE  bands(
id INT NOT NULL  AUTO_INCREMENT, 
name VARCHAR (255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE albums(
 id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR (255) NOT NULL,
 release_year INT,
 band_id INT  NOT NULL ,
 PRIMARY KEY (id),
 FOREIGN KEY (band_id) REFERENCES bands(id)
);

INSERT INTO bands (name)
VALUES ("Iron Maiden");

INSERT INTO bands (name)
VALUES ("Metallica"),("Deuce"),("Ankor");

SELECT * FROM bands;
SELECT * FROM bands LIMIT 2;
SELECT name FROM bands;
SELECT id AS 'ID', name AS 'Band Name' From bands; /* make it alias */
SELECT * FROM bands ORDER BY name;
SELECT * FROM bands ORDER BY name DESC; /* reverse */
INSERT INTO albums(name, release_year, band_id)
VALUES (' The Number of the Beasts', 1985, 1),
	   (' Power Slave', 1984, 1),
       (' Nightmare', 2018, 3),
       ('Nightmare', 2010,4),
       ('Test Album', NULL, 3);
       
SELECT * FROM albums;

SELECT name FROM  albums;
SELECT DISTINCT name FROM albums; #Only Get Unıque Rows


UPDATE albums 
SET release_year = 1982
WHERE id=1;

SELECT * from albums
WHERE release_year < 2000;

SELECT * FROM albums
WHERE name LIKE  '%er%' OR band_id = 3;  /* SELECT the strings that contain er */ 

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums; #This will dete whole of it 

DELETE FROM albums WHERE id = 5;

SELECT * FROM albums;

# Match all data from these two tables and show together
SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
RIGHT JOIN albums ON bands.id = albums.band_id;

#Aggregate function

SELECT AVG (release_year) FROM albums;

SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

/* GREAT EXERCİSE */ 


SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name="Deuce"
GROUP BY band_id
HAVING num_albums = 1; 


