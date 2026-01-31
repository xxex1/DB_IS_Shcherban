-- 1. Таблиця авторів
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- 2. Таблиця жанрів
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Таблиця книг
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    published_year INT,
    total_copies INT DEFAULT 1 CHECK (total_copies >= 0),
    available_copies INT DEFAULT 0 CHECK (available_copies >= 0),
    
    -- Зовнішні ключі
    CONSTRAINT fk_author
      FOREIGN KEY(author_id) 
      REFERENCES authors(id)
      ON DELETE CASCADE,
      
    CONSTRAINT fk_genre
      FOREIGN KEY(genre_id) 
      REFERENCES genres(id)
      ON DELETE SET NULL
);

-- 4. Таблиця читачів
CREATE TABLE readers (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    library_card_number VARCHAR(20) NOT NULL UNIQUE,
    joined_date DATE DEFAULT CURRENT_DATE
);

-- 5. Таблиця видач (Loans)
CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    reader_id INT NOT NULL,
    loan_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE, -- NULL, якщо книга ще не повернута
    
    CONSTRAINT fk_book
      FOREIGN KEY(book_id) 
      REFERENCES books(id),
      
    CONSTRAINT fk_reader
      FOREIGN KEY(reader_id) 
      REFERENCES readers(id)
);