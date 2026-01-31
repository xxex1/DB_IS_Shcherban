-- Даємо Модератору права на читання та зміну даних
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO lib_moderator;
-- Також треба дати права на використання послідовностей (для id SERIAL)
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO lib_moderator;

-- Даємо Читачу права тільки на перегляд (SELECT)
GRANT SELECT ON ALL TABLES IN SCHEMA public TO lib_reader;