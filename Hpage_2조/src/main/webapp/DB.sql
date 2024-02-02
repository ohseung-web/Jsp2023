create table tt_member(
ID VARCHAR2(50) primary key,
EMAIL VARCHAR2(50),
NAME VARCHAR2(20),
PASSWORD VARCHAR2(20),
PHONE VARCHAR2(15),
ZIPCODE VARCHAR2(5),
ROADADDRESS VARCHAR2(1000),
AGREE_TERMS VARCHAR2(6),
AGREE_AGE VARCHAR2(6),
AGREE_EMAIL VARCHAR2(6),
DETAILADDRESS VARCHAR2(1000),
AGREE_MESSAGE VARCHAR2(6)
);

create table tt_product(
p_no varchar2(5) primary key,
p_name varchar2(1000),
p_price number,
p_colorone varchar2(6),
p_colortwo varchar2(6),
p_img varchar2(1000),
p_category varchar2(10)
);

insert into tt_product values('20001', 'FAVORITE CUP', 14000, 'RED', 'YELLOW', 'image_1561289684071_1000.jpg', 'CUP');
insert into tt_product values('20002', 'BEBE PODS', 13000, 'RED', 'YELLOW', 'image_1562325030314_1000.jpg', 'CASE');
insert into tt_product values('20003', 'B5 MEMO-PAD', 4500, 'RED', 'YELLOW', 'image_1562327563518_1000.jpg', 'STATIONERY');
insert into tt_product values('20004', 'PENCIL CASE', 12000, 'RED', 'YELLOW', 'image_1564558598862_1000.jpg', 'FABRIC');
insert into tt_product values('20005', 'BIG MEMOPAD', 3000, 'RED', 'YELLOW', 'image_1564749426790_1000.jpg', 'STATIONERY');
insert into tt_product values('20006', 'FAVORITE BAG', 21000, 'RED', 'YELLOW', 'image_1564749810708_1000.jpg', 'FABRIC');
insert into tt_product values('20007', 'BEBE KEY-RING', 10000, 'RED', 'YELLOW', 'image_1569854739944_1000.jpg', 'ETC');
insert into tt_product values('20008', 'AUTUMN STICKER PACK', 4000, '', '', 'image_1572672225053_1000.jpg', 'STICKER');
insert into tt_product values('20009', 'BEBE POUCH', 42000, 'RED', 'YELLOW', 'image_1577179723888_1000.jpg', 'FABRIC');
insert into tt_product values('20010', 'BEBE STRING POUCH', 14000, 'RED', 'YELLOW', 'image_1577182903378_1000.jpg', 'FABRIC');
insert into tt_product values('20011', 'SAVE THE EARTH !', 11000, 'RED', 'YELLOW', 'image_1577183692370_1000.jpg', 'CUP');
insert into tt_product values('20012', 'CHOCO LAPTOP POUCH', 46000, '', '', 'image_1582555482348_1000.jpg', 'POUCH');
insert into tt_product values('20013', 'BEBE PODS [pro]', 13000, 'RED', 'YELLOW', 'image_1582555607174_1000.jpg', 'CASE');
insert into tt_product values('20014', 'MOUSE PAD', 4000, 'RED', 'YELLOW', 'image_1583993533280_1000.jpg', 'ETC');
insert into tt_product values('20015', 'SAUCE TAPE', 5000, 'RED', 'YELLOW', 'image_1589099901666_1000.jpg', 'STATIONERY');
insert into tt_product values('20016', 'Oing LAPTOP POUCH', 46000, '', '', 'image_1590068142814_1000.jpeg', 'POUCH');
insert into tt_product values('20017', 'SMILE CASE', 15000, 'RED', 'YELLOW', 'image_1593357440102_1000.jpeg', 'CASE');
insert into tt_product values('20018', '[Oing] TOK', 10000, 'RED', 'YELLOW', 'image_1593439321965_1000.jpg', 'ETC');
insert into tt_product values('20019', 'YOUR BEBE CASE', 15000, 'RED', 'YELLOW', 'image_1593442826494_1000.jpg', 'CASE');
insert into tt_product values('20020', 'PEACH LAPTOP POUCH', 46000, '', '', 'image_1594205019442_1000.jpg', 'POUCH');
insert into tt_product values('20021', 'MINT LAPTOP POUCH', 46000, '', '', 'image_1594205109338_1000.jpg', 'POUCH');
insert into tt_product values('20022', 'BIG [BEBE] TOK', 12000, 'RED', 'YELLOW', 'image_1594230642268_1000.jpg', 'ETC');
insert into tt_product values('20023', 'COOKIE PEN', 3500, 'RED', 'YELLOW', 'image_1597157754745_1000.jpg', 'STATIONERY');
insert into tt_product values('20024', 'TETEUM STICKERS', 2000, '', '', 'image_1597158728818_1000.jpg', 'STICKER');
insert into tt_product values('20025', 'SMILE PACK', 3000, '', '', 'image_1597242149874_1000.jpg', 'STICKER');
insert into tt_product values('20026', 'BEBE PACK', 4000, '', '', 'image_1597242935031_1000.jpg', 'STICKER');

create table tt_board(
b_no varchar2(5) primary key,
b_type varchar2(6),
b_title varchar2(1000),
id varchar2(50) references tt_member(id),
b_content clob,
b_regdate date
);

create SEQUENCE b_no
INCREMENT by 1
start with 1
MINVALUE 1
noMAXVALUE
NOCYCLE
NOCACHE;

create table tt_cart(
c_num number primary key,
c_no varchar2(5),
c_name varchar2(1000),
c_cnt number,
c_price number,
c_color varchar2(6),
c_img varchar2(1000),
id varchar2(50)
);

create table tt_buyproduct(
buy_date date,
buy_num number,
b_num VARCHAR2(5),
b_img varchar2(1000),
b_name varchar2(1000),
b_color varchar2(6),
b_cnt number,
b_price number,
buy_id VARCHAR2(50)
);

ALTER TABLE tt_buyproduct ADD CONSTRAINT PK_key02 PRIMARY KEY (buy_date, buy_num, b_num);

create table tt_deliveryaddress(
BUY_DATE DATE,
BUY_NUM NUMBER,
D_NAME VARCHAR2(20),
D_PHONE VARCHAR2(15),
D_ZIPCODE VARCHAR2(5),
D_ROADADDRESS VARCHAR2(1000),
D_DETAILADDRESS VARCHAR2(1000),
BUY_ID VARCHAR2(50),
D_DELIVERYREQUEST VARCHAR2(1000)
);

ALTER TABLE tt_deliveryaddress ADD CONSTRAINT PK_key03 PRIMARY KEY (buy_date, buy_num);

alter table tt_cart add constraints fk01 foreign key (id) references tt_member(id); 

alter table tt_cart add constraints fk02 foreign key (c_no) references tt_product(p_no); 

alter table tt_buyproduct add constraints fk03 foreign key (buy_id) references tt_member(id); 

alter table tt_deliveryaddress add constraints fk04 foreign key (buy_id) references tt_member(id);




