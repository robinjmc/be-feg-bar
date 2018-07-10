DROP DATABASE IF EXISTS fegtable_test;
CREATE DATABASE fegtable_test;

CREATE TABLE feg_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  slug VARCHAR(25) NOT NULL
);

CREATE TABLE months (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  slug VARCHAR(25) NOT NULL
);

CREATE TABLE feggies(
  name      VARCHAR(25) NOT NULL PRIMARY KEY,
  coming_in VARARRAY(12),
  at_best   VARARRAY(12) NOT NULL,
  feg_type_id      INTEGER  NOT NULL,
  img_src   VARCHAR(105) NOT NULL, 
  FOREIGN KEY (feg_type) REFERENCES feg_type(id)
);

INSERT INTO feg_types (name, slug)
  VALUES ('Vegetable', 'veg'), ('Fruit', 'fruit');

INSERT INTO months(name, slug) 
  VALUES ('January', 'jan'), ('February', 'feb'), ('March', 'mar'), ('April', 'apr'), ('May', 'may'), ('June', 'jun'), ('July', 'jul'), ('August', 'aug'), ('September', 'sept'), ('October', 'oct'), ('November', 'nov'), ('December', 'feb');

INSERT INTO feggies(name,coming_in,at_best,feg_type_id,img_src) VALUES ('aubergine',[5 ],[6, 7, 8, 9, 10],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('beetroot',[ ],[1, 7, 8, 9, 10, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('brussels sprouts',[ ],[1, 2, 3, 10, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('carrot',[5 ],[6, 7, 8, 9],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('cavolo_nero',[6 ],[7, 8, 9, 10],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('celery',[7 ],[1, 2, 8, 9, 10, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('courgette',[ ],[6, 7, 8, 9],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('fennel_bulb',[ ],[6, 7, 8, 9],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('jerusalem_artichoke',[10 ],[1, 2, 3, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('kohlrabi',[7 ],[8, 9, 10, 11],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('leek',[ ],[1, 2, 3, 9, 10, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('marrow',[7 ],[8, 9],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('parsnip',[ ],[1, 2, 3, 9, 10, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('pepper',[2 ],[3, 4, 5, 6, 7, 8, 9, 10],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('pumpkin',[9 ],[10, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('radicchio',[ ],[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('runner_bean',[ ],[6, 7, 8, 9, 10, 11],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('spinach',[3 ],[4, 5, 6, 7, 8, 9],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('spring_greens',[3 ],[4, 5, 6],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('sweet_potato',[ ],[1, 2, 3, 10, 11, 12],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('swiss_chard',[ ],[7, 8, 9, 10, 11],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('watercress',[3 ],[4, 5, 6, 7, 8, 9],1,'https://c.pxhere.com/photos/06/4a/vegetables_season_leek_apple_useful_health_pumpkin_cabbage-673328.jpg!d'), ('apricot',[ ],[5, 6, 7, 8, 9],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('blackberry',[7 ],[8, 9, 10],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('bramley_apple',[11 ],[1, 2, 3, 12],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('cherry',[6 ],[7],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('cranberry',[ ],[10, 11, 12],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('date',[10 ],[1, 11, 12],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('gooseberry',[5 ],[6, 7, 8, 9],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('lemon',[ ],[1, 2, 3],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('orange',[ ],[1, 2, 3],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('peach',[7 ],[8, 9],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('plum',[8 ],[9, 10],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('quince',[9 ],[10, 11, 12],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('redcurrant',[6 ],[7, 8, 9],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('strawberry',[5 ],[6, 7, 8, 9],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg'), ('watermelon',[6 ],[7, 8],2,'https://pixnio.com/free-images/2017/09/19/2017-09-19-06-59-45-1100x738.jpg');
