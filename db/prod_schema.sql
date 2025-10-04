DROP DATABASE IF EXISTS nikedas_prod;
CREATE DATABASE nikedas_prod;

\c nikedas_prod;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    uid VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(25),
    is_active BOOLEAN,
    role VARCHAR(20) DEFAULT 'customer', -- 'customer', 'admin'
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()

);

CREATE TABLE brands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE audiences (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL -- 'Men','Women','Kids','Little Kids','Youth'
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE colors(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
); 

CREATE TABLE sizes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL, -- e.g. "8", "10.5", "XS", "L"
    audience_id INT REFERENCES audiences(id) ON DELETE CASCADE,
    UNIQUE(name, audience_id) -- same size name can exist in multiple audiences
);


CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    brand_id  INT REFERENCES brands(id) ON DELETE CASCADE,
    audience_id INT REFERENCES audiences(id) ON DELETE CASCADE,
    name VARCHAR(150) NOT NULL,  -- e.g. "Air Zoom Pegasus"
    product_number VARCHAR(50) UNIQUE,  
    category_id INT REFERENCES categories(id) ON DELETE CASCADE,
    price DECIMAL(10, 2),
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    deleted_at TIMESTAMP
);

CREATE TABLE product_variants (
  id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(id) ON DELETE CASCADE,
  color_id INT REFERENCES colors(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(product_id, color_id)
);

CREATE TABLE variant_sizes (
  id SERIAL PRIMARY KEY,
  variant_id INT REFERENCES product_variants(id) ON DELETE CASCADE,
  size_id INT REFERENCES sizes(id) ON DELETE CASCADE,
  stock INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(variant_id, size_id)
);


 CREATE TABLE product_images (
  id SERIAL PRIMARY KEY,
  variant_id INT REFERENCES product_variants(id) ON DELETE CASCADE,
  image_url TEXT NOT NULL,
  is_main BOOLEAN DEFAULT false -- to mark the primary display image
);



-- order_statuses (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(50) UNIQUE NOT NULL
-- );

-- orders (
--   id SERIAL PRIMARY KEY,
--   user_id INT REFERENCES users(id),
--   status_id INT REFERENCES order_statuses(id),
--   total NUMERIC(10,2) NOT NULL,
--   created_at TIMESTAMP DEFAULT NOW()
-- );
