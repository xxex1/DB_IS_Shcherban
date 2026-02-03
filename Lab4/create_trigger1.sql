CREATE OR REPLACE FUNCTION log_loans_changes() 
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO loans_audit_log(loan_id, operation_type, new_data)
        VALUES (NEW.id, 'INSERT', row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO loans_audit_log(loan_id, operation_type, old_data, new_data)
        VALUES (NEW.id, 'UPDATE', row_to_json(OLD), row_to_json(NEW));
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO loans_audit_log(loan_id, operation_type, old_data)
        VALUES (OLD.id, 'DELETE', row_to_json(OLD));
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_loans_audit
AFTER INSERT OR UPDATE OR DELETE ON loans
FOR EACH ROW EXECUTE FUNCTION log_loans_changes();