SELECT full_name, 'Author' as role FROM authors
UNION
SELECT full_name, 'Reader' as role FROM readers;

SELECT id FROM books
UNION ALL
SELECT book_id FROM loans;

SELECT id FROM books
INTERSECT
SELECT book_id FROM loans;

SELECT id FROM books
EXCEPT
SELECT book_id FROM loans;

SELECT title FROM books WHERE published_year < 1900
UNION
SELECT b.title FROM books b JOIN genres g ON b.genre_id = g.id WHERE g.name = 'Програмування';

