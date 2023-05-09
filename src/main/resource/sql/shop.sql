-- 외래키 데이터타입 변경
ALTER TABLE cart MODIFY pname varchar2(200);

select * from s_product;
select * from cart;
truncate table cart;
SELECT * FROM cart WHERE id = 'asdf' AND code = 110;
-- 장바구니 목록
SELECT SUM(QTY) FROM cart WHERE id = 'asdf' ;


--장바구니 추가(처음 1개)
INSERT INTO cart
VALUES('asdf',101,(SELECT pname FROM s_product WHERE code = 101),
NVL((SELECT qty FROM cart WHERE id = 'asdf' AND code = 101),1),
(SELECT price FROM s_product WHERE code = 101),
NVL((SELECT qty FROM cart WHERE id = 'asdf' AND code = 101),1)
*(SELECT price FROM s_product WHERE code = 101));

--수량 추가
UPDATE cart
SET qty = qty + 1, total = (qty+1) * (SELECT price FROM s_product WHERE code = 101)
WHERE id = 'asdf' AND code = 101;

--수량 감소
UPDATE cart
SET qty = qty - 1, total = (qty-1) * (SELECT price FROM s_product WHERE code = 101)
WHERE id = 'asdf' AND code = 101 AND qty > 1;

--장바구니에서 삭제
DELETE FROM cart WHERE id = 'asdf' AND code = 101 AND qty = 1;


SELECT code, pname,
        TO_CHAR(price,'999,999,999') price, qty,
        TO_CHAR(total,'999,999,999') total
FROM cart WHERE id = 'asdf';
