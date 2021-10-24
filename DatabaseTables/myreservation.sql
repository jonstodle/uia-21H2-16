
use mytestDB;
create table Reservations3
(

    ReservationID int not null,
    ReservationDate varchar(255),
    userID int not null ,
    ReservationPrice int not null,
    equipmentID int not null,
    constraint Reservations
        primary key (ReservationID),
    constraint FK_userID
        foreign key (userID) references Users (userID),
    constraint FK_equipmentID
        foreign key (equipmentID) references equipments (equipmentID)
);


insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('1','24','3',2022-01-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('2','23','5',2021-02-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('3','22','2',2021-03-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('4','21','3',2021-04-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('5','20','5',2021-05-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('6','19','5',2021-06-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('7','18','1',2021-07-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('8','17','4',2021-08-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('9','16','5',2021-09-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('10','15','6',2021-10-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('11','14','4',2021-11-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('12','13','5',2021-12-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('13','12','3',2023-01-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('14','11','1',2023-02-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('15','10','2',2021-03-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('16','9','1',2023-04-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('17','8','4',2023-05-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('18','7','2',2023-06-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('19','6','5',2023-07-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('20','5','3',2023-08-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('21','4','6',2023-09-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('22','3','1',2023-10-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('23','2','4',2023-11-01,'20');

insert into Reservations3(ReservationID, equipmentID, UserID, ReservationDate, ReservationPrice)
values ('24','1','2',2023-12-01,'20');









