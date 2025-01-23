CREATE DATABASE book_shop;

USE book_shop;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

drop table books;

DESC books;

SELECT * FROM books;

SELECT * , concat_ws(' ',author_fname,author_lname) as full_name FROM books;


SELECT substring('12345', -2, 1);


SELECT substring(title,1,15) AS title 
FROM books;


SELECT concat(substr(title,1,10),'...')
FROM books;


SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS initial
FROM
    books;
    
SELECT replace('Hello', 'll', 'LL'); 


SELECT reverse('12345'); 

SELECT length('대한민국');


SELECT upper('Hello');

SELECT ucase('Hello');

SELECT lower('Hello');

SELECT lcase('Hello');


SELECT 
    UPPER(CONCAT('i love ', title, ' !!!'))
FROM
    books;
    
    
SELECT insert('Hello World', 7, 0, 'There ');


SELECT insert('123456789', 2,2,'hi');


SELECT right('123456789', 5);


SELECT repeat('1', 3);


SELECT TRIM('  111  ');

SELECT TRIM(LEADING 'x' FROM 'xxx111xxx');
SELECT TRIM(BOTH 'x' FROM 'xxx111xxx');
SELECT TRIM(TRAILING 'x' FROM 'xxx111xxx');



SELECT ucase(reverse('Why does my cat look at me with suxh hatred?'));

# I-like-cats 

SELECT replace(title,' ','->') as title from books;


SELECT author_lname as forwards, reverse(author_lname) as backwards FROM books;


SELECT ucase(concat(author_fname,' ', author_lname)) as full_name_in_caps FROM books;


SELECT * FROM books;

SELECT concat(title, ' was released in ', released_year) as blurb FROM books;

SELECT title, char_length(title) as character_count FROM books;


SELECT 
    CONCAT(LEFT(title, 10), '...') AS short_title,
    CONCAT(author_lname, ', ', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;
