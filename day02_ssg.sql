use ssgdb;
-- ssgdb 데이터베이스의 모든 테이블 이름 리스트를 출력하라
show tables;

-- booke 테이블의 bookname, publisher 컬럼의 정보를 출력하라
select bookname, publisher from book;

-- book 테이블의 전체 정보 리스트
select * from book;

SELECT bookname, publisher
FROM book
WHERE price <= 10000;

-- Oracle, MySQL, MariaDB, PostgreeSQL 관계형 데이터베이스(RDBMS)

-- book 테이블의 구조 확인
describe book;
desc book;

use shopdb;
create table memberTBL(
memberID varchar(8) NOT NULL,
memberName varchar(10) not null,
memberAddress varchar(20),
primary key(memberID)
);
drop table memberTBL;

create table productTBL(
-- productID int auto_increment,
productName char(4) NOT NULL,
cost INT NOT NULL,
makeDate DATE
-- primary key(productID)
);
-- 테이블 삭제
drop table productTBL;
-- 테이블 수정 (productID 새로운 컬럼 추가)
alter table productTBL ADD column productID int NOT null unique;
-- 테이블 수정 (productID 컬럼 삭제)
alter table productTBL drop column productID;
-- 열 이름 수정(cost -> price)
alter table productTBL change column cost price int;
-- 새로운 컬럼 productID 컬럼을 맨 앞에 추가
alter table productTBL add column productID int not null first;
-- 테이블에 지정 컬럼 뒤에 추가(price 뒤에 descript 추가)
alter table productTBL add column descript varchar(100) not null after price;
-- 컬럼 타입 변경
ALTER TABLE productTBL MODIFY COLUMN price SMALLINT;

desc membertbl;
desc producttbl;
commit;

show tables;


use ssgdb;
desc book;
SELECT bookname, price
FROM book;

SELECT price, bookname
FROM book;

SELECT *
FROM book;

-- 중복 제거 하고 출력
SELECT DISTINCT publisher
FROM book;

SELECT *
FROM book
WHERE price < 20000;

SELECT *
FROM book
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM book
WHERE publisher IN('굿스포츠','대한미디어');

-- 문자열의 패턴을 비교할 때 LIKE 연산자 사용
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '축구의 역사';

SELECT bookname, publisher
FROM book
WHERE bookname LIKE '%축구%';

SELECT bookid, bookname, publisher
FROM book
WHERE bookname LIKE '_구%';

SELECT *
FROM book
WHERE bookname LIKE '%축구%' AND price >=20000;

SELECT *
FROM book
WHERE publisher IN('굿스포츠','대한미디어');

-- order by 컬럼 오름차순(asc) 내림차순(desc)
SELECT *
FROM book
ORDER BY bookname ASC;

-- ORDER BY 절을 사용하면 특정 순서를 지정하여 출력할 수 있다.
SELECT *
FROM book
ORDER BY price, publisher;

SELECT *
FROM book
ORDER BY price DESC, publisher ASC;
