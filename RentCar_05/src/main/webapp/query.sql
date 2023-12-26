create table RentCar(
no number primary key,
name varchar2(20),
category number,
price number,
usepeople number,
company varchar2(50),
img varchar2(50),
info varchar2(500));

/*
자동차식별자
자동차이름
자동자 구분
자동차 가격
자동차 사용가능 인원
자동차 회사
자동차 이미지
자동차 설명
*/

insert into RentCar values(1,'아반테',1,2000,5,'현대','AVANTE.JPG','아반테 자동차입니다.');
insert into RentCar values(2,'BMW',2,4000,5,'BMW','BMW.JPG','BMW 자동차입니다.');
insert into RentCar values(3,'카렌스',2,3500,6,'현대','CARENS.JPG','카렌스 자동차입니다.');
insert into RentCar values(4,'카니발',3,5000,12,'기아','CARNIVAL.JPG','카니발 자동차입니다.');
insert into RentCar values(5,'제네시스',3,4500,5,'현대','GENESIS.JPG','제네시스 자동차입니다.');
insert into RentCar values(6,'i40',2,3000,5,'현대','i40.JPG','i40 자동차입니다.');
insert into RentCar values(7,'K9',3,5000,5,'기아','K9.JPG','K9 자동차입니다.');
insert into RentCar values(8,'모닝',1,1000,4,'기아','MORNIG.JPG','모닝 자동차입니다.');
insert into RentCar values(9,'레이',1,1500,4,'기아','RAY.JPG','레이 자동차입니다.');
insert into RentCar values(10,'산타페',3,4500,7,'현대','SANTAFE.JPG','산타페 자동차입니다.');
insert into RentCar values(11,'SM3',1,2800,5,'르노삼성','SM3.JPG','SM3 자동차입니다.');
insert into RentCar values(12,'SM5',2,3800,5,'르노삼성','SM5.JPG','SM5 자동차입니다.');
insert into RentCar values(13,'SM7',3,6000,5,'르노삼성','SM7.JPG','SM7 자동차입니다.');
insert into RentCar values(14,'소울',1,2000,4,'기아','SOUL.JPG','기아 자동차입니다.');
insert into RentCar values(15,'스포티지',3,6000,5,'기아','SPORTAGE.JPG','스포티지 자동차입니다.');

// 장바구니 테이블
create table rentjang(
no number,
img varchar2(50) ,
name varchar2(20),
cnt number,
price number);
