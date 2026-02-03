SELECT b.title, a.full_name 
FROM books b
INNER JOIN authors a ON b.author_id = a.id;

SELECT a.full_name, b.title 
FROM authors a
LEFT JOIN books b ON a.id = b.author_id;

SELECT g.name AS genre, b.title 
FROM books b
RIGHT JOIN genres g ON b.genre_id = g.id;

SELECT r.full_name, l.loan_date 
FROM readers r
FULL JOIN loans l ON r.id = l.reader_id;

SELECT r.full_name, b.title 
FROM readers r
CROSS JOIN books b;

SELECT b1.title AS book_1, b2.title AS book_2, b1.published_year
FROM books b1
JOIN books b2 ON b1.published_year = b2.published_year AND b1.id <> b2.id;

SELECT b.title, a.full_name, g.name AS genre
FROM books b
JOIN authors a ON b.author_id = a.id
JOIN genres g ON b.genre_id = g.id;

SELECT a.full_name 
FROM authors a
LEFT JOIN books b ON a.id = b.author_id
WHERE b.id IS NULL;

SELECT a.full_name, COUNT(b.id) AS book_count
FROM authors a
JOIN books b ON a.id = b.author_id
GROUP BY a.full_name;

SELECT DISTINCT r.full_name
FROM readers r
JOIN loans l ON r.id = l.reader_id
JOIN books b ON l.book_id = b.id
JOIN genres g ON b.genre_id = g.id
WHERE g.name = 'Фантастика';

