-- 1) 숫자 함수
-- ABS(숫자) 숫자의 절대값을 반환
-- 상수값 -78과 +78을 대상으로 ABS함수를 수행하여라 (절댓값)
SELECT ABS(-78), ABS(78) FROM DUAL; -- Oracle과 같은 경우 FROM DUAL을 작성해줘야함 (가상테이블)
SELECT ABS(-78), ABS(78); 			-- MySQL은 FROM DUAL을 생략해도 상관 없음

-- CEIL(숫자) 숫자보다 크거나 같은 최소의 정수
-- 10 과 10.1 과 -10.1 을 (10 11 -10) 으로 표현하기
SELECT CEIL(10), CEIL(10.1), CEIL(-10.1);
SELECT ceiling(3.14) AS ceil_value;

-- FLOOR(숫자) 숫자보다 작거나 같은 최소의 정수
-- 10 과 10.1 과 -10.1 을 (10 10 -11) 으로 표현하기
SELECT FLOOR(10),FLOOR(10.1),FLOOR(-10.1);

-- ROUND(숫자,m) 숫자의 반올림, m은 반올림 기준 자릿수
-- 4.875 를 소수 첫째 자리까지 반올림한 값을 구하시오
SELECT ROUND(4.875,1);

-- TRUNCATE(숫자) 숫자를 지정한 소수점 자리수로 잘라낸다.(반올림을 하지 않음)
SELECT truncate(3.141592,2);

-- SIGN(숫자) 숫자가 음수면 -1, 0이면 -0, 양수면 1
SELECT SIGN(3.45);

-- MOD(숫자) 숫자의 나머지를 반환하는 함수
SELECT MOD(10,3);

-- 고객별 평균 주문 금액을 (*백원단위*)로 반올림한 값을 구하시오
select custid , ROUND(AVG(saleprice),-2) from orders group by custid;

-- 2) 문자 함수
-- 지정된 자리에서부터 지정된 길이만큼 잘라서 반환
-- SUBSTR(s,n,k)
SELECT SUBSTR('ABCDEFG',3,4);

-- 양쪽에서 지정된 문자를 삭제 (중앙에 들어간건 삭제 안됨)
-- TRIM(c FROM s)
SELECT TRIM('=' FROM '==BROWNING==');

-- 대상 문자열의 Byte 반환 알파벳 1byte, 한글 3byte (UTF8)
-- LENGTH(s)
SELECT LENGTH('가나다라바사');
SELECT LENGTH('ABCEFG');

-- 문자열의 문자 수를 반환
-- CHAR_LENGTH(s)
SELECT CHAR_LENGTH('데이터');

-- 한문자가 차지하는 바이트의 기준은 데이터베이스시스템에 따라 다르게 적용되는데
-- UTF-8 환경에서는 알파벳 'a' 1byte  한글 '가' -> 3byte 로 저장된다.
-- 그러므로 순수한 문자의 수를 알기 위해서는 CHAR_LENGTH(문자열)을 사용한다.

-- 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오
SELECT bookid, replace(bookname,'야구','농구') bookname FROM book;
-- 원본 데이터는 변경되지 않는다
SELECT bookname FROM book;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수를 확인하세요
select bookname, length(bookname) from book where publisher ='굿스포츠';
-- 서점의 고객중에서 같은 성을 가진 사람이 몇명이나 되는지 성별 인원수를 구하시오.
select substr(name,1,1) 성, count(*) 인원 from customer group by 성;

-- 3) 날짜, 시간 함수
SELECT SYSDATE();
SELECT now();

-- 서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오
select orderdate, ADDDATE(orderdate,interval 10 day) from orders;
-- 서점이 2014년 7월 7일에 주문 받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두보이시오. 단, 주문일은 '%Y-%m-%d' 형태로 표시한다.
select DATE_FORMAT(orderdate,'%Y-%m-%d') AS 주문일, custid, bookid from orders where orderdate = STR_TO_DATE('2024-07-07','%Y-%m-%d');
-- DBMS 서버에 설정된 현재 날짜와 시간, 요일을 확인 하시오.
SELECT SYSDATE();

