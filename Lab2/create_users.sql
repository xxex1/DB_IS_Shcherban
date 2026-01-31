-- АДМІНІСТРАТОР: Повний доступ до всього
CREATE USER lib_admin WITH PASSWORD 'admin_secure_pass';
ALTER USER lib_admin WITH SUPERUSER; 

-- МОДЕРАТОР (Бібліотекар): Може додавати книги, читачів, оформлювати видачі
CREATE USER lib_moderator WITH PASSWORD 'lib_staff_pass';
GRANT CONNECT ON DATABASE "LibraryLab2" TO lib_moderator; 
GRANT USAGE ON SCHEMA public TO lib_moderator;

-- ЗВИЧАЙНИЙ КОРИСТУВАЧ (Читач): Може тільки переглядати (шукати) книги
CREATE USER lib_reader WITH PASSWORD 'reader_pass';
GRANT CONNECT ON DATABASE "LibraryLab2" TO lib_reader;
GRANT USAGE ON SCHEMA public TO lib_reader;