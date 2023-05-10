-- 상품코드 시퀀스 생성
CREATE SEQUENCE s_product_seq
INCREMENT BY 1  -- 1씩 증가
START WITH 101; -- 101부터 시작

-- 상품 데이터 추가
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'파이어와이어 더 잼 서프보드',1590000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 트윈 피쉬보드 PU',680000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'FCS 마차도 선데이 싱글 롱보드 센터핀',134000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'FCS 콤프 에센셜 리쉬',49000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'믹패닝 데크 패드',69000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 스프링 슈트 2미리',189000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 플래쉬밤 체스트집 슈트 5/3미리',599000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 리프 부츠 1.5미리',79000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 안티시리즈 판초',169000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'립컬 40L 라커 백팩',119000,10);

-- 상품 테이블 확인
SELECT * FROM s_product;





-- 현재 시퀀스 값 확인 (불러도 증가하지 않음)
SELECT s_product_seq.CURRVAL FROM dual;

-- 한 번 불릴 때마다 1씩 증가
SELECT s_product_seq.NEXTVAL FROM dual;

-- SEQUENCE 초기화하기  ...시퀀스를 1부터 다시 시작하기
ALTER SEQUENCE s_product_seq INCREMENT BY -10;  --얼만큼 되돌릴지 마이너스로 지정해주고 NEXTVAL 실행하기
ALTER SEQUENCE s_product_seq INCREMENT BY 1;    --증가값을 다시 1로 해놓기