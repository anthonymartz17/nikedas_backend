\c nikedas_db;

INSERT INTO
  users
  (first_name, last_name, email, phone_number)
VALUES
  ('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
  ('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901'),
  ('Michael', 'Johnson', 'michael.johnson@example.com', '345-678-9012'),
  ('Emily', 'Davis', 'emily.davis@example.com', '456-789-0123'),
  ('Christopher', 'Brown', 'christopher.brown@example.com', '567-890-1234'),
  ('Amanda', 'Wilson', 'amanda.wilson@example.com', '678-901-2345'),
  ('Joshua', 'Moore', 'joshua.moore@example.com', '789-012-3456'),
  ('Jessica', 'Taylor', 'jessica.taylor@example.com', '890-123-4567'),
  ('Matthew', 'Anderson', 'matthew.anderson@example.com', '901-234-5678'),
  ('Sarah', 'Thomas', 'sarah.thomas@example.com', '012-345-6789');

INSERT INTO
  shoes
  (brand, model, size, sku, colorway, category, gender, price, description, created_at, updated_at, img_url, seller_id)
VALUES
  ('Nike', 'Air Jordan 1', 9, 1001, 'Red/Black', 'basketball', 'male', 150.00, 'Classic basketball shoes.', '2023-07-13 14:23:15', '2023-07-16 10:15:42', NULL, 2),
  ('Nike', 'Air Jordan 1', 7, 1002, 'Blue/White', 'basketball', 'female', 150.00, 'Classic basketball shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL, 4),
  ('Adidas', 'UltraBoost', 10, 1003, 'Black', 'running', 'female', 180.00, 'Comfortable running shoes.', '2023-07-15 09:12:33', '2023-07-18 13:27:51', NULL, 4),
  ('Adidas', 'UltraBoost', 8, 1004, 'White/Silver', 'running', 'male', 180.00, 'Comfortable running shoes.', '2023-07-14 11:45:22', '2023-07-17 08:54:36', NULL, 7),
  ('Puma', 'Suede Classic', 9, 1005, 'Green', 'casual', 'male', 70.00, 'Stylish casual shoes.', '2023-07-13 10:34:12', '2023-07-18 12:20:48', NULL, 3),
  ('Puma', 'Suede Classic', 7, 1006, 'Yellow/Black', 'casual', 'female', 70.00, 'Stylish casual shoes.', '2023-07-16 11:34:12', '2023-07-18 12:20:48', NULL, 3),
  ('Reebok', 'Classic Leather', 8, 1007, 'Brown/White', 'casual', 'male', 75.00, 'Timeless casual shoes.', '2023-07-14 16:45:22', '2023-07-17 08:54:36', NULL, 7),
  ('Reebok', 'Classic Leather', 6, 1008, 'Pink/Gray', 'casual', 'female', 75.00, 'Timeless casual shoes.', '2023-07-16 11:34:12', '2023-07-18 12:20:48', NULL, 3),
  ('Under Armour', 'Curry 7', 11, 1009, 'Black/Silver', 'basketball', 'male', 130.00, 'Performance basketball shoes.', '2023-07-13 17:23:55', '2023-07-17 14:45:32', NULL, 9),
  ('New Balance', '990v5', 9, 1010, 'Gray/Black', 'running', 'female', 175.00, 'Durable running shoes.', '2023-07-15 10:22:37', '2023-07-19 09:43:11', NULL, 7),
  ('Asics', 'Gel-Kayano 26', 10, 1011, 'Black/White', 'running', 'male', 160.00, 'Supportive running shoes.', '2023-07-14 15:11:45', '2023-07-18 11:58:29', NULL, 3),
  ('Vans', 'Old Skool', 8, 1012, 'Black/White', 'casual', 'female', 60.00, 'Classic skate shoes.', '2023-07-13 13:29:40', '2023-07-16 13:45:50', NULL, 1),
  ('Converse', 'Chuck Taylor All Star', 7, 1013, 'White/Black', 'casual', 'male', 55.00, 'Iconic casual shoes.', '2023-07-15 08:16:54', '2023-07-19 10:24:31', NULL, 9),
  ('Nike', 'Air Max 97', 9, 1014, 'Black/Gold', 'running', 'female', 170.00, 'Comfortable running shoes.', '2023-07-13 12:21:35', '2023-07-16 15:32:19', NULL, 10),
  ('Adidas', 'NMD_R1', 10, 1015, 'White/Black', 'casual', 'male', 140.00, 'Modern casual shoes.', '2023-07-16 14:55:41', '2023-07-18 16:11:23', NULL, 2),
  ('Puma', 'RS-X3', 8, 1016, 'Blue/Yellow', 'casual', 'female', 110.00, 'Trendy casual shoes.', '2023-07-14 09:28:13', '2023-07-17 11:35:44', NULL, 7),
  ('Reebok', 'Nano X', 7, 1017, 'Gray/Black', 'running', 'male', 130.00, 'Versatile training shoes.', '2023-07-15 17:21:09', '2023-07-19 12:50:17', NULL, 4),
  ('Under Armour', 'HOVR Phantom', 11, 1018, 'White/Black', 'running', 'female', 150.00, 'Responsive running shoes.', '2023-07-13 15:40:12', '2023-07-17 09:38:28', NULL, 9),
  ('New Balance', '574', 9, 1019, 'Black/White', 'casual', 'male', 80.00, 'Classic casual shoes.', '2023-07-16 18:30:25', '2023-07-18 14:42:50', NULL, 2),
  ('Asics', 'Gel-Nimbus 22', 10, 1020, 'White/Blue', 'running', 'female', 150.00, 'Cushioned running shoes.', '2023-07-14 13:18:45', '2023-07-18 15:29:11', NULL, 3),
  ('Vans', 'Era', 8, 1021, 'Black/White', 'casual', 'male', 50.00, 'Simple skate shoes.', '2023-07-13 16:25:20', '2023-07-17 13:40:22', NULL, 6),
  ('Converse', 'One Star', 7, 1022, 'White/Black', 'casual', 'female', 65.00, 'Casual everyday shoes.', '2023-07-15 12:32:15', '2023-07-19 11:24:44', NULL, 1),
  ('Nike', 'Kobe 5 Protro', 9, 1023, 'Purple/Gold', 'basketball', 'male', 180.00, 'Elite basketball shoes.', '2023-07-13 14:45:33', '2023-07-16 14:22:19', NULL, 4),
  ('Adidas', 'Superstar', 10, 1024, 'White/Black', 'casual', 'female', 85.00, 'Timeless casual shoes.', '2023-07-16 10:28:37', '2023-07-18 17:12:56', NULL, 7),
  ('Puma', 'Clyde Court', 8, 1025, 'Orange/Black', 'basketball', 'male', 120.00, 'Performance basketball shoes.', '2023-07-14 17:22:09', '2023-07-17 12:39:51', NULL, 9),
  ('Reebok', 'Club C 85', 7, 1026, 'White/Green', 'casual', 'female', 70.00, 'Classic casual shoes.', '2023-07-15 09:44:12', '2023-07-19 09:56:33', NULL, 3),
  ('Under Armour', 'Project Rock 3', 11, 1027, 'Black/Gray', 'running', 'male', 140.00, 'Durable training shoes.', '2023-07-13 11:39:22', '2023-07-17 11:45:57', NULL, 2),
  ('New Balance', 'Fresh Foam 1080v10', 9, 1028, 'White/Blue', 'running', 'female', 150.00, 'Comfortable running shoes.', '2023-07-16 14:23:29', '2023-07-18 13:58:20', NULL, 7),
  ('Asics', 'Dynablast', 10, 1029, 'Blue/Black', 'running', 'male', 120.00, 'Lightweight running shoes.', '2023-07-14 18:47:31', '2023-07-18 16:40:12', NULL, 3),
  ('Vans', 'Authentic', 8, 1030, 'Black/White', 'casual', 'female', 55.00, 'Classic skate shoes.', '2023-07-13 10:29:16', '2023-07-16 12:38:45', NULL, 1),
  ('Converse', 'Jack Purcell', 7, 1031, 'White/Black', 'casual', 'male', 70.00, 'Stylish casual shoes.', '2023-07-15 13:45:51', '2023-07-19 14:32:28', NULL, 4),
  ('Nike', 'LeBron 18', 9, 1032, 'Red/Black', 'basketball', 'male', 200.00, 'High-performance basketball shoes.', '2023-07-13 09:37:44', '2023-07-16 11:27:31', NULL, 9),
  ('Adidas', 'Stan Smith', 10, 1033, 'White/Green', 'casual', 'female', 90.00, 'Iconic casual shoes.', '2023-07-16 16:11:35', '2023-07-18 15:17:50', NULL, 2),
  ('Puma', 'Future Rider', 8, 1034, 'White/Blue', 'casual', 'male', 100.00, 'Retro casual shoes.', '2023-07-14 19:21:18', '2023-07-17 10:30:56', NULL, 1);

INSERT INTO
  favorites
  (user_id, shoe_id)
VALUES
  (1, 1),
  (1, 5),
  (2, 10),
  (2, 15),
  (2, 20),
  (3, 3),
  (3, 25),
  (4, 8),
  (4, 12),
  (5, 30),
  (6, 2),
  (6, 6),
  (7, 7),
  (7, 18),
  (8, 4),
  (8, 14),
  (9, 11),
  (9, 22),
  (10, 9),
  (10, 13),
  (10, 17);