CREATE SEQUENCE s_product_seq
INCREMENT BY 1  -- 1씩 증가
START WITH 100  -- 100부터 시작
;

ALTER TABLE s_product MODIFY PNAME VARCHAR(200);

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


SELECT * FROM s_product;