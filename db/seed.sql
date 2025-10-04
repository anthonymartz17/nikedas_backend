\c nikedas_db;

-- SEED: CATEGORIES

INSERT INTO categories (id, name) VALUES
(4, 'running'),
(5, 'Athletic')
ON CONFLICT (id) DO NOTHING;


-- SEED: AUDIENCES

INSERT INTO audiences (id, name) VALUES
(4, 'Little Kid')
ON CONFLICT (id) DO NOTHING;


-- SEED: PRODUCTS (insert first without default_variant_id)

INSERT INTO products (id, product_number, brand, name, description, price, category_id, audience_id,default_variant_id, created_at, updated_at)
VALUES
(1, '1000', 'Nike', 'Court Borough Recraft Low Top',
 'Court Borough Recraft Low Top Sneaker', 80.00, 4, 4,101, '2023-07-13 15:22:35', '2023-07-18 12:47:18'),
(2, '10001', 'New Balance', 'Slip On Retro',
 'Kids'' 237 Slip On Retro Sneaker Toddler', 85.00, 5, 4,101, '2023-07-13 15:22:35', '2023-07-18 12:47:18'),
(3, '10002', 'Adidas', 'X_PLR Cloud Foam Slip on',
 'Kids'' X_PLR Cloud Foam Slip on Shoe Little Kid', 45.00, 5, 4,101, '2023-07-13 15:22:35', '2023-07-18 12:47:18')
ON CONFLICT (id) DO NOTHING;


-- SEED: VARIANTS

INSERT INTO variants (id, product_id, color, total_stock) VALUES
-- Product 1: Nike
(101, 1, 'Black/White', 7),
(102, 1, 'White/Grey/Blue', 4),
(103, 1, 'White/Grey/Blue', 4),

-- Product 2: New Balance
(201, 2, 'Red/White', 7),
(202, 2, 'Navy/White', 4),
(203, 2, 'Turtledove/Rose', 4),

-- Product 3: Adidas
(301, 3, 'Halo Blue/Silver', 7),
(302, 3, 'Red/Black', 4),
(303, 3, 'Grey/Pink/Silver', 4)
ON CONFLICT (id) DO NOTHING;


-- SEED: VARIANT SIZES
INSERT INTO variant_sizes (variant_id, size, stock) VALUES
-- Nike variants
(101, 8, 5), (101, 9, 2),
(102, 8, 3), (102, 9, 1),
(103, 8, 3), (103, 9, 1),

-- New Balance variants
(201, 8, 5), (201, 9, 2),
(202, 8, 3), (202, 9, 1),
(203, 8, 3), (203, 9, 1),

-- Adidas variants
(301, 8, 5), (301, 9, 2),
(302, 8, 3), (302, 9, 1),
(303, 8, 3), (303, 9, 1);


-- SEED: VARIANT IMAGES
INSERT INTO variant_images (variant_id, url, is_main) VALUES
-- Nike 101
(101, 'https://www.famousfootwear.com/blob/product-images/20000/46/37/2/46372_right_feed1000.jpg', TRUE),
(101, 'https://www.famousfootwear.com/blob/product-images/20000/46/37/2/46372_left_feed1000.jpg', FALSE),
(101, 'https://www.famousfootwear.com/blob/product-images/20000/46/37/2/46372_pair_feed1000.jpg', FALSE),
(101, 'https://www.famousfootwear.com/blob/product-images/20000/46/37/2/46372_top_feed1000.jpg', FALSE),
(101, 'https://www.famousfootwear.com/blob/product-images/20000/46/37/2/46372_back_feed1000.jpg', FALSE),
(101, 'https://www.famousfootwear.com/blob/product-images/20000/46/37/2/46372_bottom_feed1000.jpg', FALSE),

-- Nike 102
(102, 'https://www.famousfootwear.com/blob/product-images/20000/43/06/0/43060_right_feed1000.jpg', TRUE),
(102, 'https://www.famousfootwear.com/blob/product-images/20000/43/06/0/43060_left_feed1000.jpg', FALSE),
(102, 'https://www.famousfootwear.com/blob/product-images/20000/43/06/0/43060_pair_feed1000.jpg', FALSE),
(102, 'https://www.famousfootwear.com/blob/product-images/20000/43/06/0/43060_top_feed1000.jpg', FALSE),
(102, 'https://www.famousfootwear.com/blob/product-images/20000/43/06/0/43060_back_feed1000.jpg', FALSE),
(102, 'https://www.famousfootwear.com/blob/product-images/20000/43/06/0/43060_bottom_feed1000.jpg', FALSE),

-- Nike 103
(103, 'https://www.famousfootwear.com/blob/product-images/20000/45/01/8/45018_right_feed1000.jpg', TRUE),
(103, 'https://www.famousfootwear.com/blob/product-images/20000/45/01/8/45018_left_feed1000.jpg', FALSE),
(103, 'https://www.famousfootwear.com/blob/product-images/20000/45/01/8/45018_pair_feed1000.jpg', FALSE),
(103, 'https://www.famousfootwear.com/blob/product-images/20000/45/01/8/45018_top_feed1000.jpg', FALSE),
(103, 'https://www.famousfootwear.com/blob/product-images/20000/45/01/8/45018_back_feed1000.jpg', FALSE),

