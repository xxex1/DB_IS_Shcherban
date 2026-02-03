WITH FantasyBooks AS (
    SELECT b.title, b.author_id 
    FROM books b
    JOIN genres g ON b.genre_id = g.id
    WHERE g.name = 'Фантастика'
)
SELECT fb.title, a.full_name 
FROM FantasyBooks fb
JOIN authors a ON fb.author_id = a.id;

WITH ReaderStats AS (
    SELECT reader_id, COUNT(*) as books_taken
    FROM loans
    GROUP BY reader_id
)
SELECT r.full_name, rs.books_taken
FROM readers r
JOIN ReaderStats rs ON r.id = rs.reader_id
ORDER BY rs.books_taken DESC;

WITH OverdueLoans AS (
    SELECT reader_id, book_id, due_date
    FROM loans
    WHERE return_date IS NULL AND due_date < CURRENT_DATE
)
SELECT r.full_name, b.title, ol.due_date
FROM OverdueLoans ol
JOIN readers r ON ol.reader_id = r.id
JOIN books b ON ol.book_id = b.id;

WITH BookCount AS (SELECT COUNT(*) as cnt FROM books),
     AuthorCount AS (SELECT COUNT(*) as cnt FROM authors)
SELECT bc.cnt as total_books, ac.cnt as total_authors
FROM BookCount bc, AuthorCount ac;

WITH LoanDurations AS (
    SELECT return_date - loan_date AS days_held
    FROM loans
    WHERE return_date IS NOT NULL
)
SELECT AVG(days_held) FROM LoanDurations;