insert into users
    (id, name, email, password, salt, is_admin)
values (1, 'Adel', 'adel@example.com',
        'v0AMKhy8LFU2rsQgGIZO21c47Wm/VIigF6GurSH4iK4FoTwvMN4ASkpvpO7euMjWL3lxKk+EiefspAjlezbCUA==', '1234', true),
       (2, 'Ahmad', 'ahmad@example.com',
        'v0AMKhy8LFU2rsQgGIZO21c47Wm/VIigF6GurSH4iK4FoTwvMN4ASkpvpO7euMjWL3lxKk+EiefspAjlezbCUA==', '1234', true),
       (3, 'Jon', 'jon@example.com',
        'v0AMKhy8LFU2rsQgGIZO21c47Wm/VIigF6GurSH4iK4FoTwvMN4ASkpvpO7euMjWL3lxKk+EiefspAjlezbCUA==', '1234', true),
       (4, 'Khalel', 'khalel@example.com',
        'v0AMKhy8LFU2rsQgGIZO21c47Wm/VIigF6GurSH4iK4FoTwvMN4ASkpvpO7euMjWL3lxKk+EiefspAjlezbCUA==', '1234', true),
       (5, 'Kristoffer', 'kristoffer@example.com',
        'v0AMKhy8LFU2rsQgGIZO21c47Wm/VIigF6GurSH4iK4FoTwvMN4ASkpvpO7euMjWL3lxKk+EiefspAjlezbCUA==', '1234', true),
       (6, 'Ritwaan', 'ritwaan@example.com',
        'v0AMKhy8LFU2rsQgGIZO21c47Wm/VIigF6GurSH4iK4FoTwvMN4ASkpvpO7euMjWL3lxKk+EiefspAjlezbCUA==', '1234', true),
       (7, 'Wad', 'wad@example.com',
        'v0AMKhy8LFU2rsQgGIZO21c47Wm/VIigF6GurSH4iK4FoTwvMN4ASkpvpO7euMjWL3lxKk+EiefspAjlezbCUA==', '1234', true);

insert into equipment
    (name, category, price, rent_start_day, max_rental_days, comment)
values ('Eksentersliper 230VAC', 1, 2000, 3, 3, null),
       ('Båndsliper 230VAC', 1, 2000, 3, 3, null),
       ('Høvel 230VAC', 1, 2000, 3, 3, null),
       ('Gjære-/kombisag 230VAC', 1, 2000, 3, 3, null),
       ('9’ vinkelsliper for stein og betong', 1, 2000, 3, 3, null),
       ('Meislemaskin, 230VAC', 1, 2000, 3, 3, null),
       ('Slagdrill, Batteri, Milwaukee', 1, 2000, 3, 3, null),
       ('Kantklipper - bensin', 1, 2000, 3, 3, null),
       ('Kompressor, 230VAC', 1, 2000, 3, 3, null),
       ('Spikerpistol, stor (trykkluft)', 2, 2000, 3, 3, null),
       ('Spikerpistol, liten (trykkluft)', 2, 2000, 3, 3, null),
       ('Spikerpistol, stor (Milwaukee)', 2, 2000, 3, 3, null),
       ('Spikerpistol, mellom (Milwaukee)', 2, 2000, 3, 3, null),
       ('Spikerpistol, liten (Milwaukee) ', 2, 2000, 3, 3, null),
       ('Vedkløyver, Bensindrevet', 3, 5000, 3, 3, null),
       ('Fliskutter for trevirke', 3, 5000, 3, 3, null),
       ('Tilhenger, boggi; RD 5702', 4, 5000, 3, 3, null),
       ('Tilhenger, liten, RC 8834
Kassemål LxBxH: 197x153x29cm
Nyttelast max. 645kg', 4, 5000, 3, 3, null),
       ('Tilhenger, skap, JP2591
Kassemål innv. LxBxH: 292x154x194cm
(Dørkarm BxH: 146x190cm)
Nyttelast: 1090 kg', 4, 5000, 3, 3, null),
       ('Personløfter, arb.høyde 12m.
SWL 200 kg, 230 VAC', 5, 10000, 0, 3, null),
       ('Strømaggregat, 3.7 kW (Diesel)', 5, 5000, 3, 3, null),
       ('Dekkomleggingsmaskin', 5, -1, 0, 3, 'Egne regler'),
       ('Avbalanseringsmaskin', 5, -1, 0, 3, 'Egne regler'),
       ('Leilighet på Hovden', 5, -1, 0, 3, 'Egne regler. Kontakt resepsjonen hos AMV');
