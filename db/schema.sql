DROP DATABASE IF EXISTS nikedas_db;
CREATE DATABASE nikedas_db;

\c nikedas_db;

CREATE TABLE
  shoes
  (
    id SERIAL PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    size INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    gender VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    img_url VARCHAR(100),
    seller_id INT NOT NULL
  );

CREATE TABLE
  users
  (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(25)
  );

  -- CREATE TABLE