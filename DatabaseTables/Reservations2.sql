drop table Reservations2;
use mytestDB ;

create table Reservations2
(

    ReservationID int not null,
    ReservationDays varchar(255),
    userID int not null ,
    ReservationPrice varchar(255),
    equipmentID int not null,
    constraint Reservations
        primary key (ReservationID)
    #constraint FK_userID
     # foreign key (userID) references Users (userID),
   # constraint FK_equipmentID
        #foreign key (equipmentID) references equipments (equipmentID)
);

insert into Reservations2  (ReservationID,ReservationDays, userID,ReservationPrice, equipmentID )
values  ('1','1','5','gratis','1');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('2','4','1','kr,80','2');

insert into Reservations2 (reservationid, reservationdays, userid, reservationprice, equipmentID )
values ('3','5','3','kr,100','3') ;

insert into Reservations2  (reservationid, reservationdays, userid, reservationprice, equipmentID )
values ('4','10','2','kr,200','4');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('5','7','5','kr,140','6');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('6','1','2','gratis','7');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('7','10','6','kr,200','8');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('8','9','3','kr,180','11');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('9','1','4','gratis','7');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('10','4','2','kr,80','21');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('11','23','1','kr,460','11');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('12','27','5','kr,540','9');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('13','1','3','gratis','17');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('14','1','1','gratis','11');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('15','4','2','kr.80','22');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('16','3','6','kr,60','15');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('17','9','3','kr,180','24');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('18','3','2','kr,60','20');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('19','5','5','kr,200','12');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('20','1','4','gratis','7');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('21','6','3','kr,120','9');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('22','8','1','kr,160','3');

insert into Reservations2 (ReservationID, ReservationDays, userID, ReservationPrice, equipmentID )
values ('23','5','5','kr,200','6');

insert into Reservations2(reservationid, reservationdays, userid, reservationprice, equipmentID)
values ('24','1','4','gratis','8');


















