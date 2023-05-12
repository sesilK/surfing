-- 회占쏙옙占쏙옙占쏙옙 占쏙옙占싱븝옙
CREATE TABLE person_info(
id VARCHAR(21) PRIMARY KEY,
pw VARCHAR(21) NOT NULL,
rating NUMBER(1) NOT NULL,
name VARCHAR(21) NOT NULL,
jumin NUMBER(13) NOT NULL,
Address VARCHAR(200) NOT NULL,
email VARCHAR(100) NOT NULL);

-- 占쏙옙품 占쏙옙占싱븝옙
CREATE TABLE s_product(
code NUMBER(3) PRIMARY KEY,
pname VARCHAR2(30) NOT NULL,
price NUMBER(7) NOT NULL,
stock NUMBER(4) NOT NULL);

-- 占쏙옙袂占쏙옙占� 占쏙옙占싱븝옙
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

-- 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占싱븝옙
CREATE TABLE payment(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
code NUMBER(3) NOT NULL,
pname VARCHAR2(30) NOT NULL,
qty NUMBER(4) NOT NULL,
price NUMBER(7) NOT NULL,
total NUMBER(8) NOT NULL,
FOREIGN KEY (id,code) REFERENCES cart(id,code));

-- 占쌍뱄옙 占쏙옙占싱븝옙
CREATE TABLE s_order(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
total NUMBER(8) NOT NULL,
order_date DATE DEFAULT SYSDATE,
order_state VARCHAR2(12) DEFAULT '占쌍뱄옙占싹뤄옙',
FOREIGN KEY (order_no) REFERENCES payment(order_no));

-- 占쏙옙占쏙옙 占쏙옙占싱븝옙
CREATE TABLE lesson(
stage NUMBER(1) PRIMARY KEY,
lname VARCHAR2(30) NOT NULL,
tuition NUMBER(6) NOT NULL,
teacher VARCHAR2(30) NOT NULL);

-- 占쏙옙占쏙옙 占쏙옙占싱븝옙
CREATE TABLE reserve(
no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
reserve_date DATE NOT NULL,
persons NUMBER(2) NOT NULL,
stage NUMBER(1) NOT NULL, --占쏙옙占쏙옙
state VARCHAR2(12) DEFAULT '占쏙옙占쏙옙狗占�',
FOREIGN KEY (id) REFERENCES person_info(id),
FOREIGN KEY (stage) REFERENCES lesson(stage));

-- 占쌉쏙옙占쏙옙 no 占시뤄옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
CREATE SEQUENCE bbs_seq
INCREMENT BY 1
START WITH 1;

-- 占쌉쏙옙占쏙옙 占쏙옙占싱븝옙
CREATE TABLE BBS
(
    no NUMBER(3) PRIMARY KEY,
    id VARCHAR2(21) , 
    title VARCHAR2(50),
    bbs_date VARCHAR2(30), -- 
    bbs_content  VARCHAR2(2048),
    FOREIGN KEY (id) REFERENCES person_info(id) --占쌤뤄옙키
);

DROP TABLE BBS;

select * from person_info;
select * from bbs;
select * from reserve WHERE id = 'admin' order by reserve_date ,stage;
select * from lesson;


ALTER TABLE reserve MODIFY RESERVE_DATE varchar2(30);

-- 占쏙옙품占쏙옙 占시뤄옙 占쏙옙占쏙옙占쏙옙타占쏙옙 占쏙옙占쏙옙
ALTER TABLE s_product MODIFY PNAME VARCHAR(200);
ALTER TABLE cart MODIFY pname varchar2(200);

-- 占쏙옙袂占쏙옙占� 占쏙옙占싱븝옙占쏙옙 체크 占시뤄옙 占쌩곤옙
ALTER TABLE cart ADD checked NUMBER(1) DEFAULT 1;

-- 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌩곤옙
INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
values ('admin', 'admin0', '0', '占쏙옙占쏙옙占쏙옙', '1234561234567', '占썸남 천占싫쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 215 7占쏙옙, 8占쏙옙', 'admin@admin.com');
ALTER TABLE person_info DROP COLUMN jumin;

DELETE from person_info;

-- 占쏙옙占싱븝옙 占쏙옙회
SELECT * FROM person_info;  -- 회占쏙옙
SELECT * FROM s_product;    -- 占쏙옙품
SELECT * FROM cart;         -- 카트
SELECT * FROM payment;      -- 占쏙옙占쏙옙
SELECT * FROM s_order;      -- 占쌍뱄옙
SELECT * FROM lesson;       -- 占쏙옙占쏙옙
SELECT * FROM reserve;      -- 占쏙옙占쏙옙

UPDATE cart
SET checked = 0
WHERE id = 'asdf' AND code = 106;