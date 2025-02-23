-- Inserare in tabela artisti
INSERT INTO artisti (nume_artist, data_nasterii) VALUES ('Taylor Swift', TO_DATE('1989-12-13', 'YYYY-MM-DD'));
INSERT INTO artisti (nume_artist, data_nasterii) VALUES ('Sabrina Carpenter', TO_DATE('1999-05-11', 'YYYY-MM-DD'));
INSERT INTO artisti (nume_artist, data_nasterii) VALUES ('Alice Merton', TO_DATE('1993-11-13', 'YYYY-MM-DD'));
INSERT INTO artisti (nume_artist) VALUES ('Imagine Dragons');
INSERT INTO artisti (nume_artist, data_nasterii) VALUES ('Gracie Abrams', TO_DATE('1999-11-7', 'YYYY-MM-DD'));
select * from artisti;

desc album;

--inserare in tabela album
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Reputation', 20, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Lover', 30, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Midnights', 20, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
        
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Espresso', 50, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'On my way', 35, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Eyes Wide Open', 25, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
        
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Mint', 40, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Sides', 15, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton'));

INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Evolve', 30, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Believer', 25, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));

        
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'The Secret Of Us', 55, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Good Riddance', 45, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
----vinyl--------------------
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Reputation', 10, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Lover', 20, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Midnights', 30, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
        
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Espresso', 40, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'On my way', 35, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Eyes Wide Open', 15, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
        
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Mint', 30, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Sides', 25, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton'));

INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Evolve', 30, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Believer', 35, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));


        
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'The Secret Of Us', 55, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Good Riddance', 45, 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
        
select * from album;

