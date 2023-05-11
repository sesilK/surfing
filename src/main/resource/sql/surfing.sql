-- ȸ������ ���̺�
CREATE TABLE person_info(
id VARCHAR(21) PRIMARY KEY,
pw VARCHAR(21) NOT NULL,
rating NUMBER(1) NOT NULL,
name VARCHAR(21) NOT NULL,
jumin NUMBER(13) NOT NULL,
Address VARCHAR(200) NOT NULL,
email VARCHAR(100) NOT NULL);

-- ��ǰ ���̺�
CREATE TABLE s_product(
code NUMBER(3) PRIMARY KEY,
pname VARCHAR2(30) NOT NULL,
price NUMBER(7) NOT NULL,
stock NUMBER(4) NOT NULL);

-- ��ٱ��� ���̺�
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

-- �������� ���̺�
CREATE TABLE payment(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
code NUMBER(3) NOT NULL,
pname VARCHAR2(30) NOT NULL,
qty NUMBER(4) NOT NULL,
price NUMBER(7) NOT NULL,
total NUMBER(8) NOT NULL,
FOREIGN KEY (id,code) REFERENCES cart(id,code));

-- �ֹ� ���̺�
CREATE TABLE s_order(
order_no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
total NUMBER(8) NOT NULL,
order_date DATE DEFAULT SYSDATE,
order_state VARCHAR2(12) DEFAULT '�ֹ��Ϸ�',
FOREIGN KEY (order_no) REFERENCES payment(order_no));

-- ���� ���̺�
CREATE TABLE lesson(
stage NUMBER(1) PRIMARY KEY,
lname VARCHAR2(30) NOT NULL,
tuition NUMBER(6) NOT NULL,
teacher VARCHAR2(30) NOT NULL);

-- ���� ���̺�
CREATE TABLE reserve(
no NUMBER(4) PRIMARY KEY,
id VARCHAR(21) NOT NULL,
reserve_date DATE NOT NULL,
persons NUMBER(2) NOT NULL,
stage NUMBER(1) NOT NULL, --����
state VARCHAR2(12) DEFAULT '����Ϸ�',
FOREIGN KEY (id) REFERENCES person_info(id),
FOREIGN KEY (stage) REFERENCES lesson(stage));

-- ���೯¥ �÷� ������Ÿ�� ����
ALTER TABLE reserve MODIFY RESERVE_DATE varchar2(30);

-- ��ǰ�� �÷� ������Ÿ�� ����
ALTER TABLE s_product MODIFY PNAME VARCHAR(200);
ALTER TABLE cart MODIFY pname varchar2(200);

-- ��ٱ��� ���̺� üũ �÷� �߰�
ALTER TABLE cart ADD checked NUMBER(1) DEFAULT 1;

-- ������ ������ �߰�
INSERT INTO person_info (id, pw, rating, name, jumin, Address,email)
values ('admin', 'admin0', '0', '������', '1234561234567', '�泲 õ�Ƚ� ������ ����� 215 7��, 8��', 'admin@admin.com');

-- ���̺� ��ȸ
SELECT * FROM person_info;  -- ȸ��
SELECT * FROM s_product;    -- ��ǰ
SELECT * FROM cart;         -- īƮ
SELECT * FROM payment;      -- ����
SELECT * FROM s_order;      -- �ֹ�
SELECT * FROM lesson;       -- ����
SELECT * FROM reserve;      -- ����

UPDATE cart
SET checked = 0
WHERE id = 'asdf' AND code = 106;