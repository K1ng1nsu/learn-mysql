SELECT *
FROM books;


-- not equal  
SELECT *
FROM books
WHERE released_year != 2017;

-- not like
SELECT *
FROM books
WHERE title not like '%the%';

-- greater than

SELECT *
FROM books
WHERE pages > 300;

-- less than

SELECT *
FROM books
WHERE pages < 200;

-- logical and

SELECT *
FROM books
WHERE pages < 200 and released_year > 1990;

-- logical or

SELECT *
FROM books
WHERE pages < 200 or  stock_quantity < 50;

-- between

SELECT *
FROM books
WHERE 200 < pages and pages < 500;

SELECT *
FROM books
WHERE pages BETWEEN 200 and 500;

-- IN

SELECT *
FROM books
WHERE released_year in (2003,2004,2017);

-- modulo operator

SELECT *
FROM books
WHERE released_year % 2 != 0;

-- case 

SELECT title, released_year,
	CASE 
		WHEN released_year > 2000 then 'modern lit'
        ELSE '20th century lit'
	END as genre
FROM books;

SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 and 49 THEN '*'
        WHEN stock_quantity BETWEEN 50 and 99 THEN '**'
        ELSE '***'
	END as STOCK
FROM books;

SELECT title,
	CASE
		WHEN stock_quantity is null then 0
        else stock_quantity
	END as stock_quantity
FROM books;

-- is null

SELECT *
FROM books
WHERE title is null or stock_quantity is null;

SELECT *
FROM books
WHERE stock_quantity is null;


-- 1
# 0, 1, 1

-- 2
SELECT *
FROM books
WHERE released_year < 1980;

-- 3
SELECT *
FROM books
WHERE author_lname in ('Eggers','Chabon');

-- 4
SELECT *
FROM books
WHERE author_lname = 'Lahiri' and released_year >= 2000;

-- 5
SELECT *
FROM books
WHERE pages BETWEEN 100 and 200;

-- 6
SELECT *
FROM books
WHERE author_lname like 'c%' or author_lname like 's%';

-- 7
SELECT title, author_lname,
	CASE 
		WHEN title like '%stories%' THEN 'Short Stories'
        WHEN title in ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
        ELSE 'Novel'
    END as 'TYPE'
FROM books;

-- 8
SELECT author_fname, author_lname, 
	CASE
		WHEN COUNT(*) = 1 THEN concat(COUNT(*), ' ', 'book')
        ELSE concat(COUNT(*), ' ', 'books')
	END as COUNT
FROM books
GROUP BY author_fname, author_lname;
