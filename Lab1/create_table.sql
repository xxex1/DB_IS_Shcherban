CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(155) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    published_year INT,
    category_id INT,
    CONSTRAINT fk_category
      FOREIGN KEY(category_id) 
      REFERENCES categories(category_id)
      ON DELETE SET NULL
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    quantity INT DEFAULT 1 CHECK (quantity > 0),
    sale_date DATE DEFAULT CURRENT_DATE,
    total_price DECIMAL(10, 2), 
    CONSTRAINT fk_book
      FOREIGN KEY(book_id) 
      REFERENCES books(book_id)
      ON DELETE CASCADE
);