SELECT title, author_id, published_year,
       ROW_NUMBER() OVER (PARTITION BY author_id ORDER BY published_year) as book_seq
FROM books;

SELECT title, available_copies,
       RANK() OVER (ORDER BY available_copies DESC) as rank
FROM books;

SELECT title, published_year,
       DENSE_RANK() OVER (ORDER BY published_year DESC) as year_rank
FROM books;

SELECT reader_id, loan_date,
       LAG(loan_date, 1) OVER (PARTITION BY reader_id ORDER BY loan_date) as prev_loan_date
FROM loans;

SELECT reader_id, loan_date,
       LEAD(loan_date, 1) OVER (PARTITION BY reader_id ORDER BY loan_date) as next_loan_date
FROM loans;

SELECT loan_date, COUNT(*) as daily_loans,
       SUM(COUNT(*)) OVER (ORDER BY loan_date) as running_total
FROM loans
GROUP BY loan_date;

SELECT title, genre_id, total_copies,
       AVG(total_copies) OVER (PARTITION BY genre_id) as genre_avg_copies
FROM books;