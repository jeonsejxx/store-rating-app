CREATE DATABASE store_rating_app;
USE store_rating_app;
   
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,  -- store hashed passwords
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    store_id INT NOT NULL,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (store_id) REFERENCES stores(store_id) ON DELETE CASCADE
);
ALTER TABLE stores ADD COLUMN location VARCHAR(255);
-- Users
INSERT INTO users (username, email, password) VALUES
('john_doe', 'john@example.com', 'password123'),
('alice', 'alice@example.com', 'password123');

-- Stores
INSERT INTO stores (store_name, category, description) VALUES
('Pizza Place', 'Food', 'Best pizza in town'),
('Book Haven', 'Bookstore', 'A paradise for book lovers');

-- Ratings
INSERT INTO ratings (user_id, store_id, rating, comment) VALUES
(1, 1, 5, 'Amazing pizza!'),
(2, 2, 4, 'Great collection of books');