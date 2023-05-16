-- 테이블 전체 삭제 후 재생성
DROP TABLE s_product;       -- 상품
DROP TABLE cart;            -- 장바구니
DROP TABLE s_order_detail;  -- 주문상세내역
DROP TABLE s_order;         -- 주문조회
DROP TABLE lesson;          -- 레슨
DROP TABLE reserve;         -- 예약
DROP TABLE bbs;             -- 게시판
DROP TABLE payment;         -- 결제
delete from person_info;    -- 회원 데이터
DROP TABLE person_info;     -- 회원

-- 회원 테이블 생성
CREATE TABLE person_info(
id VARCHAR(21) PRIMARY KEY,
pw VARCHAR(21) NOT NULL,
rating NUMBER(1) NOT NULL,
name VARCHAR(21) NOT NULL,
Address VARCHAR(200) NOT NULL,
email VARCHAR(100) NOT NULL,
emailHash VARCHAR(100) NOT NULL,
emailCheck VARCHAR(100) NOT NULL);

-- 상품 테이블 생성
CREATE TABLE s_product(
code NUMBER(3) PRIMARY KEY,
pname VARCHAR2(200) NOT NULL,
price NUMBER(7) NOT NULL,
stock NUMBER(4) NOT NULL,
filename VARCHAR2(200));

-- 장바구니 테이블 생성
CREATE TABLE cart(
id VARCHAR(21),
code NUMBER(3),
pname VARCHAR2(200) NOT NULL,
qty NUMBER(4) NOT NULL,
price NUMBER(7) NOT NULL,
total NUMBER(8) NOT NULL,
checked NUMBER(1) DEFAULT 1 NOT NULL,
filename VARCHAR2(200),
PRIMARY KEY (id, code),
FOREIGN KEY (id) REFERENCES person_info(id),
FOREIGN KEY (code) REFERENCES s_product(code));

