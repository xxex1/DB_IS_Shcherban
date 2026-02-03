SELECT COUNT(*) AS total_books_titles FROM books;

SELECT SUM(total_copies) AS total_physical_copies FROM books;

SELECT AVG(published_year) AS average_publish_year FROM books;

SELECT MIN(published_year) AS oldest_book_year FROM books;

SELECT MAX(loan_date) AS last_loan_date FROM loans;