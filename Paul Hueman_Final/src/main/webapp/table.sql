drop table paul_board;
drop table paul_cart;
drop table paul_user;

set linesize 235; -- 오라클에서 필드 한줄로 보여주기
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

--* 회원

Create table paul_user (
u_id varchar2(20) primary key,
u_pw varchar2(20),
u_name nvarchar2(15),
u_email varchar2(30),
u_tel varchar2(20),
u_question varchar2(40), -- 비밀번호 질문 
u_answer varchar2(40), -- 비밀번호 답변
u_zipcode varchar2(5), -- 우편번호
u_roadaddr nvarchar2(50), -- 주소
u_detailaddr nvarchar2(50), -- 주소
u_extraaddr nvarchar2(50) -- 주소
);

--* 게시판

Create table paul_board (
b_no number primary key,
b_subject nvarchar2(60),
u_id varchar2(20) references paul_user(u_id),
b_date date,
b_contents nvarchar2(1000)
);

CREATE SEQUENCE no_seq;

--* 상품

CREATE TABLE paul_product (
p_code VARCHAR2(10) PRIMARY KEY, -- 상품 코드
p_name VARCHAR2(15) UNIQUE NOT NULL, -- 상품명
p_cate NUMBER(1) NOT NULL, -- 상품 카테고리 (일반 : 1, 선글라스 : 2)
p_color1 VARCHAR2(10), -- 색상코드 (3개까지)
p_color2 VARCHAR2(10), 
p_color3 VARCHAR2(10), 
p_price NUMBER NOT NULL, -- 상품 가격
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

--* 장바구니

Create table paul_cart(
c_no number primary key, --장바구니코드
p_name VARCHAR2(15), -- 상품이름
p_price NUMBER, -- 상품 가격
p_color VARCHAR2(10), --상품색상
u_id varchar2(20) references paul_user(u_id), --구매자(id)
c_cnt number(4), -- 수량
c_status number(1) --구매상태 .  안삼 ->0 ,  삼->1
);

ALTER TABLE paul_cart ADD CONSTRAINT cartname_fk FOREIGN KEY(p_name) REFERENCES paul_product(p_name);

CREATE SEQUENCE seq_cart;

--* 주문

CREATE TABLE paul_order(
o_no NUMBER(10) PRIMARY KEY, -- 주문번호
o_name NVARCHAR2(15), -- 주문자명
o_zipcode VARCHAR2(5), -- 주문자 우편번호
o_addr NVARCHAR2(152), -- 주문자 주소
o_tel VARCHAR2(20), -- 주문자 전화번호
o_total NUMBER, -- 총 가격
o_payer NVARCHAR2(15), -- 입금자명
u_id VARCHAR2(20) REFERENCES paul_user(u_id)
);

CREATE TABLE paul_orderproduct(
op_no NUMBER PRIMARY KEY, -- 주문상품번호
op_name VARCHAR2(15), -- 주문 상품명
op_color VARCHAR2(10), -- 주문 색상
op_cnt NUMBER(4), -- 수량
op_sum NUMBER, -- 항목당 총액
o_no NUMBER(10) REFERENCES paul_order(o_no)
);

ALTER TABLE paul_orderproduct ADD CONSTRAINT ordername_fk FOREIGN KEY(op_name) REFERENCES paul_product(p_name);

CREATE SEQUENCE seq_orderproduct;