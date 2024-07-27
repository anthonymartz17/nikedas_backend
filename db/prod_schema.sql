DROP DATABASE IF EXISTS nikedas_prod;
CREATE DATABASE nikedas_prod;

\c nikedas_prod;

CREATE TABLE
  users
  (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(25)
  );

CREATE TABLE shoes (
    id SERIAL PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(100),
    size DECIMAL(3, 1),
    product_number VARCHAR(50),
    sku INT,
    color VARCHAR(100),
    category VARCHAR(50),
    primary_img TEXT,
    secondary_img TEXT[],
    gender VARCHAR(10),
    price DECIMAL(10, 2),
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    seller_id INT REFERENCES users(id)
);

-- CREATE TABLE
--   favorites
--   (
--     id SERIAL,
--     user_shoe_favorite TEXT PRIMARY KEY,
--     user_id INT REFERENCES users(id),
--     shoe_id INT REFERENCES shoes(id)
--   );