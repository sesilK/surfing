CREATE SEQUENCE s_product_seq
INCREMENT BY 1  -- 1�� ����
START WITH 100  -- 100���� ����
;

ALTER TABLE s_product MODIFY PNAME VARCHAR(200);

INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'���̾���̾� �� �� ��������',1590000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'���� Ʈ�� �ǽ����� PU',680000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'FCS ������ ������ �̱� �պ��� ������',134000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'FCS ���� ������ ����',49000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'���д� ��ũ �е�',69000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'���� ������ ��Ʈ 2�̸�',189000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'���� �÷����� ü��Ʈ�� ��Ʈ 5/3�̸�',599000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'���� ���� ���� 1.5�̸�',79000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'���� ��Ƽ�ø��� ����',169000,10);
INSERT INTO s_product VALUES (s_product_seq.NEXTVAL,'���� 40L ��Ŀ ����',119000,10);


SELECT * FROM s_product;