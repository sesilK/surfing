-- 상품코드 시퀀스 생성
CREATE SEQUENCE s_product_seq
INCREMENT BY 1  -- 1씩 증가
START WITH 101  -- 101부터 시작
;

-- 상품명 컬럼 데이터타입 변경
ALTER TABLE s_product MODIFY PNAME VARCHAR(200);
ALTER TABLE cart MODIFY pname varchar2(200);

-- 상품 데이터 추가
INSERT INTO s_product VALUES (101,'파이어와이어 더 잼 서프보드',1590000,10);
INSERT INTO s_product VALUES (102,'립컬 트윈 피쉬보드 PU',680000,10);
INSERT INTO s_product VALUES (103,'FCS 마차도 선데이 싱글 롱보드 센터핀',134000,10);
INSERT INTO s_product VALUES (104,'FCS 콤프 에센셜 리쉬',49000,10);
INSERT INTO s_product VALUES (105,'믹패닝 데크 패드',69000,10);
INSERT INTO s_product VALUES (106,'립컬 스프링 슈트 2미리',189000,10);
INSERT INTO s_product VALUES (107,'립컬 플래쉬밤 체스트집 슈트 5/3미리',599000,10);
INSERT INTO s_product VALUES (108,'립컬 리프 부츠 1.5미리',79000,10);
INSERT INTO s_product VALUES (109,'립컬 안티시리즈 판초',169000,10);
INSERT INTO s_product VALUES (110,'립컬 40L 라커 백팩',119000,10);

-- 상품 테이블 확인
SELECT * FROM s_product;


-- 관리자 데이터 추가
INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
values ('admin', 'admin0', '0', '관리자', '1234561234567', '충남 천안시 동남구 대흥로 215 7층, 8층', 'admin@admin.com');

-- person_info 테이블 조회
SELECT * FROM person_info;