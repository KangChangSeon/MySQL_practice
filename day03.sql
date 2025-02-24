create database sakiladb;
create user sakila@localhost identified by 'sakila';
grant all privileges on sakila.* TO sakila@localhost;