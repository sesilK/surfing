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

-- 게시판 no 컬럼 시퀀스 생성
CREATE SEQUENCE bbs_seq
INCREMENT BY 1
START WITH 1;

-- 게시판 테이블
CREATE TABLE BBS
(
    no NUMBER(3) PRIMARY KEY,
    id VARCHAR2(21) , 
    title VARCHAR2(50),
    bbs_date VARCHAR2(30), -- 
    bbs_content  VARCHAR2(2048),
    FOREIGN KEY (id) REFERENCES person_info(id) --외래키
);

DROP TABLE BBS;

select * from person_info;
select * from bbs;
select * from reserve WHERE id = 'admin' order by reserve_date ,stage;
select * from lesson;

INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
                    values ('admin', 'admin0', '0','관리자', '1234561234567', '충남 천안시 동남구 대흥로 215 7층, 8층', 'admin@admin.com');

INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
                    values ('1111', '1111', '1','ㄱㄱㄱ', '1234561234567', '충남 천안시 동남구 대흥로 215 7층, 8층', 'admin@admin.com');


ALTER TABLE reserve MODIFY RESERVE_DATE varchar2(30);

insert into reserve
values( (select NVL(MAX(no),0)+1 FROM reserve), 'admin', '2023', 5, 1, '예약완료');



