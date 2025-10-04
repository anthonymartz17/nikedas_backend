\c nikedas_prod;

-- Users
INSERT INTO users (uid, first_name, last_name, email, phone_number, is_active, role)
VALUES
('1','John','Doe','john.doe@example.com','123-456-7890', TRUE,'customer'),
('2','Jane','Smith','jane.smith@example.com','234-567-8901', TRUE,'customer'),
('3','Michael','Johnson','michael.johnson@example.com','345-678-9012', TRUE,'customer'),
('4','Emily','Davis','emily.davis@example.com','456-789-0123', TRUE,'customer'),
('5','Christopher','Brown','christopher.brown@example.com','567-890-1234', TRUE,'customer'),
('6','Amanda','Wilson','amanda.wilson@example.com','678-901-2345', TRUE,'customer'),
('7','Joshua','Moore','joshua.moore@example.com','789-012-3456', TRUE,'customer'),
('8','Jessica','Taylor','jessica.taylor@example.com','890-123-4567', TRUE,'customer'),
('9','Matthew','Anderson','matthew.anderson@example.com','901-234-5678', TRUE,'customer'),
('10','Sarah','Thomas','sarah.thomas@example.com','012-345-6789', TRUE,'customer');

-- Brands
INSERT INTO brands (name)
VALUES ('Nike'), ('Adidas');

-- Audiences
INSERT INTO audiences (name)
VALUES ('Men'), ('Women'), ('Kids'), ('Little Kids'), ('Youth');

-- Categories
INSERT INTO categories (name)
VALUES ('Basketball'), ('Running');

-- Colors
INSERT INTO colors (name)
VALUES
('Red/Black'),('Black/Yellow'),('White/Black'),('Grey/White/Black'),
('Black/Grey/White'),('Black/Black/Black'),('Racer Blue/Hyper Pink/Bright Crimson'),
('Viotech/White/Black'),('Grey'),('White');

-- Sizes
-- Men
INSERT INTO sizes (name, audience_id) VALUES
('4',1),('7',1),('8',1),('9',1),('9.5',1),('10',1);
-- Women
INSERT INTO sizes (name, audience_id) VALUES
('6',2),('7',2),('8',2);

-- Products
INSERT INTO products (brand_id, audience_id, category_id, name, product_number, price, description)
VALUES
-- Nike Air Jordan 1 Low
(1,1,1,'Air Jordan 1 Low','53558161',115.0,'Classic basketball shoes.'),
-- Nike Jordan AJ 1 Mid SE
(1,1,1,'Jordan AJ 1 Mid SE','M9652001',150.0,'Classic basketball shoes.'),
-- Nike Air Max 270
(1,2,2,'Air Max 270','H6789006',150.0,'Classic running shoes.'),
-- Nike Air Max Plus
(1,2,2,'Air Max Plus','D3670001',150.0,'Classic running shoes.'),
-- Adidas Ultraboost 1.0 DNA
(2,1,2,'Ultraboost 1.0 DNA','HQ4199',180.0,'Comfortable running shoes.'),
-- Nike Jordan Air Jordan 4 Retro Remastered
(1,1,1,'Jordan Air Jordan 4 Retro Remastered','Q8213103',180.0,'Comfortable basketball shoes.');

-- Product Variants
-- Air Jordan 1 Low
INSERT INTO product_variants (product_id, color_id, size_id, stock) VALUES
(1,1,4,10), -- Red/Black, size 9
(1,2,6,5),  -- Black/Yellow, size 10
(1,3,5,8);  -- White/Black, size 9.5

-- Jordan AJ 1 Mid SE
INSERT INTO product_variants (product_id, color_id, size_id, stock) VALUES
(2,4,2,7), -- Grey/White/Black, size 7
(2,5,3,3); -- Black/Grey/White, size 8

-- Air Max 270
INSERT INTO product_variants (product_id, color_id, size_id, stock) VALUES
(3,6,1,6), -- Black/Black/Black, size 6
(3,7,2,4); -- Racer Blue/Hyper Pink/Bright Crimson, size 7

-- Air Max Plus
INSERT INTO product_variants (product_id, color_id, size_id, stock) VALUES
(4,8,1,5), -- Viotech/White/Black, size 6
(4,8,2,7); -- Viotech/White/Black, size 7

