CREATE DATABASE ssgdb; -- root 계정으로 ssgdb 사용자 정의 데이터베이스 생성
create user ssg@localhost identified by 'ssg'; -- ssgdb 데이터베이스를 사용하는 사용자 'ssg' 사용자 패스워드 'ssg'
grant all privileges on ssgdb.* to ssg@localhost; -- ssg@localhost에게 ssgdb에 대한 모든 접근권한을 부여하겠다.

show databases;
use ssgdb;
create table test(id smallint unsigned not null auto_increment primary key,name varchar(20) not null);
show tables;
insert into test(id,name) values (1,'SampleTest data');
select * from test;