-- 1. 운영자적 관점 SQL : 집계(aggregate) -> 집계함수(aggregate funtion) 제공
-- 집계함수란 테이블의 각 열에 대해 계산하는 함수 (SUM, AVG, COUNT, MIN, MAX ...)

-- 3-15. 고객(customer)이 주문한 도서의 총 판매액을 구하세요
SELECT SUM(saleprice) AS '총매출'
FROM orders;

-- 3-16
SELECT SUM(saleprice) AS '총매출'
FROM orders
WHERE custid = 2;

-- 3-17
SELECT SUM(saleprice) AS 'TOTAL', 
AVG(saleprice) AS 'AVERAGE', 
MIN(saleprice) AS 'MINIMUM', 
MAX(saleprice) AS 'MAXIMUM'
FROM orders;

-- 3-18 count() -> 행의 개수를 셈	/ count(*) -> 전체 튜플의 수를 반환하는데 Null을 제하고 반환
SELECT COUNT(orderid)
FROM orders;

