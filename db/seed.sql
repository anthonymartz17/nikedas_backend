\c nikedas_db;
INSERT INTO users
  (uid, first_name, last_name, email, phone_number, about_store, is_active,account_type)
VALUES
  ('SWv0QW1pOmWOaSweh8Pm4mbLMUB3', 'Antonio', 'Martinez', 'anthonymartz17@hotmail.com', '123-456-7890', 'Find the dopest kicks in the best condition', true,'seller');


  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB4', 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 'Find the dopest kicks in the best condition', true),
  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB5', 'Michael', 'Johnson', 'michael.johnson@example.com', '345-678-9012', 'Find the dopest kicks in the best condition', true),
  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB6', 'Emily', 'Davis', 'emily.davis@example.com', '456-789-0123', 'Find the dopest kicks in the best condition', true),
  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB7', 'Christopher', 'Brown', 'christopher.brown@example.com', '567-890-1234', 'Find the dopest kicks in the best condition', true),
  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB8', 'Amanda', 'Wilson', 'amanda.wilson@example.com', '678-901-2345', 'Find the dopest kicks in the best condition', true),
  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB9', 'Joshua', 'Moore', 'joshua.moore@example.com', '789-012-3456', 'Find the dopest kicks in the best condition', true),
  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB10', 'Jessica', 'Taylor', 'jessica.taylor@example.com', '890-123-4567', 'Find the dopest kicks in the best condition', true),
  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB11', 'Matthew', 'Anderson', 'matthew.anderson@example.com', '901-234-5678', 'Find the dopest kicks in the best condition', true),
  -- ('SWv0QW1pOmWOaSweh8Pm4mbLMUB12', 'Sarah', 'Thomas', 'sarah.thomas@example.com', '012-345-6789', 'Find the dopest kicks in the best condition', true)



INSERT INTO shoes 
  (
    brand, model, size, product_number, color, category, primary_img, secondary_img, gender, price, description, created_at, updated_at, deleted_at, seller_id
  ) 
VALUES
  ('Nike', 'Air Jordan 1 low', 9, '53558161', 'Red/Black', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/53558161?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 115, 'Classic basketball shoes.', '2023-07-13 14:23:15', '2023-07-16 10:15:42', NULL, 'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Air Jordan 1 low', 10, '53558161', 'Black/Yellow', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/53558072?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 115, 'Classic basketball shoes.', '2023-07-13 14:23:15', '2023-07-16 10:15:42', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Air Jordan 1 low', 9.5, '53558161', 'White/Black', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/53558132?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 115, 'Classic basketball shoes.', '2023-07-13 14:23:15', '2023-07-16 10:15:42', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Jordan AJ 1 Mid SE', 7, 'M9652001', 'Grey/White/Black', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/B9911001?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 150.0, 'Classic basketball shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Jordan AJ 1 Mid SE', 8, 'M9652001', 'Black/Grey/White', 'basketball', 
  'https://images.footlocker.com/is/image/EBFL2/M9652001?wid=883&hei=883&fmt=png-alpha', 
  '{}', 'men', 150.0, 'Classic basketball shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Air Max 270', 7, 'H6789006', 'Black/Black/Black', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/H6789006_a1?wid=581&hei=581&fmt=png-alpha', 
  '{}', 'women', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Air Max 270', 6, 'H6789006','Racer Blue/Hyper Pink/Bright Crimson', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/Z4407600_a1?wid=581&hei=581&fmt=png-alpha', 
  ARRAY['https://images.footlocker.com/is/image/EBFL2/Z4407600_a1?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/H6789006_a2?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/H6789006_a3?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/H6789006_a4?wid=581&hei=581&fmt=png-alpha'], 
  'women', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Air Max Plus', 6, 'D3670001','Viotech/White/Black', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/X8954001_a1?wid=581&hei=581&fmt=png-alpha', 
  ARRAY['https://images.footlocker.com/is/image/EBFL2/X8954001_a1?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/X8954001_a2?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/X8954001_a3?wid=581&hei=581&fmt=png-alpha', 'https://images.footlocker.com/is/image/EBFL2/X8954001_a4?wid=581&hei=581&fmt=png-alpha'], 
  'women', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Air Max Plus', 7, 'D3670001', 'Black/Red/White', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/122101_c?wid=3000&hei=3000&fmt=png-alpha', 
  '{}', 'men', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3'),

  ('Nike', 'Air Max Plus', 7.5, 'D3670001','White/Black/Red', 'Running', 
  'https://images.footlocker.com/is/image/EBFL2/204262_c?wid=3000&hei=3000&fmt=png-alpha', 
  '{}', 'men', 150.0, 'Classic running shoes.', '2023-07-14 09:12:33', '2023-07-18 13:27:51', NULL,'SWv0QW1pOmWOaSweh8Pm4mbLMUB3');




