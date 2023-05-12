-- È¸¿øÁ¤º¸ Å×ÀÌºí
CREATE TABLE person_info(
id VARCHAR(21) PRIMARY KEY,
pw VARCHAR(21) NOT NULL,
rating NUMBER(1) NOT NULL,
name VARCHAR(21) NOT NULL,
jumin NUMBER(13) NOT NULL,
Address VARCHAR(200) NOT NULL,
email VARCHAR(100) NOT NULL);

-- »óÇ° Å×ÀÌºí
CREATE TABLE s_product(
code NUMBER(3) PRIMARY KEY,
pname VARCHAR2(30) NOT NULL,
price NUMBER(7) NOT NULL,
stock NUMBER(4) NOT NULL);

-- Àå¹Ù±¸´Ï Å×ÀÌºí
CREATE TABLE cart(
id VARCHAR(21),
code NUMBER(3),
pname VARCHAR2(30) NOT NULL,
qty NUMBER(4) NOT NULL,
price NUMBER(7) NOT NULL,
total NUMBER(8) NOT NULL,
PRIMARY KEY (id, code),
FOREIGN KEY (id) REFERENCES person_info(id),
FOREIGN KEY (code) REFERENCES s_product(code));

-- °áÁ¦Á¤º¸ Å×ÀÌºí
CREATE TABLE payment(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
code NUMBER(3) NOT NULL,
pname VARCHAR2(30) NOT NULL,
qty NUMBER(4) NOT NULL,
price NUMBER(7) NOT NULL,
total NUMBER(8) NOT NULL,
FOREIGN KEY (id,code) REFERENCES cart(id,code));

-- ÁÖ¹® Å×ÀÌºí
CREATE TABLE s_order(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
total NUMBER(8) NOT NULL,
order_date DATE DEFAULT SYSDATE,
order_state VARCHAR2(12) DEFAULT 'ÁÖ¹®¿Ï·á',
FOREIGN KEY (order_no) REFERENCES payment(order_no));

-- °­ÁÂ Å×ÀÌºí
CREATE TABLE lesson(
stage NUMBER(1) PRIMARY KEY,
lname VARCHAR2(30) NOT NULL,
tuition NUMBER(6) NOT NULL,
teacher VARCHAR2(30) NOT NULL);

-- ¿¹¾à Å×ÀÌºí
CREATE TABLE reserve(
no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
reserve_date DATE NOT NULL,
persons NUMBER(2) NOT NULL,
stage NUMBER(1) NOT NULL, --·¹º§
state VARCHAR2(12) DEFAULT '¿¹¾à¿Ï·á',
FOREIGN KEY (id) REFERENCES person_info(id),
FOREIGN KEY (stage) REFERENCES lesson(stage));

select * from person_info;
select * from reserve;
select * from reserve WHERE id = 'admin' order by reserve_date ,stage;
select * from lesson;

INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
                    values ('admin', 'admin0', '0','°ü¸®ÀÚ', '1234561234567', 'Ãæ³² Ãµ¾È½Ã µ¿³²±¸ ´ëÈï·Î 215 7Ãþ, 8Ãþ', 'admin@admin.com');

INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
                    values ('1111', '1111', '1','¤¡¤¡¤¡', '1234561234567', 'Ãæ³² Ãµ¾È½Ã µ¿³²±¸ ´ëÈï·Î 215 7Ãþ, 8Ãþ', 'admin@admin.com');


ALTER TABLE reserve MODIFY RESERVE_DATE varchar2(30);

insert into reserve
values( (select NVL(MAX(no),0)+1 FROM reserve), 'admin', '2023', 5, 1, '¿¹¾à¿Ï·á');



<<<<<<< Updated upstream:src/main/resource/sql/surfing.sql
=======
-- ï¿½ï¿½ï¿½Ìºï¿½ ï¿½ï¿½È¸
SELECT * FROM person_info;  -- È¸ï¿½ï¿½
SELECT * FROM s_product;    -- ï¿½ï¿½Ç°
SELECT * FROM cart;         -- Ä«Æ®
SELECT * FROM payment;      -- ï¿½ï¿½ï¿½ï¿½
SELECT * FROM s_order;      -- ï¿½Ö¹ï¿½
SELECT * FROM lesson;       -- ï¿½ï¿½ï¿½ï¿½
SELECT * FROM reserve;      -- ï¿½ï¿½ï¿½ï¿½
SELECT * FROM bbs;

truncate table bbs;

UPDATE cart
SET checked = 0
WHERE id = 'asdf' AND code = 106;
>>>>>>> Stashed changes:main/resource/sql/surfing.sql
