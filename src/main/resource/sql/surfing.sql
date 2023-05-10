-- 회원정보 테이블
CREATE TABLE person_info(
id VARCHAR(21) PRIMARY KEY,
pw VARCHAR(21) NOT NULL,
rating NUMBER(1) NOT NULL,
name VARCHAR(21) NOT NULL,
jumin NUMBER(13) NOT NULL,
Address VARCHAR(200) NOT NULL,
email VARCHAR(100) NOT NULL);

-- 상품 테이블
CREATE TABLE s_product(
code NUMBER(3) PRIMARY KEY,
pname VARCHAR2(30) NOT NULL,
price NUMBER(7) NOT NULL,
stock NUMBER(4) NOT NULL);

-- 장바구니 테이블
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

-- 결제정보 테이블
CREATE TABLE payment(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
code NUMBER(3) NOT NULL,
pname VARCHAR2(30) NOT NULL,
qty NUMBER(4) NOT NULL,
price NUMBER(7) NOT NULL,
total NUMBER(8) NOT NULL,
FOREIGN KEY (id,code) REFERENCES cart(id,code));

-- 주문 테이블
CREATE TABLE s_order(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
total NUMBER(8) NOT NULL,
order_date DATE DEFAULT SYSDATE,
order_state VARCHAR2(12) DEFAULT '주문완료',
FOREIGN KEY (order_no) REFERENCES payment(order_no));

-- 강좌 테이블
CREATE TABLE lesson(
stage NUMBER(1) PRIMARY KEY,
lname VARCHAR2(30) NOT NULL,
tuition NUMBER(6) NOT NULL,
teacher VARCHAR2(30) NOT NULL);

-- 예약 테이블
CREATE TABLE reserve(
no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
reserve_date DATE NOT NULL,
persons NUMBER(2) NOT NULL,
stage NUMBER(1) NOT NULL, --레벨
state VARCHAR2(12) DEFAULT '예약완료',
FOREIGN KEY (id) REFERENCES person_info(id),
FOREIGN KEY (stage) REFERENCES lesson(stage));

-- 예약날짜 컬럼 데이터타입 변경
ALTER TABLE reserve MODIFY RESERVE_DATE varchar2(30);

-- 상품명 컬럼 데이터타입 변경
ALTER TABLE s_product MODIFY PNAME VARCHAR(200);
ALTER TABLE cart MODIFY pname varchar2(200);

-- 장바구니 테이블에 체크 컬럼 추가
ALTER TABLE cart ADD checked NUMBER(1) DEFAULT 1;

-- 관리자 데이터 추가
INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
values ('admin', 'admin0', '0', '관리자', '1234561234567', '충남 천안시 동남구 대흥로 215 7층, 8층', 'admin@admin.com');

-- 테이블 조회
SELECT * FROM person_info;  -- 회원
SELECT * FROM s_product;    -- 상품
SELECT * FROM cart;         -- 카트
SELECT * FROM payment;      -- 결제
SELECT * FROM s_order;      -- 주문
SELECT * FROM lesson;       -- 레슨
SELECT * FROM reserve;      -- 예약

UPDATE cart
SET checked = 0
WHERE id = 'asdf' AND code = 106;