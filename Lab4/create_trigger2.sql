CREATE OR REPLACE FUNCTION update_book_availability() 
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE books 
        SET available_copies = available_copies - 1
        WHERE id = NEW.book_id;
        RETURN NEW;

    ELSIF (TG_OP = 'UPDATE' AND OLD.return_date IS NULL AND NEW.return_date IS NOT NULL) THEN
        UPDATE books 
        SET available_copies = available_copies + 1
        WHERE id = NEW.book_id;
        RETURN NEW;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_availability
AFTER INSERT OR UPDATE ON loans
FOR EACH ROW EXECUTE FUNCTION update_book_availability();