-- Ultraboost 1.0 DNA
INSERT INTO product_variants (product_id, color_id, size_id, stock) VALUES
(5,9,6,3); -- Grey, size 10

-- Jordan Air Jordan 4 Retro
INSERT INTO product_variants (product_id, color_id, size_id, stock) VALUES
(6,10,4,2); -- White, size 9

-- Product Images (main + extra)
-- Air Jordan 1 Low Red/Black
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(1,'https://images.footlocker.com/is/image/EBFL2/53558161?wid=883&hei=883&fmt=png-alpha',TRUE);

-- Air Jordan 1 Low Black/Yellow
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(2,'https://images.footlocker.com/is/image/EBFL2/53558072?wid=883&hei=883&fmt=png-alpha',TRUE);

-- Air Jordan 1 Low White/Black
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(3,'https://images.footlocker.com/is/image/EBFL2/53558132?wid=883&hei=883&fmt=png-alpha',TRUE);

-- Jordan AJ 1 Mid SE Grey/White/Black
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(4,'https://images.footlocker.com/is/image/EBFL2/B9911001?wid=883&hei=883&fmt=png-alpha',TRUE);

-- Jordan AJ 1 Mid SE Black/Grey/White
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(5,'https://images.footlocker.com/is/image/EBFL2/M9652001?wid=883&hei=883&fmt=png-alpha',TRUE);

-- Air Max 270 Black/Black/Black
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(6,'https://images.footlocker.com/is/image/EBFL2/H6789006_a1?wid=581&hei=581&fmt=png-alpha',TRUE);

-- Air Max 270 Racer Blue/Hyper Pink/Bright Crimson (multiple images)
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(7,'https://images.footlocker.com/is/image/EBFL2/Z4407600_a1?wid=581&hei=581&fmt=png-alpha',TRUE),
(7,'https://images.footlocker.com/is/image/EBFL2/Z4407600_a1?wid=581&hei=581&fmt=png-alpha',FALSE),
(7,'https://images.footlocker.com/is/image/EBFL2/H6789006_a2?wid=581&hei=581&fmt=png-alpha',FALSE),
(7,'https://images.footlocker.com/is/image/EBFL2/H6789006_a3?wid=581&hei=581&fmt=png-alpha',FALSE),
(7,'https://images.footlocker.com/is/image/EBFL2/H6789006_a4?wid=581&hei=581&fmt=png-alpha',FALSE);

-- Air Max Plus Viotech/White/Black
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(8,'https://images.footlocker.com/is/image/EBFL2/X8954001_a1?wid=581&hei=581&fmt=png-alpha',TRUE),
(8,'https://images.footlocker.com/is/image/EBFL2/X8954001_a2?wid=581&hei=581&fmt=png-alpha',FALSE),
(8,'https://images.footlocker.com/is/image/EBFL2/X8954001_a3?wid=581&hei=581&fmt=png-alpha',FALSE),
(8,'https://images.footlocker.com/is/image/EBFL2/X8954001_a4?wid=581&hei=581&fmt=png-alpha',FALSE);

-- Ultraboost 1.0 DNA Grey
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(9,'https://images.footlocker.com/is/image/EBFL2/HQ4199_a1?wid=581&hei=581&fmt=png-alpha',TRUE),
(9,'https://images.footlocker.com/is/image/EBFL2/HQ4199_a2?wid=581&hei=581&fmt=png-alpha',FALSE),
(9,'https://images.footlocker.com/is/image/EBFL2/HQ4199_a4?wid=581&hei=581&fmt=png-alpha',FALSE),
(9,'https://images.footlocker.com/is/image/EBFL2/HQ4199_a5?wid=581&hei=581&fmt=png-alpha',FALSE);

-- Jordan Air Jordan 4 Retro White
INSERT INTO product_images (variant_id, image_url, is_main) VALUES
(10,'https://images.footlocker.com/is/image/EBFL2/Q8213103_01?wid=581&hei=581&fmt=png-alpha',TRUE),
(10,'https://images.footlocker.com/is/image/EBFL2/Q8213103_02?wid=581&hei=581&fmt=png-alpha',FALSE),
(10,'https://images.footlocker.com/is/image/EBFL2/Q8213103_03?wid=581&hei=581&fmt=png-alpha',FALSE),
(10,'https://images.footlocker.com/is/image/EBFL2/Q8213103_04?wid=581&hei=581&fmt=png-alpha',FALSE);
