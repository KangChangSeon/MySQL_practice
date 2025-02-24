-- 데이터 조작어(DML) : SELECT, DELETE, UPDATE, INSERT
-- 데이터 정의어(DDL) : CREATE, DROP, ALTER

-- testdb database를 생성해 주세요 sgg@localhost 에 권한 부여 -> root에서 생성하고 권한 부여
use testdb;

-- test_create_table 테이블을 생성하시오, 컬럼은 col_1 int, col_2 varchar(50), col_3 datetime 이다.
create table test_create_table(col_1 int, col_2 varchar(50), col_3 datetime);

-- test_create_table에 1, 'testSQL','2025-01-01' 데이터를 입력하세요
INSERT INTO test_create_table(col_1,col_2,col_3) values(1, 'testSQL','2025-01-01');
INSERT INTO test_create_table(col_1,col_2,col_3) values(1, 'testSQL',now());
INSERT INTO test_create_table(col_1,col_2,col_3) values(1, 'testSQL',now());
INSERT INTO test_create_table(col_1,col_2,col_3) values(1, 'testSQL',now());
INSERT INTO test_create_table(col_1,col_2,col_3) values(1, 'testSQL',now());

INSERT INTO test_create_table values(1, 'testSQL',now());
INSERT INTO test_create_table(col_1) values(2);
INSERT INTO test_create_table(col_1,col_2) values(2,'3');
INSERT INTO test_create_table(col_2,col_1,col_3) values(2,'3',now());

-- 입력된 데이터 학인하세요
SELECT * FROM test_create_table;
rollback;
commit;

-- 여러 데이터를 한번에 삽입
INSERT INTO test_create_table
VALUES (8, 'testSQL',now()),(9, 'testSQL',now()),(10, 'testSQL',now());
commit;

-- test_create_table의 col_1의 컬럼 속성을 변경 col_1의 속성을 int => smallint, not null 속성 추가
ALTER TABLE test_create_table MODIFY col_1 SMALLINT NOT NULL;
desc test_create_table;

-- UPDATE 문으로 데이터 수정
-- UPDATE 테이블이름 SET 열1,열2,열3 (WHERE [열=조건]);
SELECT * FROM test_create_table;
UPDATE test_create_table SET col_2 = 'testSQL_UPDATE' WHERE col_1 = 5;

-- COMMIT 시에는 반영된 데이터 값을 되돌릴 수 없다.
-- DML 작업시 특히 DELETE 작업시 COMMIT 작업은 신중히, 최소시 ROLLBACK 하면 한단계 취소

-- DELECT FROM 테이블이름 [WHERE 열 = 조건];

CREATE TABLE NEWBOOK(
	bookid Integer,
    bookname varchar(20),
    publisher varchar(20),
    price integer,
    primary key(bookid)
);
ALTER TABLE NEWBOOK MODIFY bookname varchar(20) not null;
ALTER TABLE NEWBOOK MODIFY publisher varchar(20) unique;
ALTER TABLE NEWBOOK MODIFY price integer default 10000 check(price>1000);
ALTER TABLE NEWBOOK DROP primary key;
ALTER TABLE NEWBOOK ADD PRIMARY KEY (`bookid`);
desc NEWBOOK;

create table NewCustomer(
	custid INTEGER primary key,
    name varchar(40),
    address varchar(40),
    phone varchar(30)
);

CREATE TABLE NewOrders (
orderid INTEGER,
custid INTEGER NOT NULL,
bookid INTEGER NOT NULL,
saleprice INTEGER,
orderdate DATE,
PRIMARY KEY (orderid),
FOREIGN KEY (custid) REFERENCES NewCustomer(custid),
FOREIGN KEY (bookid) references NEWBOOK(bookid)
);

ALTER TABLE NEWBOOK ADD isbn varchar(13);
ALTER TABLE NEWBOOK MODIFY isbn integer;
ALTER TABLE NEWBOOK DROP COLUMN isbn;
ALTER TABLE NEWBOOK MODIFY bookid int not null;
ALTER TABLE NEWBOOK add primary key(`bookid`);

DROP TABLE NEWBOOK;
DROP TABLE NewCustomer;

-- foreign key(관계 해제) => 테이블을 기준 or 데이터베이스 기준으로 외래키 확인 필요
select * from information_schema.table_constraints where table_name = 'neworders';
ALTER TABLE neworders DROP foreign key `neworders_ibfk_1`;
ALTER TABLE neworders DROP foreign key `neworders_ibfk_2`;

