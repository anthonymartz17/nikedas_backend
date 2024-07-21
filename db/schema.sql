DROP DATABASE IF EXISTS nikedas_db;
CREATE DATABASE nikedas_db;

\c nikedas_db;

CREATE TABLE
  users
  (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(25)
  );

CREATE TABLE
  shoes
  (
    id SERIAL PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    size INT NOT NULL,
    sku INT NOT NULL,
    colorway VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    gender VARCHAR(100) NOT NULL,
    price DECIMAL(7,2) NOT NULL,
    description TEXT NOT NULL,
    created_at TEXT,
    updated_at TEXT,
    img_url VARCHAR(100),
    seller_id INT REFERENCES users(id)
  );

CREATE TABLE
  favorites
  (
    id SERIAL PRIMARY KEY,
    -- user_shoe_favorite CONCAT(user_id,'-',shoe_id),
    user_id INT REFERENCES users(id),
    shoe_id INT REFERENCES shoes(id)
  );