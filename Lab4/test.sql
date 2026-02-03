SELECT id, title, available_copies FROM books WHERE id = 2;

INSERT INTO loans (book_id, reader_id, loan_date, due_date)
VALUES (2, 1, CURRENT_DATE, CURRENT_DATE + 14);

SELECT id, title, available_copies FROM books WHERE id = 2;


SELECT * FROM loans_audit_log ORDER BY log_id DESC;

DO $$ 
DECLARE last_loan_id INT;
BEGIN
    SELECT MAX(id) INTO last_loan_id FROM loans;

    UPDATE loans 
    SET return_date = due_date + 5 
    WHERE id = last_loan_id;
END $$;

SELECT id, title, available_copies FROM books WHERE id = 2;

SELECT id, calculate_fine(id) FROM loans WHERE id = (SELECT MAX(id) FROM loans);