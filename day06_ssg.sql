use cinemadb;
create table 극장(극장번호 int auto_increment primary key, 극장이름 varchar(20), 위치 varchar(20));

create table 상영관(극장번호 int, 
상영관번호 int CHECK(상영관번호 between 1 and 10),
영화제목 varchar(40), 
가격 int CHECK(가격  < 20000) ,
좌석수 int, 
constraint 상영관_fk foreign key(극장번호) references 극장(극장번호));

create table 고객(고객번호 int primary key, 이름 varchar(40), 주소 varchar(20));

create table 예약(극장번호 int, 상영관번호 int, 고객번호 int, 좌석번호 int, 날짜 datetime, Unique(고객번호,좌석번호),
constraint 예약_극장번호_fk foreign key(극장번호) references 극장(극장번호)
);

insert into 극장 values(1,'롯데','잠실');
insert into 극장 values(2,'메가','강남');
insert into 극장 values(3,'대한','잠실');
commit;

insert into 상영관 values(1,1,'어려운 영화',15000,48);
insert into 상영관 values(3,1,'멋진 영화',7500,120);
insert into 상영관 values(3,2,'재밌는 영화',8000,110);
commit;

insert into 고객 values(3,'홍길동','강남');
insert into 고객 values(4,'김철수','잠실');
insert into 고객 values(9,'박영희','강남');
commit;

insert into 예약 values(3,2,3,15,'2024-09-01');
insert into 예약 values(3,1,4,16,'2024-09-01');
insert into 예약 values(1,1,9,48,'2024-09-01');
-- 1-1
SELECT 극장이름, 위치 FROM 극장;
-- 1-2
SELECT * FROM 극장 WHERE 위치 = '잠실';
-- 1-3
SELECT 이름 FROM 고객 WHERE 주소 = '잠실' ORDER BY 이름 ASC;
-- 1-4
SELECT 극장번호,상영관번호,영화제목 FROM 상영관 WHERE 가격 <= 8000;
-- 1-5
SELECT 고객.고객번호,고객.이름,고객.주소,극장.위치 FROM 고객 JOIN 극장 ON 고객.주소 = 극장.위치;
-- 2-1
SELECT COUNT(극장번호) FROM 극장;
-- 2-2
select AVG(가격) FROM 상영관;
-- 2-3
SELECT COUNT(고객번호) FROM 예약 WHERE 날짜 = '2024-09-01';
-- 3-1
select 영화제목 from 상영관 where 극장번호 = 3;
-- 3-2
select 고객.이름 FROM 고객 JOIN 예약 ON 고객.고객번호 = 예약.고객번호 WHERE 예약.극장번호 = 3;
-- 3-3
select SUM(가격) from 상영관 where 극장번호 = 3;
-- 4-1
select 극장.극장이름,COUNT(상영관.상영관번호) from 상영관 JOIN 극장 ON 극장.극장번호 = 상영관.극장번호 group by 극장.극장번호;
-- 4-2
select 상영관.상영관번호,상영관.영화제목,상영관.가격,상영관.좌석수,극장.위치 from 상영관 JOIN 극장 ON 극장.극장번호=상영관.극장번호 group by 상영관.상영관번호 having 극장.위치 = '잠실';
select * from 상영관;
-- 4-3
select 극장번호, COUNT(고객번호) * 1.0 / COUNT(DISTINCT 고객번호) from 예약 WHERE 날짜='2024-09-01' group by 극장번호;
-- 4-4
select 상영관.영화제목,count(예약.고객번호) from 상영관 JOIN 예약 ON 예약.상영관번호 = 상영관.상영관번호 and 상영관.극장번호 = 예약.극장번호 group by 상영관.영화제목 order by count(예약.고객번호) desc limit 1;

-- 5-1
insert into 극장 values(4,'신세계','삼성');
insert into 상영관 values(4,3,'슬픈 영화',9000,100);
insert into 고객 values(5,'강감찬','삼성');
insert into 예약 values(4,3,5,20,'2025-02-25');
commit;
-- 5-2
SET SQL_SAFE_UPDATES = 0;
update 상영관 set 가격 = 가격 *1.1;
select 가격 from 상영관;
SET SQL_SAFE_UPDATES = 1;


-- 1
create table Salesperson(name varchar(20) primary key, age int, salary int);
create table Customer(name varchar(20) primary key, city varchar(20), industrytype varchar(20));

create table `Order`(number int, custname varchar(20), salesperson varchar(20), amount int, 
constraint order_fk_name foreign key(custname) references Customer(name),
constraint order_fk_sales foreign key(salesperson) references Salesperson(name)
);
-- 2
select name, salary from salesperson;
-- 3
select name from salesperson where age <30;
-- 4
select name from customer where city like '%S';
-- 5
select count(distinct o.custname) from `order` o join customer c on o.custname = c.name;
-- 6
select o.salesperson, count(o.number) from `order` o join salesperson s on o.salesperson = s.name group by o.salesperson;
-- 7
select name, age from salesperson where name IN(select salesperson from `order` where custname IN(select name from customer where city like '%LA%'));
-- 8
select s.name, s.age from salesperson s join `order` o on s.name=o.salesperson join customer c on c.name = o.custname and c.city like '%LA%';
-- 9
select s.name from salesperson s join `order` o on s.name = o.salesperson group by s.name having count(o.salesperson) >= 2;
-- 10
update salesperson set salary=45000 where name ='TOM';

-- 1
create table Employee(empno int primary key, name varchar(20) not null, phoneno varchar(20), address varchar(40), sex char(20) not null, position varchar(20), deptno int not null);
create table Project(projno int primary key, projname varchar(20) not null, deptno int not null);
create table Department(deptno int primary key, deptname varchar(20) not null, manager int, constraint dp_managet_fk foreign key(manager) references Employee(empno));
create table Works(empno int, projno int, hours_worked int, constraint wk_empno_fk foreign key(empno) references Employee(empno), constraint wk_projno_fk foreign key(projno) references Project(projno));
-- 2
select name from employee;
-- 3
select name from employee where sex = 'W';
-- 4
select e.name from employee e join department d on e.empno = d.manager;
-- 5
select e.name, e.address from employee e join department d on e.deptno = d.deptno and d.deptname = 'IT';
-- 6
select count(empno) from employee where deptno IN (select e.deptno from employee e join department d on e.empno = d.manager and e.name ='홍길동');
-- 7 
select e.deptno, sum(w.hours_worked) from employee e join works w on e.empno = w.empno group by e.deptno order by e.deptno, e.name asc;
-- 8
select p.projno, p.projname, count(e.empno) from project p join works w on w.projno = p.projno join employee e on e.empno = w.empno group by p.projno having count(e.empno) >= 2;
-- 9 
select e.name, d.deptno from employee e join department d on e.deptno=d.deptno where e.deptno IN (select deptno from employee group by deptno having count(empno) >=3);