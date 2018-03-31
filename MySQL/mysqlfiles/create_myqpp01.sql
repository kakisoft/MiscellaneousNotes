# comment
-- comment
/*
comment
*/
drop database if exists myapp01;
create database myapp01;
#create user myapp01_user01@localhost identified by 'password';
grant all on myapp01.* to myapp01_user01@localhost identified by 'password';