ALTER TABLE neworders add constraint fk_bookid foreign key(bookid) references NEWBOOK(bookid) on delete cascade;
ALTER TABLE neworders add constraint fk_custid foreign key(custid) references NewCustomer(custid) on delete cascade;

select * from newcustomer;
insert into newcustomer values(1, 'sss', 'korea', '010-000-0000');
insert into newcustomer values(1, 'sss', 'korea', '010-000-0000');
update newcustomer set custid = 2 where custid = 1;
delete from newcustomer where custid = 2;
commit;

-- newbook 테이블 책 한권 저장
desc newbook;
insert into newbook values(1, '한 눈으로 보는 세계사', '민응사', 15000);
insert into newbook values(2, '동아시아사', '민응사', 10000);
select * from newbook;

-- neworders 테이블에 custid 1인 고객이 bookid 1인 책을 주문했다 해당 데이터를 입력
-- neworders 테이블에 orderid에 auto_increment 속성을 추가
alter table neworders modify orderid int not null auto_increment;

insert into neworders values(null,1,1,9000,now());
update neworders set bookid=2 where custid =1;
delete from neworders where orderid = 10;
rollback;
select * from neworders;

-- 실습문제
use ssgdb;
DROP table book;
DROP table customer;
DROP table orders;
DROP table test;
DROP table membertbl;
DROP table producttbl;

CREATE TABLE customer(custid INT, name varchar(40), address varchar(50), phone varchar(20));
CREATE TABLE orders(orderid int, custid int, bookid int, saleprice int, orderdate date);
CREATE TABLE book(bookid int, bookname varchar(40), publisher varchar(40), price int);
CREATE TABLE Cust_addr(custid int, addrid int, address varchar(50), phone varchar(20), changeday date, primary key(custid,addrid));

ALTER TABLE Cust_addr MODIFY custid int auto_increment;
INSERT INTO Cust_addr VALUES (null,1, '영국 에인트호번', '010-5000-0001', STR_TO_DATE('2003-07-01','%Y-%m-%d'));
INSERT INTO Cust_addr VALUES (null,1, '영국 맨체스터', '010-5000-0002', STR_TO_DATE('2005-07-01','%Y-%m-%d'));
INSERT INTO Cust_addr VALUES (null,1, '영국 에인트호번', '010-5000-0003', STR_TO_DATE('2013-07-01','%Y-%m-%d'));
INSERT INTO Cust_addr VALUES (null,1, '영국 퀸즈파크', '010-5000-0004', STR_TO_DATE('2021-07-01','%Y-%m-%d'));select * from cust_addr;
commit;

CREATE TABLE cart(cartid int, custid int, bookid int, cartdate date);
INSERT INTO Cart VALUES (1, 1, 1, STR_TO_DATE('2024-07-01','%Y-%m-%d')); 
INSERT INTO Cart VALUES (2, 1, 3, STR_TO_DATE('2024-07-03','%Y-%m-%d'));
INSERT INTO Cart VALUES (3, 1, 5, STR_TO_DATE('2024-07-03','%Y-%m-%d')); 
INSERT INTO Cart VALUES (4, 1, 6, STR_TO_DATE('2024-07-04','%Y-%m-%d')); 
commit;

INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구 아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '배구 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001'); 
INSERT INTO Customer VALUES (3, '김연경', '대한민국 경기도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

INSERT INTO Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2024-07-01','%Y-%m-%d'));
INSERT INTO Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2024-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2024-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2024-07-04','%Y-%m-%d'));
INSERT INTO Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2024-07-05','%Y-%m-%d'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2024-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, STR_TO_DATE( '2024-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2024-07-08','%Y-%m-%d'));
INSERT INTO Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2024-07-09','%Y-%m-%d'));
INSERT INTO Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2024-07-10','%Y-%m-%d'));
commit;

-- 1
SELECT address FROM cust_addr WHERE custid =1;
-- 2
SELECT phone FROM cust_addr where custid=1;
-- 3
SELECT phone FROM cust_addr where custid=1 order by changeday ASC limit 1;
-- 4
select phone from cust_addr where custid=1 AND changeday <= '2024-01-01' order by changeday desc limit 1;

-- 1
select cart.bookid from cart JOIN orders ON cart.bookid = orders.bookid AND cart.custid = orders.custid WHERE cart.custid=1;

-- 2
select cart.bookid from cart JOIN orders ON cart.bookid = orders.bookid AND cart.custid != orders.custid WHERE cart.custid=1;

-- 3
select SUM(book.price) from cart JOIN book ON cart.bookid=book.bookid;