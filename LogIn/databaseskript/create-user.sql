create database if not exists amv;
use amv;

create table if not EXISTS user
(
    id       integer UNIQUE auto_increment primary key,
    name     varchar(255),
    email    varchar(255),
    password varchar(255)
);
create table if not exists user_roles
(
    email varchar(255) not null,
    name  varchar(255) not null,
    primary key (email, name)
);


insert into user (name, email, password)
values ('Adel', 'adel@example.com', '12345'),
       ('Ahmad', 'ahmad@example.com', '12345'),
       ('Jon', 'jon@example.com', '12345'),
       ('Khalel', 'khalel@example.com', '12345'),
       ('Kristoffer', 'kristoffer@example.com', '12345'),
       ('Ritwaan', 'ritwaan@example.com', '12345'),
       ('Wad', 'wad@example.com', '12345');
insert into user_roles (email, name)
values ('adel@example.com', 'admin'),
       ('ahmad@example.com', 'admin'),
       ('jon@example.com', 'admin'),
       ('khalel@example.com', 'admin'),
       ('kristoffer@example.com', 'admin'),
       ('ritwaan@example.com', 'admin'),
       ('wad@example.com', 'admin');
