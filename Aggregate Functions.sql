SELECT 
    *
FROM
    books;

SELECT 
    COUNT(*)
FROM
    books;

SELECT COUNT(author_fname) -- null은 안셈
FROM books;

SELECT COUNT(DISTINCT released_year)
FROM books;

SELECT COUNT(*)
FROM books
WHERE title like '%the%';

SELECT author_lname, author_fname, COUNT(*) as books_written
FROM books
GROUP BY author_lname, author_fname
ORDER BY books_written DESC;


SELECT COUNT(*), released_year
FROM books
GROUP BY released_year;


SELECT MAX(pages) as pages, released_year
FROM books
GROUP BY released_year;

SELECT books.*
FROM books
JOIN (SELECT MAX(pages) as pages, released_year
	FROM books
	GROUP BY released_year) as c
ON books.pages = c.pages and books.released_year = c.released_year;


SELECT MIN(released_year)
FROM books;

SELECT MAX(pages)
FROM books;

SELECT *
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT *
FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);


SELECT *
FROM books
ORDER BY pages DESC
LIMIT 1;


SELECT author_lname
FROM books
WHERE length(author_lname) = (SELECT MIN(length(author_lname)) FROM books);


SELECT author_fname, author_lname, COUNT(*)
FROM books
GROUP BY author_fname, author_lname;

SELECT concat(author_fname, ' ',author_lname) as author , COUNT(*)
FROM books
GROUP BY author;

SELECT title, concat(author_fname, ' ',author_lname) as author, released_year
FROM books
WHERE released_year in (SELECT min(released_year) FROM books GROUP BY author_fname, author_lname);

SELECT concat(author_fname, ' ',author_lname) as author, min(released_year)
FROM books
GROUP BY author_fname, author_lname;


SELECT concat(author_fname, ' ',author_lname) as author, sum(pages)
FROM books
GROUP BY author_fname, author_lname;

SELECT concat(author_fname, ' ',author_lname) as author, round(avg(pages),1)
FROM books
GROUP BY author_fname, author_lname;


-- 1
SELECT COUNT(*)
FROM books;


-- 2
SELECT COUNT(*), released_year
FROM books
GROUP BY released_year;

-- 3
SELECT SUM(stock_quantity)
FROM books;

-- 4
SELECT concat_ws(' ',author_fname, author_lname) as author, avg(released_year)
FROM books
GROUP BY author;

-- 5
SELECT concat_ws(' ',author_fname, author_lname) as author
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

-- 6
SELECT released_year as year, count(*) as books, avg(pages) as avg_pages
FROM books
GROUP BY released_year
ORDER BY released_year;
