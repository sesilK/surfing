-- �ܷ�Ű ������Ÿ�� ����
ALTER TABLE cart MODIFY pname varchar2(200);

select * from s_product;
select * from cart;
truncate table cart;
SELECT * FROM cart WHERE id = 'asdf' AND code = 110;
-- ��ٱ��� ���
SELECT SUM(QTY) FROM cart WHERE id = 'asdf' ;


--��ٱ��� �߰�(ó�� 1��)
INSERT INTO cart
VALUES('asdf',101,(SELECT pname FROM s_product WHERE code = 101),
NVL((SELECT qty FROM cart WHERE id = 'asdf' AND code = 101),1),
(SELECT price FROM s_product WHERE code = 101),
NVL((SELECT qty FROM cart WHERE id = 'asdf' AND code = 101),1)
*(SELECT price FROM s_product WHERE code = 101));

--���� �߰�
UPDATE cart
SET qty = qty + 1, total = (qty+1) * (SELECT price FROM s_product WHERE code = 101)
WHERE id = 'asdf' AND code = 101;

--���� ����
UPDATE cart
SET qty = qty - 1, total = (qty-1) * (SELECT price FROM s_product WHERE code = 101)
WHERE id = 'asdf' AND code = 101 AND qty > 1;

--��ٱ��Ͽ��� ����
DELETE FROM cart WHERE id = 'asdf' AND code = 101 AND qty = 1;


SELECT code, pname,
        TO_CHAR(price,'999,999,999') price, qty,
        TO_CHAR(total,'999,999,999') total
FROM cart WHERE id = 'asdf';