<<<<<<< HEAD
-- 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占싱븝옙
CREATE TABLE payment(
=======
-- 주문 테이블 생성
CREATE TABLE s_order(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
total NUMBER(8) NOT NULL,
order_date DATE DEFAULT SYSDATE NOT NULL,
order_state VARCHAR2(12) DEFAULT '주문완료' NOT NULL,
payment VARCHAR2(30) NOT NULL,
FOREIGN KEY (id) REFERENCES person_info(id));

-- 주문 상세 테이블 생성
CREATE TABLE s_order_detail(
<<<<<<< HEAD
>>>>>>> 434940b56331a444327fa8474f569fbb9b7fa6bf
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
=======
order_no NUMBER(4) NOT NULL,
>>>>>>> ft-230515-order
code NUMBER(3) NOT NULL,
pname VARCHAR2(200) NOT NULL,
qty NUMBER(4) NOT NULL,
price NUMBER(7) NOT NULL,
total NUMBER(8) NOT NULL,
filename VARCHAR2(200),
PRIMARY KEY (order_no, code),
FOREIGN KEY (order_no) REFERENCES s_order(order_no),
FOREIGN KEY (code) REFERENCES s_product(code));

<<<<<<< HEAD
-- 占쌍뱄옙 占쏙옙占싱븝옙
CREATE TABLE s_order(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
total NUMBER(8) NOT NULL,
order_date DATE DEFAULT SYSDATE,
order_state VARCHAR2(12) DEFAULT '占쌍뱄옙占싹뤄옙',
FOREIGN KEY (order_no) REFERENCES payment(order_no));

-- 占쏙옙占쏙옙 占쏙옙占싱븝옙
=======
-- 레슨 테이블 생성
>>>>>>> 434940b56331a444327fa8474f569fbb9b7fa6bf
CREATE TABLE lesson(
stage NUMBER(1) PRIMARY KEY,
lname VARCHAR2(30) NOT NULL,
tuition NUMBER(6) NOT NULL,
teacher VARCHAR2(30) NOT NULL);

-- 占쏙옙占쏙옙 占쏙옙占싱븝옙
-- 예약 테이블 생성
CREATE TABLE reserve(
no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
reserve_date varchar2(30) NOT NULL,
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
stage NUMBER(1) NOT NULL,
state VARCHAR2(12) DEFAULT '예약완료' NOT NULL,
FOREIGN KEY (id) REFERENCES person_info(id),
FOREIGN KEY (stage) REFERENCES lesson(stage));

-- 게시판 테이블 생성
CREATE TABLE bbs(
no NUMBER(3) PRIMARY KEY,
id VARCHAR2(21) NOT NULL, 
title VARCHAR2(50) NOT NULL,
bbs_date date default sysdate NOT NULL, 
bbs_content VARCHAR2(2048),
FOREIGN KEY (id) REFERENCES person_info(id));

-- 관리자 계정 생성
INSERT INTO person_info
values ('admin', 'admin', '0', '관리자', '관리자주소', '관리자메일@mail.com', '이메일해시', '이메일체크');

-- 레슨 테이블 데이터 생성
INSERT INTO lesson VALUES ( 1, 'BEGINNER' ,80000,'Gabriel Medina'); 
INSERT INTO lesson VALUES ( 2, 'LEARNNER' ,100000,'John Florence');
INSERT INTO lesson VALUES ( 3, 'APPRENTICE' ,120000,'Kelly Slater');

-- 상품코드 시퀀스 생성
CREATE SEQUENCE s_product_seq
INCREMENT BY 1  -- 1씩 증가
START WITH 101; -- 101부터 시작

<<<<<<< HEAD

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
=======
-- 상품코드 시퀀스 관리
SELECT s_product_seq.CURRVAL FROM dual; -- 현재 시퀀스 (실행해도 증가 안함)
SELECT s_product_seq.NEXTVAL FROM dual; -- 실행하면 시퀀스 넘어감
ALTER SEQUENCE s_product_seq INCREMENT BY -10;  --시퀀스 돌릴만큼 마이너스 해주고 1회 실행
ALTER SEQUENCE s_product_seq INCREMENT BY 1;    --다시 1씩 증가하도록 변경하기

-- 상품 테이블 데이터 생성
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'파이어와이어 더 잼 서프보드',1590000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 트윈 피쉬보드 PU',680000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'FCS 마차도 선데이 싱글 롱보드 센터핀',134000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'FCS 콤프 에센셜 리쉬',49000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'믹패닝 데크 패드',69000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 스프링 슈트 2미리',189000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 플래쉬밤 체스트집 슈트 5/3미리',599000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 리프 부츠 1.5미리',79000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 안티시리즈 판초',169000,10, 'product_'||s_product_seq.NEXTVAL||'.png');
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 40L 라커 백팩',119000,10, 'product_'||s_product_seq.NEXTVAL||'.png');

-- 주문번호 시퀀스 생성
CREATE SEQUENCE s_order_seq
INCREMENT BY 10  -- 10씩 증가
START WITH 1001; -- 1001부터 시작

-- 테이블 확인용
SELECT * FROM person_info;    -- 회원
SELECT * FROM s_product;      -- 상품
SELECT * FROM cart;           -- 장바구니
SELECT * FROM s_order;        -- 주문조회
SELECT * FROM s_order_detail; -- 주문상세내역
SELECT * FROM lesson;         -- 레슨
SELECT * FROM reserve;        -- 예약
SELECT * FROM bbs;            -- 게시판

<<<<<<< HEAD
<<<<<<< HEAD
commit;
=======
<<<<<<< Updated upstream:src/main/resource/sql/surfing.sql
=======
-- ���̺� ��ȸ
SELECT * FROM person_info;  -- ȸ��
SELECT * FROM s_product;    -- ��ǰ
SELECT * FROM cart;         -- īƮ
SELECT * FROM payment;      -- ����
SELECT * FROM s_order;      -- �ֹ�
SELECT * FROM lesson;       -- ����
SELECT * FROM reserve;      -- ����
SELECT * FROM bbs;

truncate table bbs;
>>>>>>> 434940b56331a444327fa8474f569fbb9b7fa6bf

UPDATE cart
SET checked = 0
WHERE id = 'asdf' AND code = 106;
<<<<<<< HEAD

ALTER TABLE person_info ADD emailHash VARCHAR(100);
ALTER TABLE person_info ADD emailCheck CHAR(5) CHECK(emailCheck IN('FALSE','TRUN'));
=======
>>>>>>> Stashed changes:main/resource/sql/surfing.sql
>>>>>>> ft-230501-reserve
>>>>>>> 434940b56331a444327fa8474f569fbb9b7fa6bf
=======
COMMIT;
>>>>>>> ft-230515-order
