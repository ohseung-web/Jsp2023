drop table paul_board;
drop table paul_cart;
drop table paul_user;

set linesize 235; -- ����Ŭ���� �ʵ� ���ٷ� �����ֱ�
col u_id for a10;
col u_pw for a10;
col u_name for a15;
col u_email for a30;
col u_zipcode for a5;
col u_roadaddr for a30;
col u_detailaddr for a30;
col u_extraaddr for a30;
col u_tel for a15;
col u_question for a25;
col u_answer for a20;

--* ȸ��

Create table paul_user (
u_id varchar2(20) primary key,
u_pw varchar2(20),
u_name nvarchar2(15),
u_email varchar2(30),
u_tel varchar2(20),
u_question varchar2(40), -- ��й�ȣ ���� 
u_answer varchar2(40), -- ��й�ȣ �亯
u_zipcode varchar2(5), -- �����ȣ
u_roadaddr nvarchar2(50), -- �ּ�
u_detailaddr nvarchar2(50), -- �ּ�
u_extraaddr nvarchar2(50) -- �ּ�
);

--* �Խ���

Create table paul_board (
b_no number primary key,
b_subject nvarchar2(60),
u_id varchar2(20) references paul_user(u_id),
b_date date,
b_contents nvarchar2(1000)
);

CREATE SEQUENCE no_seq;

--* ��ǰ

CREATE TABLE paul_product (
p_code VARCHAR2(10) PRIMARY KEY, -- ��ǰ �ڵ�
p_name VARCHAR2(15) UNIQUE NOT NULL, -- ��ǰ��
p_cate NUMBER(1) NOT NULL, -- ��ǰ ī�װ� (�Ϲ� : 1, ���۶� : 2)
p_color1 VARCHAR2(10), -- �����ڵ� (3������)
p_color2 VARCHAR2(10), 
p_color3 VARCHAR2(10), 
p_price NUMBER NOT NULL, -- ��ǰ ����
p_width NUMBER(3) NOT NULL, -- lens width
p_nose NUMBER(3) NOT NULL, -- nose bridge
p_frame NUMBER(3) NOT NULL, -- frame side
p_material VARCHAR2(10) NOT NULL
);

INSERT INTO paul_product VALUES ('P000001001', 'PHS-2012A', 2, 'Col.5', 'Col.1', 'Col.14', 180000, 61, 14, 146, 'Monel');
INSERT INTO paul_product VALUES ('P000001002', 'PHS-2013A', 2, 'Col.12', 'Col.5', 'Col.11', 197000, 57, 18, 145, 'Monel');
INSERT INTO paul_product VALUES ('P000001003', 'PHS-2014A', 2, 'Col.11', 'Col.5', 'Col.14', 197000, 59, 17, 145, 'Monel');
INSERT INTO paul_product VALUES ('P000001004', 'PHS-1131A', 2, 'Col.4', 'Col.11', 'Col.5', 210000, 54, 20, 145, 'Monel');
INSERT INTO paul_product VALUES ('P000001005', 'PHS-2027D', 2, 'Col.5', 'Col.11', 'Col.14', 220000, 56, 19, 142, 'Monel');
INSERT INTO paul_product VALUES ('P000001006', 'PHS-2028D', 2, 'Col.14', 'Col.11', 'Col.5', 220000, 56, 19, 142, 'Monel');
INSERT INTO paul_product VALUES ('P000001007', 'PHF-379D', 1, 'Col.14', 'Col.11', 'Col.5', 176000, 52, 19, 142, 'Monel');
INSERT INTO paul_product VALUES ('P000001008', 'PHF-381D', 1, 'Col.6', 'Col.4', 'Col.5', 220000, 48, 19, 142, 'Monel');
INSERT INTO paul_product VALUES ('P000001009', 'PHF-382D', 1, 'Col.3', 'Col.5', 'Col.4', 220000, 50, 19, 142, 'Monel');
INSERT INTO paul_product VALUES ('P000001010', 'PHF-383D', 1, 'Col.11', 'Col.4', 'Col.5', 220000, 51, 19, 142, 'Monel');
INSERT INTO paul_product VALUES ('P000001011', 'PHF-384D', 1, 'Col.16', 'Col.11', 'Col.5', 220000, 51, 22, 142, 'Monel');
INSERT INTO paul_product VALUES ('P000001012', 'PHF-377D', 1, 'Col.1', 'Col.14', 'Col.5', 176000, 55, 19, 142, 'Monel');
COMMIT;

--* ��ٱ���

Create table paul_cart(
c_no number primary key, --��ٱ����ڵ�
p_name VARCHAR2(15), -- ��ǰ�̸�
p_price NUMBER, -- ��ǰ ����
p_color VARCHAR2(10), --��ǰ����
u_id varchar2(20) references paul_user(u_id), --������(id)
c_cnt number(4), -- ����
c_status number(1) --���Ż��� .  �Ȼ� ->0 ,  ��->1
);

ALTER TABLE paul_cart ADD CONSTRAINT cartname_fk FOREIGN KEY(p_name) REFERENCES paul_product(p_name);

CREATE SEQUENCE seq_cart;

--* �ֹ�

CREATE TABLE paul_order(
o_no NUMBER(10) PRIMARY KEY, -- �ֹ���ȣ
o_name NVARCHAR2(15), -- �ֹ��ڸ�
o_zipcode VARCHAR2(5), -- �ֹ��� �����ȣ
o_addr NVARCHAR2(152), -- �ֹ��� �ּ�
o_tel VARCHAR2(20), -- �ֹ��� ��ȭ��ȣ
o_total NUMBER, -- �� ����
o_payer NVARCHAR2(15), -- �Ա��ڸ�
u_id VARCHAR2(20) REFERENCES paul_user(u_id)
);

CREATE TABLE paul_orderproduct(
op_no NUMBER PRIMARY KEY, -- �ֹ���ǰ��ȣ
op_name VARCHAR2(15), -- �ֹ� ��ǰ��
op_color VARCHAR2(10), -- �ֹ� ����
op_cnt NUMBER(4), -- ����
op_sum NUMBER, -- �׸�� �Ѿ�
o_no NUMBER(10) REFERENCES paul_order(o_no)
);

ALTER TABLE paul_orderproduct ADD CONSTRAINT ordername_fk FOREIGN KEY(op_name) REFERENCES paul_product(p_name);

CREATE SEQUENCE seq_orderproduct;