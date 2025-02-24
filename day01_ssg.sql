use ssgdb;
select * from test;

use ssgdb;
create table test(id smallint unsigned not null auto_increment primary key,name varchar(20) not null);
select * from test;
insert into test(id,name) values (1,'SampleTest data');
insert into test(id,name) values (null, 'sample test data2');
commit;
show databases;

select * from test;