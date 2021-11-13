insert into users
    (id, name, email, password)
values (1, 'Adel', 'adel@example.com', '12345'),
       (2, 'Ahmad', 'ahmad@example.com', '12345'),
       (3, 'Jon', 'jon@example.com', '12345'),
       (4, 'Khalel', 'khalel@example.com', '12345'),
       (5, 'Kristoffer', 'kristoffer@example.com', '12345'),
       (6, 'Ritwaan', 'ritwaan@example.com', '12345'),
       (7, 'Wad', 'wad@example.com', '12345');

insert into user_roles (user_id, name)
values (1, 'admin'),
       (2, 'admin'),
       (3, 'admin'),
       (4, 'admin'),
       (5, 'admin'),
       (6, 'admin'),
       (7, 'admin');

INSERT INTO equipment
    (name, kind, price, rent_start_day, comment)
VALUES ('Eksentersliper 230VAC', 'diverse «småutstyr»', 2000, 3, null),
       ('Båndsliper 230VAC', 'diverse «småutstyr»', 2000, 3, null),
       ('Høvel 230VAC', 'diverse «småutstyr» ', 2000, 3, null),
       ('Gjære-/kombisag 230VAC', 'diverse «småutstyr»', 2000, 3, null),
       ('9’ vinkelsliper for stein og betong', 'diverse «småutstyr»', 2000, 3, null),
       ('Meislemaskin, 230VAC', 'diverse «småutstyr»', 2000, 3, null),
       ('Slagdrill, Batteri, Milwaukee', 'diverse «småutstyr»', 2000, 3, null),
       ('Kantklipper - bensin', 'diverse «småutstyr»', 2000, 3, null),
       ('Kompressor, 230VAC', 'diverse «småutstyr»', 2000, 3, null),
       ('Spikerpistol, stor (trykkluft)', 'Spikerpistoler o.l', 2000, 3, null),
       ('Spikerpistol, liten (trykkluft)', 'Spikerpistoler o.l', 2000, 3, null),
       ('Spikerpistol, stor (Milwaukee)', 'Spikerpistoler o.l', 2000, 3, null),
       ('Spikerpistol, mellom (Milwaukee)', 'Spikerpistoler o.l', 2000, 3, null),
       ('Spikerpistol, liten (Milwaukee) ', 'Spikerpistoler o.l', 2000, 3, null),
       ('Vedkløyver, Bensindrevet', 'Utstyr for vedhogst:', 5000, 3, null),
       ('Fliskutter for trevirke', 'Utstyr for vedhogst:', 5000, 3, null),
       ('Tilhenger, boggi; RD 5702', 'Tilhengere', 5000, 3, null),
       ('Tilhenger, liten, RC 8834
Kassemål LxBxH: 197x153x29cm
Nyttelast max. 645kg', 'Tilhengere', 5000, 3, null),
       ('Tilhenger, skap, JP2591
Kassemål innv. LxBxH: 292x154x194cm
(Dørkarm BxH: 146x190cm)
Nyttelast: 1090 kg', 'Tilhengere', 5000, 3, null),
       ('Personløfter, arb.høyde 12m.
SWL 200 kg, 230 VAC', 'Større utstyr', 10000, 0, null),
       ('Strømaggregat, 3.7 kW (Diesel)', 'Større utstyr', 5000, 3, null),
       ('Dekkomleggingsmaskin', 'Større utstyr', -1, 0, 'Egne regler'),
       ('Avbalanseringsmaskin', 'Større utstyr', -1, 0, 'Egne regler'),
       ('Leilighet på Hovden', 'Større utstyr', -1, 0, 'Egne regler. Kontakt resepsjonen hos AMV');
