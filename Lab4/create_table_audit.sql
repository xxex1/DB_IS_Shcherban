CREATE TABLE loans_audit_log (
    log_id SERIAL PRIMARY KEY,
    loan_id INT,
    operation_type VARCHAR(10), 
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_data TEXT,
    new_data TEXT
);