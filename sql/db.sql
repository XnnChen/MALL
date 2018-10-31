drop database if exists mall;
create database mall;

drop table if exists mall.user;
create table mall.user(
  id int primary key auto_increment comment 'id PK',
  email varchar(255) not null unique comment 'email NN UN',
  password varchar(64) not null comment 'password NN'
) comment 'user table';

drop table if exists mall.user_info;
create table mall.user_info(
  id int primary key auto_increment comment 'id PK',
  username varchar(255) not null comment 'username NN',
  avatar varchar(255) default 'default.png' comment 'avatar',
  mobile varchar(20) comment 'mobile',
  createTime varchar(255) comment 'sign up time',
  updateTime varchar(255) comment 'last sign in time',
  updateIp varchar(255) comment 'last sign in IP address',
  userId int comment 'user id'
) comment 'user info table';

alter table mall.user_info
  add constraint user_info_fk_userId 
foreign key (userId) references mall.user (id);

select *
from mall.user;

select *
from mall.user_info;