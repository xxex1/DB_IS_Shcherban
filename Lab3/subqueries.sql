SELECT title, total_copies 
FROM books 
WHERE total_copies = (SELECT MAX(total_copies) FROM books);

SELECT full_name 
FROM authors 
WHERE id IN (
    SELECT author_id 
    FROM books 
    WHERE genre_id = (SELECT id FROM genres WHERE name = 'Детектив')
);

SELECT title 
FROM books 
WHERE id NOT IN (SELECT DISTINCT book_id FROM loans);

SELECT full_name 
FROM readers r
WHERE EXISTS (
    SELECT 1 
    FROM loans l 
    WHERE l.reader_id = r.id AND l.return_date IS NULL
);

SELECT name 
FROM genres g
WHERE NOT EXISTS (
    SELECT 1 
    FROM books b 
    WHERE b.genre_id = g.id
);

SELECT title, published_year, 
       published_year - (SELECT AVG(published_year) FROM books) AS diff_from_avg
FROM books;

SELECT AVG(total_copies) 
FROM (
    SELECT genre_id, SUM(total_copies) as total_copies 
    FROM books 
    GROUP BY genre_id
) AS genre_totals;

SELECT b1.title, b1.total_copies
FROM books b1
WHERE b1.total_copies > (
    SELECT AVG(b2.total_copies) 
    FROM books b2 
    WHERE b2.genre_id = b1.genre_id
);