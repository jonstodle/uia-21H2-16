create database if not exists amv;

use amv;

create table if not exists users
(
    id       int unique auto_increment primary key,
    name     text not null,
    email    text not null,
    password text not null
);

create table if not exists user_roles
(
    user_id int          not null,
    name    varchar(255) not null,
    primary key (user_id, name),
    constraint FK_user_id foreign key (user_id) references users (id)
);

create table if not exists equipment
(
    id             int unique auto_increment primary key,
    name           text not null,
    category       int  not null,
    price          int  not null,
    rent_start_day int  not null,
    comment        text null
);

create table if not exists reservation
(
    id            int unique auto_increment primary key,
    user_id       int  not null,
    equipment_id  int  not null,
    start_date    date not null,
    returned_date date null,
    constraint FK_user_id foreign key (user_id) references users (id),
    constraint FK_equipment_id foreign key (equipment_id) references equipment (id)
);
