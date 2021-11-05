create database mytestDB;
use database;
create table equipments
(
    equipmentID   int                      not null
        primary key,
    equipmentName varchar(255)              null,
    kind          varchar(255)              null,
    initialPrice  char(255) charset utf8mb3 null,
    price         char(255) charset utf8mb3 null
);
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (1, 'Eksentersliper 230VAC ', 'diverse «småutstyr»:', 'Gratis + papir', 'Kr. 20,- + papir');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (2, 'Båndsliper 230VAC', 'diverse «småutstyr»:', 'Gratis + papir', 'Kr. 20,- + papir');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (3, 'Høvel 230VAC ', 'diverse «småutstyr»: ', 'Gratis', 'Kr. 20,-
');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (4, 'Gjære-/kombisag 230VAC ', 'diverse «småutstyr»:', 'Gratis', 'Kr. 20,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (5, '9’ vinkelsliper for stein og betong ', '– diverse «småutstyr»: ', 'Gratis', 'Kr. 20,-
');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (6, 'Meislemaskin, 230VAC ', '– diverse «småutstyr»:', 'Gratis', 'Kr. 20,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (7, 'Slagdrill, Batteri, Milwaukee', 'diverse «småutstyr»:', 'Gratis', 'Kr. 20,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (8, 'Kantklipper - bensin', 'diverse «småutstyr»:', 'Gratis', 'Kr. 20,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (9, 'Kompressor, 230VAC', 'diverse «småutstyr»:', 'Gratis', 'Kr. 20,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (10, 'Spikerpistol, stor (trykkluft) ', 'Spikerpistoler o.l', 'Gratis', 'Kr. 20,');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (11, 'Spikerpistol, liten (trykkluft) ', 'Spikerpistoler o.l', 'Gratis', 'Kr. 20,-
');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (12, 'Spikerpistol, stor (Milwaukee)', 'Spikerpistoler o.l', 'Gratis', 'Kr. 20,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (13, 'Spikerpistol, mellom (Milwaukee)', 'Spikerpistoler o.l', 'Gratis', 'Kr. 20,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (14, 'Spikerpistol, liten (Milwaukee) ', 'Spikerpistoler o.l', 'Gratis', 'Kr. 20,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (15, 'Vedkløyver, Bensindrevet', 'Utstyr for vedhogst:', 'Gratis', 'Kr. 50,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (16, 'Fliskutter for trevirke ', 'Utstyr for vedhogst:', 'Gratis', 'Kr. 50,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (17, 'Tilhenger, boggi; RD 5702 ', 'Tilhengere', 'Gratis', 'Kr. 50,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (18, 'Tilhenger, liten, RC 8834
Kassemål LxBxH: 197x153x29cm
Nyttelast max. 645kg', 'Tilhengere', 'Gratis', 'Kr. 50,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (19, 'Tilhenger, skap, JP2591
Kassemål innv. LxBxH: 292x154x194cm
(Dørkarm BxH: 146x190cm)
Nyttelast: 1090 kg', 'Tilhengere', 'Gratis', 'Kr. 50,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (20, 'Personløfter, arb.høyde 12m.
SWL 200 kg, 230 VAC', 'Større utstyr', 'Kr. 100,-', 'Kr. 100,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (21, 'Strømaggregat, 3.7 kW (Diesel)', 'Større utstyr', 'Gratis', 'Kr. 50,-');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (22, 'Dekkomleggingsmaskin', 'Større utstyr', 'Egne regler', '');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (23, 'Avbalanseringsmaskin', 'Større utstyr', 'Egne regler', '');
INSERT INTO mytestdb.equipments (equipmentID, equipmentName, kind, initialPrice, price) VALUES (24, 'Leilighet på Hovden ', 'Større utstyr ', 'Egne regler', 'Kontakt resepsjonen hos
AMV');
