create database mytestDB;
use mytestDB ;
drop table Reservations;

create table Reservations
(

    ReservationID int not null,
    ReservationDays varchar(255),
    userID int not null ,
    ReservationPrice varchar(255),
    equipmentID int not null,
    rentStartDate date not null,
    constraint Reservations
        primary key (ReservationID),
    constraint FK_userID
      foreign key (userID) references Users (userID),
    constraint FK_equipmentID
        foreign key (equipmentID) references equipments (equipmentID)
);

alter table Reservations
add Returned boolean DEFAULT TRUE;

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values  ('1','1','5','gratis + papir','1','2021-10-18');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('2','4','1','kr,80 + papir','2','2021-10-28');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('3','5','3','kr,100','3','2021-10-05') ;

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('4','10','2','kr,200','4','2021-10-22');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('5','7','5','kr,140','6','2021-10-18');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('6','1','2','gratis','7','2021-10-19');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('7','10','6','kr,200','8','2021-10-11');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('8','9','3','kr,180','11','2021-10-11');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('9','1','4','gratis','7','2021-10-23');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('10','4','2','kr,80','21','2021-10-15');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('11','23','1','kr,460','11','2021-10-29');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('12','27','5','kr,540','9','2021-10-19');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('13','1','3','gratis','17','2021-10-12');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('14','1','1','gratis','11','2021-10-18');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('15','4','2','kr.200','22','2021-10-26');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('16','3','6','kr,150','15','2021-10-31');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('17','9','3','kr,450','24','2021-10-12');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('18','3','2','kr,150','20','2021-10-07');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('19','5','5','kr,250','12','2021-10-18');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('20','1','4','100','7','2021-10-13');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('21','6','3','kr,300','9','2021-10-08');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('22','','1','Egne regler','3','2021-10-14');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('23','','5','Egne regler','6','2021-10-14');

insert into Reservations (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID, rentStartDate)
values ('24','','4','Egne regler','8','2021-10-18' );

# Innsetting av date
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-29' WHERE t.ReservationID = 11;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-18' WHERE t.ReservationID = 19;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-18' WHERE t.ReservationID = 24;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-12' WHERE t.ReservationID = 17;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-05' WHERE t.ReservationID = 3;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-28' WHERE t.ReservationID = 2;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-26' WHERE t.ReservationID = 15;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-13' WHERE t.ReservationID = 20;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-23' WHERE t.ReservationID = 9;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-14' WHERE t.ReservationID = 23;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-08' WHERE t.ReservationID = 21;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-18' WHERE t.ReservationID = 1;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-07' WHERE t.ReservationID = 18;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-22' WHERE t.ReservationID = 4;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-12' WHERE t.ReservationID = 13;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-19' WHERE t.ReservationID = 12;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-14' WHERE t.ReservationID = 22;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-15' WHERE t.ReservationID = 10;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-11' WHERE t.ReservationID = 8;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-11' WHERE t.ReservationID = 7;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-18' WHERE t.ReservationID = 14;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-31' WHERE t.ReservationID = 16;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-19' WHERE t.ReservationID = 6;
UPDATE mytestdb.Reservations t SET t.rentStartDate = '2021-10-18' WHERE t.ReservationID = 5;