-- 4) NULL 값 처리
create table Mybook(bookid int, price int);
insert into Mybook values(1,10000);
insert into Mybook values(2,20000);
insert into Mybook values(3,NULL);
commit;

select price+100 from mybook where bookid=3;
select SUM(price), AVG(price), COUNT(price), COUNT(*) FROM mybook;

-- NULL 값을 확인하는 방법 (IS NULL, IS NOT NULL) 아니다 = <>
select * from mybook where price is null;

-- IFNULL 함수 -> NULL 값을 다른 값으로 치환하여 연산한다.
select name, IFNULL(phone,'연락처없음') from customer;
select IFNULL(price,0) price from mybook;

select custid,name,phone from customer limit 2;
-- 고객 목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오.
SET @seq:=0;
select (@seq:=@seq+1) 순번, custid, name, phone from customer;--  where @seq < 2;


use sakila;

-- customer 테이블에서 고객의 이름이 저장된 first_name 열을 조회
desc customer;
-- customer_id 고객을 유일하게 식별하는 식별자
-- store_id store 테이블에서 고객의 '홈스토어'를 식별하는 외래키(FK)
-- first_name : 이름 , last_name : 성
-- email : 고객의 이메일 주소
-- address_id : address 테이블에서 고객의 주소를 식별하는 외래키(FK)
-- active : 고객이 활성화된 고객인지 여부를 저장
-- create_date : 고객이 시스템에 가입된 날짜
-- last_update : 행이 수정되었거나 가장 최근 업데이트 된 시간을 저장
select first_name from customer;

-- select * from customer; 자제 요망
-- ex) 크기 50byte 데이터를 저장할 수 있는 열이 50개, 행이 1만개라 가정하면
--     쿼리 1줄이 -> 50byte * 50 column * 10000 row = 25,000,000byte -> 약 25MB

-- DESC, DESCRIBE 와 동일
SHOW COLUMNS FROM sakila.customer; -- MySQL에서만 사용 가능한 명령어

-- payment 테이블에서 customer_id, amount 열을 조회하는데
-- customer_id 그룹화(고객별) , 그룹별로 amount의 값을 합한 결과를
-- 내림차순 정렬한 결과에 따라 ROW_NUMBER함수로 순위를 부여
desc payment;
select customer_id, count(customer_id) from payment GROUP BY customer_id;

-- 순위 함수 ROW_NUMBER() : 모든 행에 유일한 값으로 순위를 부여
-- (함수를 실행한 결과에 같은 쉬위가 없다. 만약 같은 순위가 있다면 정렬 순서에 따라 순위를 다르게 부여한다.)
-- 순위를 부여하기 위해 OVER (ORDER BY 열)
-- ROW_NUMBER() OVER ([PARTITION BY 열] ORDER BY 열);
SELECT ROW_NUMBER() OVER (ORDER BY amount DESC) AS num, customer_id, amount
FROM (
	SELECT customer_id, SUM(amount) AS amount FROM payment GROUP BY customer_id
) as x;

SELECT ROW_NUMBER() OVER (ORDER BY amount DESC, customer_id DESC) AS num, customer_id, amount
FROM (
	SELECT customer_id, SUM(amount) AS amount FROM payment GROUP BY customer_id
) as x ;

SELECT staff_id,
ROW_NUMBER() OVER(PARTITION BY staff_id ORDER BY amount DESC, customer_id ASC) as num, customer_id, amount
FROM (
	SELECT customer_id, staff_id, SUM(amount) AS amount FROM payment GROUP BY customer_id, staff_id
) as x;

-- RANK() 우선 순위를 고려하지 않고 순위를 부여하는 함수(순위 동률이면 중복 하고 점프시킴 4등,4등이면 5등이 없고 바로 6등)
-- RANK() OVER([PARTITION BY 열] ORDER BY 열)
SELECT RANK() OVER(ORDER BY amount DESC) as num, customer_id, amount, rental_id, last_update
FROM(
	SELECT customer_id, SUM(amount) as amount, rental_id, last_update FROM payment GROUP BY customer_id
) as x;