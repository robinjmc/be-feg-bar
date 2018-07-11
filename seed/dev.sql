DROP DATABASE IF EXISTS fegtable;
CREATE DATABASE fegtable;

\c fegtable

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

INSERT INTO feggies(name, feg_type_id, img_src) 
  VALUES ('asparagus',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('aubergine',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('basil',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('beetroot',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('broccoli',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('brussels sprouts',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('cabbage',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('carrot',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('cauliflower',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('cavolo_nero',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('celeriac',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('celery',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('chicory',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('courgette',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('courgette_flower',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('fennel_bulb',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('garlic',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('globe_artichoke',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('jerusalem_artichoke',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('kale',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('kohlrabi',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('lamb''s_lettuce',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('leek',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('lettuce',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('marrow',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('new_potatoes',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('pak_choi',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('parsnip',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('peas',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('pepper',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('potato',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('pumpkin',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('purple_sprouting_broccoli',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('radicchio',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('radish',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('runner_bean',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('salsify',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('samphire',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('spinach',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('spring_greens',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('swede',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('sweet_potato',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('sweetcorn',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('swiss_chard',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('turnip',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('watercress',1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('apple',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('apricot',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('banana',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('blackberry',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('blackcurrants',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('bramley_apple',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('cherry',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('clementine',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('cranberry',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('damson',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('date',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('elderberries',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('fig',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('gooseberry',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('grapefruit',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('lemon',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('nectarine',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('orange',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('peach',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('pear',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('plum',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('pomegranate',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('quince',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('raspberry',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('redcurrant',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('rhubarb',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('strawberry',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('tomato',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('watermelon',2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg');

INSERT INTO coming_in(feggie_id, month_id) 
  VALUES (1, 5), (2, 5), (3, 6), (5, 7), (8, 5), (9, 12), (10, 6), (12, 7), (17, 6), (18, 5), (19, 10), (20, 9), (21, 7), (24, 4), (25, 7), (29, 4), (30, 2), (31, 3), (32, 9), (33, 1), (35, 4), (37, 9), (39, 3), (40, 3), (41, 10), (43, 8), (46, 3), (50, 7), (51, 5), (52, 11), (53, 6), (56, 8), (57, 10), (59, 7), (60, 5), (65, 7), (67, 8), (69, 9), (70, 6), (71, 6), (73, 5), (74, 5), (75, 6);
  
INSERT INTO at_best(feggie_id, month_id) 
  VALUES (1, 6), (1, 7), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (3, 7), (3, 8), (4, 1), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12), (5, 8), (5, 9), (5, 10), (6, 1), (6, 2), (6, 3), (6, 10), (6, 11), (6, 12), (7, 1), (7, 2), (7, 3), (7, 4), (7, 5), (7, 6), (7, 7), (7, 8), (7, 9), (7, 10), (7, 11), (7, 12), (8, 6), (8, 7), (8, 8), (8, 9), (9, 1), (9, 2), (9, 3), (9, 4), (10, 7), (10, 8), (10, 9), (10, 10), (11, 1), (11, 2), (11, 3), (11, 4), (11, 9), (11, 10), (11, 11), (11, 12), (12, 1), (12, 2), (12, 8), (12, 9), (12, 10), (12, 11), (12, 12), (13, 1), (13, 2), (13, 3), (14, 6), (14, 7), (14, 8), (14, 9), (15, 6), (15, 7), (15, 8), (16, 6), (16, 7), (16, 8), (16, 9), (17, 7), (17, 8), (17, 9), (17, 10), (18, 6), (18, 7), (18, 8), (18, 9), (18, 10), (18, 11), (19, 1), (19, 2), (19, 3), (19, 11), (19, 12), (20, 1), (20, 2), (20, 10), (20, 11), (20, 12), (21, 8), (21, 9), (21, 10), (21, 11), (22, 5), (22, 6), (22, 7), (22, 8), (22, 9), (22, 10), (22, 11), (23, 1), (23, 2), (23, 3), (23, 9), (23, 10), (23, 11), (23, 12), (24, 5), (24, 6), (24, 7), (24, 8), (24, 9), (24, 10), (24, 11), (24, 12), (25, 8), (25, 9), (26, 4), (26, 5), (26, 6), (26, 7), (27, 1), (27, 2), (27, 3), (27, 4), (27, 5), (27, 6), (27, 7), (27, 8), (27, 9), (27, 10), (27, 11), (27, 12), (28, 1), (28, 2), (28, 3), (28, 9), (28, 10), (28, 11), (28, 12), (29, 5), (29, 6), (29, 7), (29, 8), (29, 9), (29, 10), (29, 11), (30, 3), (30, 4), (30, 5), (30, 6), (30, 7), (30, 8), (30, 9), (30, 10), (31, 4), (31, 5), (31, 6), (31, 7), (32, 10), (32, 11), (32, 12), (33, 2), (33, 3), (33, 4), (34, 1), (34, 2), (34, 3), (34, 4), (34, 5), (34, 6), (34, 7), (34, 8), (34, 9), (34, 10), (34, 11), (34, 12), (35, 5), (35, 6), (35, 7), (35, 8), (35, 9), (35, 10), (36, 6), (36, 7), (36, 8), (36, 9), (36, 10), (36, 11), (37, 1), (37, 10), (37, 11), (37, 12), (38, 7), (38, 8), (39, 4), (39, 5), (39, 6), (39, 7), (39, 8), (39, 9), (40, 4), (40, 5), (40, 6), (41, 1), (41, 2), (41, 11), (41, 12), (42, 1), (42, 2), (42, 3), (42, 10), (42, 11), (42, 12), (43, 9), (44, 7), (44, 8), (44, 9), (44, 10), (44, 11), (45, 1), (45, 2), (45, 10), (45, 11), (45, 12), (46, 4), (46, 5), (46, 6), (46, 7), (46, 8), (46, 9), (47, 1), (47, 2), (47, 9), (47, 10), (47, 11), (47, 12), (48, 5), (48, 6), (48, 7), (48, 8), (48, 9), (49, 1), (49, 2), (49, 3), (49, 4), (49, 5), (49, 6), (49, 7), (49, 8), (49, 9), (49, 10), (49, 11), (49, 12), (50, 8), (50, 9), (50, 10), (51, 6), (51, 7), (52, 1), (52, 2), (52, 3), (52, 12), (53, 7), (54, 1), (54, 2), (54, 11), (54, 12), (55, 10), (55, 11), (55, 12), (56, 9), (57, 1), (57, 11), (57, 12), (58, 8), (58, 9), (58, 10), (59, 8), (59, 9), (59, 10), (60, 6), (60, 7), (60, 8), (60, 9), (61, 1), (61, 2), (61, 3), (61, 4), (61, 5), (61, 12), (62, 1), (62, 2), (62, 3), (63, 5), (63, 6), (63, 7), (63, 8), (63, 9), (64, 1), (64, 2), (64, 3), (65, 8), (65, 9), (66, 1), (66, 9), (66, 10), (66, 11), (66, 12), (67, 9), (67, 10), (68, 1), (68, 2), (68, 3), (68, 4), (68, 5), (68, 6), (68, 7), (68, 8), (68, 9), (68, 10), (68, 11), (68, 12), (69, 10), (69, 11), (69, 12), (70, 7), (70, 8), (70, 9), (71, 7), (71, 8), (71, 9), (72, 1), (72, 2), (72, 3), (72, 4), (72, 5), (72, 6), (73, 6), (73, 7), (73, 8), (73, 9), (74, 6), (74, 7), (74, 8), (74, 9), (74, 10), (75, 7), (75, 8);

SELECT * FROM feg_types
SELECT * FROM months
SELECT * FROM feggies RIGHT JOIN feg_types ON feggies.feg_type_id = feg_types.feg_types_id;
SELECT * FROM coming_in 
  JOIN feggies ON coming_in.feggie_id = feggies.feggies_id
  JOIN months ON coming_in.month_id = months.months_id;
SELECT * FROM at_best
  JOIN feggies ON at_best.feggie_id = feggies.feggies_id
  JOIN months ON at_best.month_id = months.months_id;

-- SELECT feg_types.name, feggies.name, feggies.img_src, months.name AS months_name FROM feggies
-- JOIN feg_types ON feggies.feg_type_id = feg_types.feg_types_id
-- JOIN feggies ON comming_in.feggie_id = feggies.feggies_id
-- JOIN months ON coming_in.month_id = months.months_id
-- JOIN feggies ON at_best.feggie_id = feggies.feggies_id
-- JOIN months ON at_best.month_id = months.months_id;
