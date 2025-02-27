use cinemadb;

create table movie(
	movie_id int,
    movie_title varchar(50),
    movie_direcor varchar(30),
    movie_star varchar(30),
    movie_script longtext,
    movie_film longblob
) default charset = utf8mb4; -- longblob,longtext 형식의 한글 처리 문제가 없게 하기 위해 설정

insert into movie values(1, '쉰들러 리스트', '스필버그', '리암 니슨', load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Schidler.txt'), load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Schidler.mp4'));
insert into movie values(2, '쇼생크탈출', '프랭크 다라본트', '팀 로빈슨/모건 프리먼', load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Shawshank.txt'), load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Shawshank.mp4'));
insert into movie values(3, '라스트모히칸', '마이클 만', '다니엘 데이 루이스', load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Mohicans.txt'), load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Mohicans.mp4'));
select * from movie;
commit;
