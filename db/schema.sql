DROP DATABASE IF EXISTS nikedas_db;
CREATE DATABASE nikedas_db;

\c nikedas_db;

-- CATEGORIES
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- AUDIENCES
CREATE TABLE audiences (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- PRODUCTS
CREATE TABLE products (
    id BIGINT PRIMARY KEY,
    product_number VARCHAR(50) NOT NULL UNIQUE,
    brand VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    category_id INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    audience_id INT NOT NULL REFERENCES audiences(id) ON DELETE CASCADE,
    default_variant_id BIGINT,  -- FK to variants.id (set later since variants are created after products)
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now()
);

-- VARIANTS
CREATE TABLE variants (
    id BIGINT PRIMARY KEY,
    product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    color VARCHAR(150) NOT NULL,
    total_stock INT NOT NULL DEFAULT 0
);

-- VARIANT SIZES
CREATE TABLE variant_sizes (
    id BIGSERIAL PRIMARY KEY,
    variant_id BIGINT NOT NULL REFERENCES variants(id) ON DELETE CASCADE,
    size NUMERIC(5,2) NOT NULL,   -- allows sizes like 8, 9, 8.5
    stock INT NOT NULL DEFAULT 0,
    CONSTRAINT unique_variant_size UNIQUE (variant_id, size)
);

-- VARIANT IMAGES
CREATE TABLE variant_images (
    id BIGSERIAL PRIMARY KEY,
    variant_id BIGINT NOT NULL REFERENCES variants(id) ON DELETE CASCADE,
    url TEXT NOT NULL,
    is_main BOOLEAN DEFAULT FALSE
);

-- -- FOREIGN KEY FIX: default_variant_id in products
-- ALTER TABLE products
-- ADD CONSTRAINT fk_default_variant
-- FOREIGN KEY (default_variant_id) REFERENCES variants(id) ON DELETE SET NULL;

