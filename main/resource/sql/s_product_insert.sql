-- ��ǰ�ڵ� ������ ����
CREATE SEQUENCE s_product_seq
INCREMENT BY 1  -- 1�� ����
START WITH 100  -- 100���� ����
;

-- ��ǰ�� �÷� ������Ÿ�� ����
ALTER TABLE s_product MODIFY PNAME VARCHAR(200);

-- ��ǰ ������ �߰�
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

-- ��ǰ ���̺� Ȯ��
SELECT * FROM s_product;


-- ������ ������ �߰�
INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
values ('admin', 'admin0', '0', '������', '1234561234567', '�泲 õ�Ƚ� ������ ����� 215 7��, 8��', 'admin@admin.com');

-- person_info ���̺� ��ȸ
SELECT * FROM person_info;