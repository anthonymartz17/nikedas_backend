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
  (
    brand, model, size, product_number, sku, color, category, primary_img, secondary_img, gender, price, description, created_at, updated_at, deleted_at
  ) 
VALUES
  ('Nike', 'Air Jordan 1 low', 9, '53558161', 1001, 'Red/Black', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/53558161?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 115, 'Classic basketball shoes.', '2023-07-13 14:23:15', '2023-07-16 10:15:42', NULL),

  ('Nike', 'Air Jordan 1 low', 10, '53558161', 1001, 'Black/Yellow', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/53558072?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 115, 'Classic basketball shoes.', '2023-07-13 14:23:15', '2023-07-16 10:15:42', NULL),

  ('Nike', 'Air Jordan 1 low', 9.5, '53558161', 1001, 'White/Black', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/53558132?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 115, 'Classic basketball shoes.', '2023-07-13 14:23:15', '2023-07-16 10:15:42', NULL),

  ('Nike', 'Jordan AJ 1 Mid SE', 7, 'M9652001', 1002, 'Grey/White/Black', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/B9911001?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 150.0, 'Classic basketball shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL),

  ('Nike', 'Jordan AJ 1 Mid SE', 8, 'M9652001', 1002, 'Black/Grey/White', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/M9652001?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 150.0, 'Classic basketball shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL),

  ('Nike', 'Air Max 270', 7, 'H6789006', 1002, 'Black/Black/Black', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/H6789006_a1?wid=581&hei=581&fmt=png-alpha', 
  '{}', 'women', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL),

  ('Nike', 'Air Max 270', 6, 'H6789006', 1002, 'Racer Blue/Hyper Pink/Bright Crimson', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/Z4407600_a1?wid=581&hei=581&fmt=png-alpha', 
  ARRAY['https://images.footlocker.com/is/image/EBFL2/Z4407600_a1?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/H6789006_a2?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/H6789006_a3?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/H6789006_a4?wid=581&hei=581&fmt=png-alpha'], 
  'women', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL),

  ('Nike', 'Air Max Plus', 6, 'D3670001', 1002, 'Viotech/White/Black', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/X8954001_a1?wid=581&hei=581&fmt=png-alpha', 
  ARRAY['https://images.footlocker.com/is/image/EBFL2/X8954001_a1?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/X8954001_a2?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/X8954001_a3?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/X8954001_a4?wid=581&hei=581&fmt=png-alpha'], 
  'women', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL),

  ('Nike', 'Air Max Plus', 7, 'D3670001', 1002, 'Viotech/White/Black', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/D3670001_a1?wid=581&hei=581&fmt=png-alpha', 
  ARRAY['https://images.footlocker.com/is/image/EBFL2/D3670001_a1?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/D3670001_a2?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/D3670001_a3?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/D3670001_a4?wid=581&hei=581&fmt=png-alpha'], 
  'women', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL),

  ('Adidas', 'Ultraboost 1.0 DNA', 10, 'HQ4199', 1003, 'Grey', 'running', 
  'https://images.footlocker.com/is/image/EBFL2/HQ4199_a1?wid=581&hei=581&fmt=png-alpha', 
  ARRAY['https://images.footlocker.com/is/image/EBFL2/HQ4199_a1?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/HQ4199_a2?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/HQ4199_a4?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/HQ4199_a5?wid=581&hei=581&fmt=png-alpha'], 
  'men', 180.0, 'Comfortable running shoes.', '2023-07-15 09:12:33', '2023-07-18 13:27:51', NULL),

  ('Nike', 'Jordan Air Jordan 4 Retro Remastered', 4, 'Q8213103', 1003, 'White', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/Q8213103_01?wid=581&hei=581&fmt=png-alpha', 
  ARRAY['https://images.footlocker.com/is/image/EBFL2/Q8213103_01?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/Q8213103_02?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/Q8213103_03?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/Q8213103_04?wid=581&hei=581&fmt=png-alpha'], 
  'men', 180.0, 'Comfortable basketball shoes.', '2023-07-15 09:12:33', '2023-07-18 13:27:51', NULL);
