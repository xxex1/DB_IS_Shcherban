CREATE TYPE reader_status_enum AS ENUM ('active', 'warning', 'blocked');

ALTER TABLE readers 
ADD COLUMN status reader_status_enum DEFAULT 'active';

UPDATE readers SET status = 'warning' WHERE id = 1;

SELECT full_name, status FROM readers;