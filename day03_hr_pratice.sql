-- SQLPratice 01
-- 1. SQL의 풀네임과 간단한 정의를 기술하세요
	-- Structure Query Language
-- 2. SQL 언어 종류 3가지를 기술하세요
	-- Oracle, MySQL, Postgree
-- 3. 각 언어의 대표 명령어 작성하세요
	-- CREATE, READ, UPDATE, DELETE
-- 4. SELECT 명령어의 전체 구조를 기술하세요 
	-- SELCT * FROM 을 기본으로 두고 WHERE절을 사용하거나 ORDER BY 등을 통해 원하는 데이터를 뽑아낼수 있는 명령어 
-- -----------------------------------------------------------------------------------------------------------
-- SQLPratice 02
 
-- 1. 강사강의자료 < 2 MySQL 기반 데이터베이스 < data 디렉토리 < demo_hr.sql 을 이용하여 source 명령어를 이용하여 hr데이터베이스와 데이터를 생성하세요
	-- cmd -> mysql -u root -p -> 비밀번호 입력 -> source demo_hr.sql
-- 2. 사용자 : hr 계정을 만들고 비밀번호는 hr 로 생성하세요
	-- create user hr identified by 'hr';
-- 3. hr계정 사용자에게 hr데이터베이스 접근 권한을 모두 부여하세요 
	-- grant all privileges on hr.* TO hr;
-- 4. hr 계정 테이블관계와 테이블간의 구조를 확인하세요 
	-- show databases;
	-- show tables;
-- 5. hr계정으로 접속하여 hr데이터베이스에 접속하세요
	-- -- use hr;
-- -----------------------------------------------------------------
-- SQLPratice 03 
-- 슬랙에 올려드린 테이블을 분석하여 ssg 계정에서 ssgdb데이터베이스에 테이블을 만드세요 

-- 테이블 수정 (product_ID 새로운 컬럼 추가하세요. 정수형(int)이며 널을 허용하지 않으며 유일한 속성을 가집니다.)

-- 테이블 수정 ( product_ID 컬럼 삭제)

-- cost 컬럼의 이름을 정수형 (int) pay 로 변경하세요


-- productName 컬럼 앞에 product_ID 컬럼을 추가 


-- 테이블에 pay  컬럼 뒤에 amount (수량) int형 컬럼을  추가 하세요


-- amount 컬럼의  타입을 smallint 로 변경 