-- New Balance 201
(201, 'https://www.famousfootwear.com/blob/product-images/20000/73/20/8/73208_right_feed1000.jpg', TRUE),
(201, 'https://www.famousfootwear.com/blob/product-images/20000/73/20/8/73208_left_feed1000.jpg', FALSE),
(201, 'https://www.famousfootwear.com/blob/product-images/20000/73/20/8/73208_pair_feed1000.jpg', FALSE),
(201, 'https://www.famousfootwear.com/blob/product-images/20000/73/20/8/73208_top_feed1000.jpg', FALSE),
(201, 'https://www.famousfootwear.com/blob/product-images/20000/73/20/8/73208_back_feed1000.jpg', FALSE),
(201, 'https://www.famousfootwear.com/blob/product-images/20000/73/20/8/73208_bottom_feed1000.jpg', FALSE),

-- New Balance 202
(202, 'https://www.famousfootwear.com/blob/product-images/20000/71/26/9/71269_right_feed1000.jpg', TRUE),
(202, 'https://www.famousfootwear.com/blob/product-images/20000/71/26/9/71269_left_feed1000.jpg', FALSE),
(202, 'https://www.famousfootwear.com/blob/product-images/20000/71/26/9/71269_pair_feed1000.jpg', FALSE),
(202, 'https://www.famousfootwear.com/blob/product-images/20000/71/26/9/71269_top_feed1000.jpg', FALSE),
(202, 'https://www.famousfootwear.com/blob/product-images/20000/71/26/9/71269_back_feed1000.jpg', FALSE),
(202, 'https://www.famousfootwear.com/blob/product-images/20000/71/26/9/71269_bottom_feed1000.jpg', FALSE),

-- New Balance 203
(203, 'https://www.famousfootwear.com/blob/product-images/20000/42/38/7/42387_right_feed1000.jpg', TRUE),
(203, 'https://www.famousfootwear.com/blob/product-images/20000/42/38/7/42387_left_feed1000.jpg', FALSE),
(203, 'https://www.famousfootwear.com/blob/product-images/20000/42/38/7/42387_pair_feed1000.jpg', FALSE),
(203, 'https://www.famousfootwear.com/blob/product-images/20000/42/38/7/42387_top_feed1000.jpg', FALSE),
(203, 'https://www.famousfootwear.com/blob/product-images/20000/45/01/8/45018_back_feed1000.jpg', FALSE),
(203, 'https://www.famousfootwear.com/blob/product-images/20000/42/38/7/42387_bottom_feed1000.jpg', FALSE),

-- Adidas 301
(301, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/8/70758_right_feed1000.jpg', TRUE),
(301, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/8/70758_left_feed1000.jpg', FALSE),
(301, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/8/70758_pair_feed1000.jpg', FALSE),
(301, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/8/70758_top_feed1000.jpg', FALSE),
(301, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/8/70758_back_feed1000.jpg', FALSE),
(301, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/8/70758_bottom_feed1000.jpg', FALSE),

-- Adidas 302
(302, 'https://www.famousfootwear.com/blob/product-images/20000/39/76/0/39760_right_feed1000.jpg', TRUE),
(302, 'https://www.famousfootwear.com/blob/product-images/20000/39/76/0/39760_left_feed1000.jpg', FALSE),
(302, 'https://www.famousfootwear.com/blob/product-images/20000/39/76/0/39760_pair_feed1000.jpg', FALSE),
(302, 'https://www.famousfootwear.com/blob/product-images/20000/39/76/0/39760_top_feed1000.jpg', FALSE),
(302, 'https://www.famousfootwear.com/blob/product-images/20000/39/76/0/39760_back_feed1000.jpg', FALSE),
(302, 'https://www.famousfootwear.com/blob/product-images/20000/39/76/0/39760_bottom_feed1000.jpg', FALSE),

-- Adidas 303
(303, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/6/70756_right_feed1000.jpg', TRUE),
(303, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/6/70756_left_feed1000.jpg', FALSE),
(303, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/6/70756_pair_feed1000.jpg', FALSE),
(303, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/6/70756_top_feed1000.jpg', FALSE),
(303, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/6/70756_back_feed1000.jpg', FALSE),
(303, 'https://www.famousfootwear.com/blob/product-images/20000/70/75/6/70756_bottom_feed1000.jpg', FALSE);


-- UPDATE PRODUCTS WITH DEFAULT VARIANTS
UPDATE products SET default_variant_id = 101 WHERE id = 1;
UPDATE products SET default_variant_id = 201 WHERE id = 2;
UPDATE products SET default_variant_id = 301 WHERE id = 3;
