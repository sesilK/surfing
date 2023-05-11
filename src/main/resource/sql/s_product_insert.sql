-- ��ǰ�ڵ� ������ ����
CREATE SEQUENCE s_product_seq
INCREMENT BY 1  -- 1�� ����
START WITH 101; -- 101���� ����

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





-- ���� ������ �� Ȯ�� (�ҷ��� �������� ����)
SELECT s_product_seq.CURRVAL FROM dual;

-- �� �� �Ҹ� ������ 1�� ����
SELECT s_product_seq.NEXTVAL FROM dual;

-- SEQUENCE �ʱ�ȭ�ϱ�  ...�������� 1���� �ٽ� �����ϱ�
ALTER SEQUENCE s_product_seq INCREMENT BY -10;  --��ŭ �ǵ����� ���̳ʽ��� �������ְ� NEXTVAL �����ϱ�
ALTER SEQUENCE s_product_seq INCREMENT BY 1;    --�������� �ٽ� 1�� �س���