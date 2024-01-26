-- rentcar(렌터카 상품) 테이블
create table RentCar(
no int,
name varchar(20),
category int,
price int,
usepeople int,
company varchar(50),
img varchar(50),
info varchar(500));

-- rentjang(장바구니) 테이블
create table rentjang2(
no int,
img varchar(50) ,
name varchar(20),
cnt int,
price int);

-- order_product(구매정보) 테이블
create table order_product(
order_date date,
order_no int,
no int,
img varchar(50),
name varchar(20),
cnt int,
price int,
total int,
id varchar(50),
primary key(order_date,order_no,no)
);

-- order_address(구매 배송지 정보)테이블
create table order_address(
order_date date,
order_no int,
buy_name varchar(20),
buy_phone varchar(20),
buy_email varchar(50),
buy_postcode int,
buy_roadaddress varchar(100),
id varchar(50),
primary key(order_date,order_no));

-- member(회원)테이블
create table memberjoin(
id varchar(20) primary key,
pw varchar(20),
email varchar(50),
tel varchar(20),
hobby varchar(60),
job varchar(15),
age varchar(10),
info varchar(500));



