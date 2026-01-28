INSERT INTO categories (name, description) VALUES 
('Фантастика', 'Книги про майбутнє, космос та технології'),
('Наукова література', 'Підручники, монографії, дослідження'),
('Класика', 'Перевірені часом шедеври світової літератури');

INSERT INTO books (title, author, price, published_year, category_id) VALUES 
('Дюна', 'Френк Герберт', 450.00, 1965, 1),
('Короткий курс історії часу', 'Стівен Гокінг', 380.00, 1988, 2),
('Кобзар', 'Тарас Шевченко', 299.90, 1840, 3),
('1984', 'Джордж Орвелл', 320.50, 1949, 1);

INSERT INTO sales (book_id, total_price) VALUES 
(1, 450.00), 
(3, 299.90); 

INSERT INTO sales (book_id, quantity, total_price) VALUES 
(4, 2, 641.00);