--inserare in tabela piese
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('...Ready for It?', 
        (SELECT id_album FROM album WHERE titlu_album = 'Reputation' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('...Ready for It?', 
        (SELECT id_album FROM album WHERE titlu_album = 'Reputation' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Delicate', 
        (SELECT id_album FROM album WHERE titlu_album = 'Reputation' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Delicate', 
        (SELECT id_album FROM album WHERE titlu_album = 'Reputation' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));


INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Lover', 
        (SELECT id_album FROM album WHERE titlu_album = 'Lover' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Lover', 
        (SELECT id_album FROM album WHERE titlu_album = 'Lover' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Cruel Summer', 
        (SELECT id_album FROM album WHERE titlu_album = 'Lover' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Cruel Summer', 
        (SELECT id_album FROM album WHERE titlu_album = 'Lover' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));


INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Anti-Hero', 
        (SELECT id_album FROM album WHERE titlu_album = 'Midnights' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Anti-Hero', 
        (SELECT id_album FROM album WHERE titlu_album = 'Midnights' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift'));
        
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Espresso', 
        (SELECT id_album FROM album WHERE titlu_album = 'Espresso' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Espresso', 
        (SELECT id_album FROM album WHERE titlu_album = 'Espresso' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('On my way', 
        (SELECT id_album FROM album WHERE titlu_album = 'On my way' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));  
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('On my way', 
        (SELECT id_album FROM album WHERE titlu_album = 'On my way' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter')); 
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Eyes Wide Open', 
        (SELECT id_album FROM album WHERE titlu_album = 'Eyes Wide Open' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));      
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Eyes Wide Open', 
        (SELECT id_album FROM album WHERE titlu_album = 'Eyes Wide Open' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Too young', 
        (SELECT id_album FROM album WHERE titlu_album = 'Eyes Wide Open' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter')); 
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Too young', 
        (SELECT id_album FROM album WHERE titlu_album = 'Eyes Wide Open' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter')); 

INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Learn to Live', 
        (SELECT id_album FROM album WHERE titlu_album = 'Mint' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton')); 
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Learn to Live', 
        (SELECT id_album FROM album WHERE titlu_album = 'Mint' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton')); 
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('No Roots', 
        (SELECT id_album FROM album WHERE titlu_album = 'Mint' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton')); 
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('No Roots', 
        (SELECT id_album FROM album WHERE titlu_album = 'Mint' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton')); 
        
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Loveback', 
        (SELECT id_album FROM album WHERE titlu_album = 'Sides' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton')); 
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Loveback', 
        (SELECT id_album FROM album WHERE titlu_album = 'Sides' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton'));
        
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Future', 
        (SELECT id_album FROM album WHERE titlu_album = 'Sides' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Future', 
        (SELECT id_album FROM album WHERE titlu_album = 'Sides' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton'));
        
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Next To Me', 
        (SELECT id_album FROM album WHERE titlu_album = 'Evolve' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Next To Me', 
        (SELECT id_album FROM album WHERE titlu_album = 'Evolve' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));  

INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Rise Up', 
        (SELECT id_album FROM album WHERE titlu_album = 'Believer' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Rise Up', 
        (SELECT id_album FROM album WHERE titlu_album = 'Believer' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Yesterday', 
        (SELECT id_album FROM album WHERE titlu_album = 'Believer' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));        
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Yesterday', 
        (SELECT id_album FROM album WHERE titlu_album = 'Believer' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons'));
        
        
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Risk', 
        (SELECT id_album FROM album WHERE titlu_album = 'The Secret Of Us' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Risk', 
        (SELECT id_album FROM album WHERE titlu_album = 'The Secret Of Us' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Let it Happen', 
        (SELECT id_album FROM album WHERE titlu_album = 'The Secret Of Us' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Let it Happen', 
        (SELECT id_album FROM album WHERE titlu_album = 'The Secret Of Us' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));


INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Best', 
        (SELECT id_album FROM album WHERE titlu_album = 'Good Riddance' AND tip_album = 'CD'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES ('Best', 
        (SELECT id_album FROM album WHERE titlu_album = 'Good Riddance' AND tip_album = 'vinyl'),
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams'));
        


-- Inserare in tabela clienti
INSERT INTO clienti (nume_client, email, telefon)
VALUES ('Chaol Westfall', 'chaol.westfall@gmail.com', '0712345678');
INSERT INTO clienti (nume_client, email, telefon)
VALUES ('Aelin Galathynius', 'aelin.galathy@gmail.com', '0723456789');
INSERT INTO clienti (nume_client, email, telefon)
VALUES ('Dorian Havilliard', 'Dorian.havill@gmail.com', '0734567890');
INSERT INTO clienti (nume_client, email, telefon)
VALUES ('Selena Sardothien', 'selene.sardot@gmail.com', '0734567100');
INSERT INTO clienti (nume_client, email, telefon)
VALUES ('Rowan Whitethorn', 'rowan.white@gmail.com', '0729067890');

select * from clienti;


INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE('2023-10-01', 'YYYY-MM-DD'), 150, 
        (SELECT id_album FROM album WHERE titlu_album = 'Reputation' AND id_artist = 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift') AND tip_album = 'CD'));
        
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2020-08-23', 'YYYY-MM-DD'), 120, 
    (SELECT id_album FROM album WHERE titlu_album= 'Lover' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Taylor Swift') AND tip_album='CD'));
        
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2020-08-23', 'YYYY-MM-DD'), 170, 
    (SELECT id_album FROM album WHERE titlu_album= 'Midnights' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Taylor Swift') AND tip_album='CD'));        
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2019-06-22', 'YYYY-MM-DD'), 170, 
    (SELECT id_album FROM album WHERE titlu_album= 'Espresso' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Sabrina Carpenter') AND tip_album='CD'));    
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2016-04-08', 'YYYY-MM-DD'), 90, 
    (SELECT id_album FROM album WHERE titlu_album= 'On my way' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Sabrina Carpenter') AND tip_album='CD')); 
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2022-03-10', 'YYYY-MM-DD'), 110, 
    (SELECT id_album FROM album WHERE titlu_album= 'Eyes Wide Open' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Sabrina Carpenter') AND tip_album='CD')); 
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2018-10-26', 'YYYY-MM-DD'), 140, 
    (SELECT id_album FROM album WHERE titlu_album= 'Mint' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Alice Merton') AND tip_album='CD')); 

INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2016-01-29', 'YYYY-MM-DD'), 100, 
    (SELECT id_album FROM album WHERE titlu_album= 'Sides' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Alice Merton') AND tip_album='CD')); 
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2017-06-23', 'YYYY-MM-DD'), 180, 
    (SELECT id_album FROM album WHERE titlu_album= 'Evolve' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Imagine Dragons') AND tip_album='CD')); 
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2016-02-01', 'YYYY-MM-DD'), 75, 
    (SELECT id_album FROM album WHERE titlu_album= 'Believer' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Imagine Dragons') AND tip_album='CD'));
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2021-09-12', 'YYYY-MM-DD'), 125, 
    (SELECT id_album FROM album WHERE titlu_album= 'The Secret Of Us' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Gracie Abrams') AND tip_album='CD'));
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2023-02-24', 'YYYY-MM-DD'), 135, 
    (SELECT id_album FROM album WHERE titlu_album= 'Good Riddance' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Gracie Abrams') AND tip_album='CD'));
    
--vinyl
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE('2023-10-01', 'YYYY-MM-DD'), 120, 
        (SELECT id_album FROM album WHERE titlu_album = 'Reputation' AND id_artist = 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift') AND tip_album = 'vinyl'));
        
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2020-08-23', 'YYYY-MM-DD'), 110, 
    (SELECT id_album FROM album WHERE titlu_album= 'Lover' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Taylor Swift') AND tip_album='vinyl'));
        
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2020-08-23', 'YYYY-MM-DD'), 160, 
    (SELECT id_album FROM album WHERE titlu_album= 'Midnights' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Taylor Swift') AND tip_album='vinyl'));        
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2019-06-22', 'YYYY-MM-DD'), 190, 
    (SELECT id_album FROM album WHERE titlu_album= 'Espresso' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Sabrina Carpenter') AND tip_album='vinyl'));    
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2016-04-08', 'YYYY-MM-DD'), 125, 
    (SELECT id_album FROM album WHERE titlu_album= 'On my way' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Sabrina Carpenter') AND tip_album='vinyl')); 
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2022-03-10', 'YYYY-MM-DD'), 105, 
    (SELECT id_album FROM album WHERE titlu_album= 'Eyes Wide Open' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Sabrina Carpenter') AND tip_album='vinyl')); 
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2018-10-26', 'YYYY-MM-DD'), 145, 
    (SELECT id_album FROM album WHERE titlu_album= 'Mint' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Alice Merton') AND tip_album='vinyl')); 

INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2016-01-29', 'YYYY-MM-DD'), 100, 
    (SELECT id_album FROM album WHERE titlu_album= 'Sides' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Alice Merton') AND tip_album='vinyl')); 
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2017-06-23', 'YYYY-MM-DD'), 180, 
    (SELECT id_album FROM album WHERE titlu_album= 'Evolve' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Imagine Dragons') AND tip_album='vinyl')); 
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2016-02-01', 'YYYY-MM-DD'), 75, 
    (SELECT id_album FROM album WHERE titlu_album= 'Believer' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Imagine Dragons') AND tip_album='vinyl'));
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2021-09-12', 'YYYY-MM-DD'), 125, 
    (SELECT id_album FROM album WHERE titlu_album= 'The Secret Of Us' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Gracie Abrams') AND tip_album='vinyl'));
    
INSERT INTO detalii_album (data_lansare, pret, id_album)
VALUES (TO_DATE ('2023-02-24', 'YYYY-MM-DD'), 155, 
    (SELECT id_album FROM album WHERE titlu_album= 'Good Riddance' AND id_artist =
    (SELECT id_artist FROM artisti where nume_artist='Gracie Abrams') AND tip_album='vinyl'));
select * from detalii_album;


--inserare pt tabela vanzari
--vindem albumul 'Reputation' sub forma de CD catre 'Chaol Westfall'
INSERT INTO vanzari (id_client, id_album, data_cumparare, cantitate)
VALUES ((SELECT id_client FROM clienti WHERE nume_client = 'Chaol Westfall'),
        (SELECT id_album FROM album WHERE titlu_album = 'Reputation' AND id_artist = 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift') AND tip_album = 'CD'),
        TO_DATE('2023-11-15', 'YYYY-MM-DD'), 2);
--facem update pt stocul albumului
update album 
set stoc= stoc - 2
where id_album = (select id_album from album 
                  where titlu_album = 'Reputation' and 
                  id_artist= (SELECT id_artist FROM artisti WHERE nume_artist = 'Taylor Swift') 
      AND tip_album = 'CD'
);  


--vindem albumul 'Espresso' catre 'Aelin Galathynius sub forma de vinyl
INSERT INTO vanzari (id_client, id_album, data_cumparare, cantitate)
VALUES ((SELECT id_client FROM clienti WHERE nume_client = 'Aelin Galathynius'),
        (SELECT id_album FROM album WHERE titlu_album = 'Espresso' AND id_artist = 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter') AND tip_album = 'vinyl'),
        TO_DATE('2023-12-07', 'YYYY-MM-DD'), 10);
update album 
set stoc= stoc - 10
where id_album = (select id_album from album 
                  where titlu_album = 'Espresso' and 
                  id_artist= (SELECT id_artist FROM artisti WHERE nume_artist = 'Sabrina Carpenter') 
      AND tip_album = 'vinyl'
); 

        
--vindem albumul 'Mint' catre 'Dorian Havilliard' sub forma de vinyl
INSERT INTO vanzari (id_client, id_album, data_cumparare, cantitate)
VALUES ((SELECT id_client FROM clienti WHERE nume_client = 'Dorian Havilliard'),
        (SELECT id_album FROM album WHERE titlu_album = 'Mint' AND id_artist = 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton') AND tip_album = 'vinyl'),
        TO_DATE('2023-11-12', 'YYYY-MM-DD'), 7);
update album 
set stoc= stoc - 7
where id_album = (select id_album from album 
                  where titlu_album ='Mint' and 
                  id_artist= (SELECT id_artist FROM artisti WHERE nume_artist = 'Alice Merton') 
      AND tip_album = 'vinyl'
); 

        
--vindem albumul 'Believer' catre 'Aelin Galathynius' sub forma de CD
INSERT INTO vanzari (id_client, id_album, data_cumparare, cantitate)
VALUES ((SELECT id_client FROM clienti WHERE nume_client = 'Aelin Galathynius'),
        (SELECT id_album FROM album WHERE titlu_album = 'Believer' AND id_artist = 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons') AND tip_album = 'CD'),
        TO_DATE('2023-11-15', 'YYYY-MM-DD'), 9);
update album 
set stoc= stoc - 9
where id_album = (select id_album from album 
                  where titlu_album ='Believer' and 
                  id_artist= (SELECT id_artist FROM artisti WHERE nume_artist = 'Imagine Dragons') 
      AND tip_album = 'CD'
);      
--vindem albumul 'The Secret Of Us' catre 'Dorian Havilliard' sub forma de CD
INSERT INTO vanzari (id_client, id_album, data_cumparare, cantitate)
VALUES ((SELECT id_client FROM clienti WHERE nume_client = 'Dorian Havilliard'),
        (SELECT id_album FROM album WHERE titlu_album = 'The Secret Of Us' AND id_artist = 
        (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams') AND tip_album = 'CD'),
        TO_DATE('2023-12-02', 'YYYY-MM-DD'), 3);
update album 
set stoc= stoc - 3
where id_album = (select id_album from album 
                  where titlu_album ='The Secret Of Us' and 
                  id_artist= (SELECT id_artist FROM artisti WHERE nume_artist = 'Gracie Abrams') 
      AND tip_album = 'CD'
);

select * from album;
select * from artisti;
select * from clienti;
select * from piese;
select * from detalii_album;
select * from vanzari;



