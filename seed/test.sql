DROP DATABASE IF EXISTS fegtable_test;
CREATE DATABASE fegtable_test;

\c fegtable_test

CREATE TABLE feg_types (
  feg_types_id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  slug VARCHAR(25) NOT NULL
);

CREATE TABLE months (
  months_id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  slug VARCHAR(25) NOT NULL
);

CREATE TABLE feggies(
  feggies_id SERIAL PRIMARY KEY,
  name      VARCHAR(25) NOT NULL,
  img_src   VARCHAR(105) NOT NULL, 
  feg_type_id      INTEGER  NOT NULL,
  FOREIGN KEY (feg_type_id) REFERENCES feg_types(feg_types_id)
);

CREATE TABLE coming_in (
  coming_in_id SERIAL PRIMARY KEY,
  feggie_id INTEGER NOT NULL,
  month_id INTEGER NOT NULL, 
  FOREIGN KEY (feggie_id) REFERENCES feggies(feggies_id), 
  FOREIGN KEY (month_id) REFERENCES months(months_id)
);

CREATE TABLE at_best (
  at_best_id SERIAL PRIMARY KEY,
  feggie_id INTEGER NOT NULL,
  month_id INTEGER NOT NULL, 
  FOREIGN KEY (feggie_id) REFERENCES feggies(feggies_id), 
  FOREIGN KEY (month_id) REFERENCES months(months_id)
);


INSERT INTO feg_types (name, slug)
  VALUES ('Vegetable', 'veg'), ('Fruit', 'fruit');

INSERT INTO months(name, slug) 
  VALUES ('January', 'jan'), ('February', 'feb'), ('March', 'mar'), ('April', 'apr'), ('May', 'may'), ('June', 'jun'), ('July', 'jul'), ('August', 'aug'), ('September', 'sept'), ('October', 'oct'), ('November', 'nov'), ('December', 'feb');

INSERT INTO feggies(name, feg_type_id,img_src) VALUES ('aubergine', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('beetroot', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('brussels sprouts', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('carrot', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('cavolo_nero', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('celery', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('courgette', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('fennel_bulb', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('jerusalem_artichoke', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('kohlrabi', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('leek', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('marrow', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('parsnip', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('pepper', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('pumpkin', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('radicchio', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('runner_bean', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('spinach', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('spring_greens', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('sweet_potato', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('swiss_chard', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('watercress', 1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('apricot', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('blackberry', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('bramley_apple', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('cherry', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('cranberry',  2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('date', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('gooseberry', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('lemon', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('orange', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('peach', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('plum', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('quince', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('redcurrant', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('strawberry', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('watermelon', 2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg');

INSERT INTO coming_in(feggie_id, month_id) 
  VALUES (1, 5), (4, 5), (5, 6), (6, 7), (9, 10), (10, 7), (12, 7), (14, 2), (15, 9), (18, 3), (19, 3), (22, 3), (24, 7), (25, 11), (26, 6), (28, 10), (29, 5), (32, 7), (33, 8), (34, 9), (35, 6), (36, 5), (37, 6);

INSERT INTO at_best(feggie_id, month_id) 
  VALUES (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (2, 1), (2, 7), (2, 8), (2, 9), (2, 10), (2, 11), (2, 12), (3, 1), (3, 2), (3, 3), (3, 10), (3, 11), (3, 12), (4, 6), (4, 7), (4, 8), (4, 9), (5, 7), (5, 8), (5, 9), (5, 10), (6, 1), (6, 2), (6, 8), (6, 9), (6, 10), (6, 11), (6, 12), (7, 6), (7, 7), (7, 8), (7, 9), (8, 6), (8, 7), (8, 8), (8, 9), (9, 1), (9, 2), (9, 3), (9, 11), (9, 12), (10, 8), (10, 9), (10, 10), (10, 11), (11, 1), (11, 2), (11, 3), (11, 9), (11, 10), (11, 11), (11, 12), (12, 8), (12, 9), (13, 1), (13, 2), (13, 3), (13, 9), (13, 10), (13, 11), (13, 12), (14, 3), (14, 4), (14, 5), (14, 6), (14, 7), (14, 8), (14, 9), (14, 10), (15, 10), (15, 11), (15, 12), (16, 1), (16, 2), (16, 3), (16, 4), (16, 5), (16, 6), (16, 7), (16, 8), (16, 9), (16, 10), (16, 11), (16, 12), (17, 6), (17, 7), (17, 8), (17, 9), (17, 10), (17, 11), (18, 4), (18, 5), (18, 6), (18, 7), (18, 8), (18, 9), (19, 4), (19, 5), (19, 6), (20, 1), (20, 2), (20, 3), (20, 10), (20, 11), (20, 12), (21, 7), (21, 8), (21, 9), (21, 10), (21, 11), (22, 4), (22, 5), (22, 6), (22, 7), (22, 8), (22, 9), (23, 5), (23, 6), (23, 7), (23, 8), (23, 9), (24, 8), (24, 9), (24, 10), (25, 1), (25, 2), (25, 3), (25, 12), (26, 7), (27, 10), (27, 11), (27, 12), (28, 1), (28, 11), (28, 12), (29, 6), (29, 7), (29, 8), (29, 9), (30, 1), (30, 2), (30, 3), (31, 1), (31, 2), (31, 3), (32, 8), (32, 9), (33, 9), (33, 10), (34, 10), (34, 11), (34, 12), (35, 7), (35, 8), (35, 9), (36, 6), (36, 7), (36, 8), (36, 9), (37, 7), (37, 8);

-- SELECT * FROM feg_types;
-- SELECT * FROM months;
-- SELECT * FROM feggies RIGHT JOIN feg_types ON feggies.feg_type_id = feg_types.feg_types_id;
-- SELECT * FROM coming_in 
--   JOIN feggies ON coming_in.feggie_id = feggies.feggies_id
--   JOIN months ON coming_in.month_id = months.months_id;
-- SELECT * FROM at_best
--   JOIN feggies ON at_best.feggie_id = feggies.feggies_id
--   JOIN months ON at_best.month_id = months.months_id;
