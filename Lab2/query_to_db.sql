
-- БАЗОВІ ЗАПИТИ (SELECT, WHERE, ORDER BY)

SELECT * FROM readers;

SELECT * FROM books 
WHERE published_year > 2000;

SELECT title, published_year, isbn 
FROM books 
ORDER BY title ASC;


-- РОБОТА ЗІ ЗВ'ЯЗКАМИ (JOIN)

SELECT 
    readers.full_name AS "Читач",
    books.title AS "Книга",
    loans.loan_date AS "Дата видачі",
    loans.due_date AS "Треба повернути"
FROM loans
JOIN readers ON loans.reader_id = readers.id
JOIN books ON loans.book_id = books.id;


-- АГРЕГАТНІ ФУНКЦІЇ ТА ГРУПУВАННЯ

SELECT DISTINCT name 
FROM genres;

SELECT 
    MIN(published_year) AS "Найстаріший рік",
    MAX(published_year) AS "Найновіший рік"
FROM books;

SELECT COUNT(*) AS "Книг на руках"
FROM loans 
WHERE return_date IS NULL;

SELECT SUM(total_copies) AS "Всього книг у фонді"
FROM books;


-- ГРУПУВАННЯ (GROUP BY + HAVING)

SELECT 
    genres.name AS "Жанр",
    COUNT(books.id) AS "Кількість книг"
FROM books
JOIN genres ON books.genre_id = genres.id
GROUP BY genres.name
HAVING COUNT(books.id) > 1;


SELECT 
    CAST(COUNT(id) AS DECIMAL) / COUNT(DISTINCT reader_id) AS "Середнє книг на читача"
FROM loans;