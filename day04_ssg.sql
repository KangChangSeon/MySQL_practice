SELECT * FROM customer CROSS JOIN orders;
-- SELCT * FROM customer, orders; 와 같음

SELECT COUNT(custid) FROM customer; -- 5명
SELECT COUNT(orderid) FROM orders;  -- 10명
-- CROSS JOIN(조건이 없는 테이블 간의 조인) -> 5 * 10 = 50개의 튜플이 출력됨

-- 고객과 고객의 주문에 관한 데이터를 모두 출력하시오. (동등 조인, equi join)
SELECT * FROM customer, orders WHERE customer.custid = orders.custid ORDER BY customer.custid;

-- 3-23
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid ASC;

-- 3-24
SELECT c.name, SUM(o.saleprice)
FROM customer c, orders o
WHERE c.custid = o.custid
GROUP BY c.name
ORDER BY c.name;

-- 3-25
SELECT c.name, b.bookname
FROM customer c, book b, orders o
WHERE c.custid = o.custid AND b.bookid = o.bookid;

-- 3-26
SELECT c.name, b.bookname
FROM customer c, book b, orders o
WHERE c.custid = o.custid
	AND b.bookid = o.bookid
    AND b.price = 20000;
    
SELECT c.name, b.bookname, b.price
FROM customer c, book b, orders o
WHERE c.custid = o.custid
	AND b.bookid = o.bookid
    AND b.price >= 20000;
    
-- 3-27
SELECT c.name, o.saleprice
FROM customer c LEFT OUTER JOIN orders o
ON c.custid = o.custid;
-- RIGHT OUTER JOIN을 하면 orders에 custid가 없는 박세리(null) 은 출력되지 않음

SELECT MAX(price) from book;
SELECT bookname FROM book WHERE price = 35000;
-- 두 개의 질의를 하나의 질의로 만들 수는 없을까? subquery(부속질의 = 중첩질의) nested query로 해결 가능하다.
SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) from book);
-- subquery 결과는 테이블로 반환됨 

-- 단일행 - 단일열 (1*1) - 연산자 =
-- 다중행 - 단일열 (n*1) - 연산자 IN / 도서를 구매한적이 있는 고객의 이름을 출력하세요.
-- 단일행 - 다중열 (1*n) - 연산자
-- 다중행 - 다중열 (n*n) - 

-- 도서를 구매한적이 있는 고객의 이름을 출력하세요.
SELECT custid FROM orders;
SELECT name FROM customer WHERE custid in(1,2,3,4);

SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- 3-30
SELECT DISTINCT publisher FROM book WHERE publisher = '대한미디어';
SELECT custid FROM orders WHERE bookid IN(3,4);
SELECT name FROM customer WHERE custid IN (1);
-- 부속질의 간에는 상하관계가 있다. 먼저 하위 부속질의를 실행하고, 그 결과를 이용해서 상위 부속질의를 실행한다.

SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders WHERE bookid IN
	(SELECT bookid from book where publisher = '대한미디어'));

-- 상관 부속질의 (correlated subquery) 상위 부속질의와 하위 부속질의가 독립적이지 않고 서로 관련을 맺고 있다.
SELECT * FROM book WHERE publisher = '굿스포츠';
SELECT bookname, AVG(price) FROM book GROUP BY publisher;

SELECT b1.bookname, b1.price
FROM book b1 -- 튜플 변수
WHERE b1.price >= (
	SELECT AVG(b2.price)
    FROM book b2
    WHERE b2.publisher = b1.publisher
);
