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
  username varchar(255) comment 'username',
  avatar varchar(255) default 'default.png' comment 'avatar',
  mobile varchar(20) comment 'mobile',
  createTime varchar(255) comment 'sign up time',
  updateTime varchar(255) comment 'last sign in time',
  updateIp varchar(255) comment 'last sign in IP address',
  userId int comment 'user id'
) comment 'user info table';

drop table if exists mall.product;
create table mall.product (
  id             int primary key         auto_increment
  comment 'id PK',
  title          varchar(255)   not null
  comment '名称 NN',
  `desc`         text comment '描述',
  price          decimal(10, 2) not null
  comment '价格 NN',
  originalPrice  decimal(10, 2) comment '原价',
  coverPicture   varchar(255)   not null
  comment '封面图片 NN',
  slidePictures  text           not null
  comment '幻灯图片组 NN',
  detailPictures text           not null
  comment '详情图片组 NN',
  spec           varchar(255)   not null
  comment '规格 NN',
  stock          int            not null
  comment '库存数量 NN',
  status         int            not null default 0
  comment '状态：0- 1- 2-',
  createTime     datetime       not null
  comment '创建时间 NN',
  updateTime     datetime comment '更新时间',
  categoryId     int comment 'category id FK'
) comment 'product table';

drop table if exists mall.category;
create table mall.category (
  id         int auto_increment primary key
  comment 'id PK',
  title      varchar(255) not null
  comment 'title NN',
  `desc`     varchar(255)
  comment 'describe',
  parentId   int comment 'parent category id',
  status     int default 0
  comment 'status 0- 1-',
  createTime datetime     not null
  comment 'create time NN',
  updateTime datetime comment 'update time'
) comment 'category table';


alter table mall.user_info
  add constraint user_info_fk_userId
foreign key (userId) references mall.user (id);

alter table mall.product
  add constraint product_fk_category
foreign key (categoryId) references mall.category (id);

insert into mall.category (title, createTime)
value ('中外名酒', now());
insert into mall.category (title, createTime)
value ('茗茶', now());
insert into mall.category (title, createTime)
value ('饮料', now());
insert into mall.category (title, createTime)
value ('冲调饮品', now());
insert into mall.category (title, createTime)
value ('进口饮品', now());

select *
from mall.user;

select *
from mall.user_info;

select *
from mall.category;

select *
from mall.product;

select *
from mall.category c1
       inner join mall.category c2 on c1.id = c2.parentId;

select *
from mall.product
limit 3 offset 0;

