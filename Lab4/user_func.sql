CREATE OR REPLACE FUNCTION calculate_fine(loan_id_input INT) 
RETURNS NUMERIC AS $$
DECLARE
    rec_loan RECORD;
    days_overdue INT;
    fine_per_day NUMERIC := 5.00; 
BEGIN
    SELECT * INTO rec_loan FROM loans WHERE id = loan_id_input;

    IF NOT FOUND THEN
        RETURN 0;
    END IF;

    IF rec_loan.return_date IS NOT NULL THEN
        days_overdue := rec_loan.return_date - rec_loan.due_date;
    ELSE
        days_overdue := CURRENT_DATE - rec_loan.due_date;
    END IF;

    IF days_overdue <= 0 THEN
        RETURN 0.00;
    ELSE
        RETURN days_overdue * fine_per_day;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT 
    id AS loan_id, 
    due_date, 
    return_date, 
    calculate_fine(id) AS fine_amount 
FROM loans;