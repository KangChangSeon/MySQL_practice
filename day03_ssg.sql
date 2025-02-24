create table memberTBL(memberID char(8) NOT NULL, memberName char(5) NOT NULL, memberAddress char(20));
create table productTBL(productName char(4) NOT NULL, cost INT NOT NULL, makeDate DATE, company char(5), amount INT NOT NULL);

ALTER TABLE productTBL ADD COLUMN productID INT NOT NULL PRIMARY KEY;
ALTER TABLE productTBL drop productID;
ALTER TABLE productTBL CHANGE cost pay INT;
ALTER TABLE productTBL ADD COLUMN productID INT NOT NULL PRIMARY KEY FIRST;
ALTER TABLE productTBL DROP amount;
ALTER TABLE productTBL ADD COLUMN amount INT AFTER pay;
ALTER TABLE productTBL ADD COLUMN descript varchar(50) AFTER pay;
ALTER TABLE productTBL MODIFY COLUMN amount SMALLINT;
ALTER TABLE productTBL MODIFY COLUMN descript TEXT;


-- GROUP BY절 사용하면 속성값이 같은 값끼리 그룹을 만들 수 있다.
-- 3-19
SELECT custid AS CUSTID, count(bookid) AS '도서수량', SUM(saleprice) AS '총액'
FROM orders
GROUP BY custid;

-- HAVING 절
-- 3-20
-- SELECT문 수행 순서
SELECT custid AS '고객아이디', count(bookid) AS '도서수량' -- 5번
FROM orders					-- 1번
WHERE saleprice >= 8000		-- 2번
GROUP BY custid				-- 3번
HAVING count(bookid) >= 2	-- 4번
ORDER BY custid;			-- 6번

-- 연습문제
-- 1-1
SELECT bookname
FROM book
WHERE bookid LIKE 1;

-- 1-2
SELECT bookname
FROM book
WHERE price >= 20000;

-- 1-3
SELECT SUM(saleprice)
FROM orders
WHERE custid LIKE 1;

-- 1-4
SELECT COUNT(bookid)
FROM orders
WHERE custid LIKE 1;

-- 2-1
SELECT COUNT(bookid)
FROM book;

-- 2-2
SELECT DISTINCT COUNT(publisher)
FROM book;

-- 2-3
SELECT name, address
FROM customer;

-- 2-4
SELECT orderid
FROM orders
WHERE orderdate BETWEEN STR_TO_DATE('2024-07-04','%Y-%m-%d') AND STR_TO_DATE('2024-07-07','%Y-%m-%d');

-- 2-5
SELECT orderid
FROM orders
WHERE orderdate NOT BETWEEN STR_TO_DATE('2024/07/04','%Y/%m/%d') AND STR_TO_DATE('2024/07/07','%Y/%m/%d');

-- 2-6
SELECT name, address
FROM customer
WHERE name LIKE '김%';

-- 2-7
SELECT name, address
FROM customer
WHERE name LIKE '김%' AND name LIKE '%아';
-- WHERE name LIKE '김%아';

