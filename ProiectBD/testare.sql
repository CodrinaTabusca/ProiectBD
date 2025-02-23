
--vom afisa impreuna albumele impreuna cu artistii lor
SELECT a.titlu_album, a.tip_album, a.stoc, ar.nume_artist
    FROM album a
    JOIN artisti ar on a.id_artist = ar.id_artist;
    

--afisam piesele impreuna cu albumul
SELECT p.titlu_piesa, a.titlu_album
    FROM piese p
    JOIN album a on p.id_album= a.id_album ;
 
 
--afisam albumele impreuna cu detaliie acestora
SELECT a.titlu_album, a.tip_album, a.stoc, da.data_lansare, da.pret
    from album a
    JOIN detalii_album da on a.id_album= da.id_album;
   

-- Afișarea pieselor unice împreună cu albumul și artistul lor
SELECT DISTINCT 
    p.titlu_piesa AS "Piesa", 
    a.titlu_album AS "Album", 
    ar.nume_artist AS "Artist"
FROM piese p
JOIN album a ON p.id_album = a.id_album
JOIN artisti ar ON a.id_artist = ar.id_artist
ORDER BY ar.nume_artist, a.titlu_album, p.titlu_piesa;


--afisam vanzarile facute impreuna cu albumul vamdut si clientul ce le-a cumparat
SELECT 
    c.nume_client AS "Nume Client",
    c.email AS "Email Client",
    a.titlu_album AS "Titlu Album",
    a.tip_album AS "Tip Album",
    v.cantitate AS "Cantitate Cumpărată",
    v.data_cumparare AS "Data Cumpărării"
FROM vanzari v
JOIN clienti c ON v.id_client = c.id_client
JOIN album a ON v.id_album = a.id_album
ORDER BY v.data_cumparare DESC;

----------
--testam CONSTRANGEREA PK ( ID unic pentru albume)------------------
--PK album: 
INSERT INTO album (id_album, tip_album, titlu_album, stoc, id_artist)
VALUES (1, 'CD', 'Album Test', 10, 101); --id-ul deja exista

--Error starting at line : 681 in command -
--INSERT INTO album (id_album, tip_album, titlu_album, stoc, id_artist)
--VALUES (1, 'CD', 'Album Test', 10, 101)
--Error report -
--ORA-00001: unique constraint (BD110.ALBUM_PK) violated

--PK artisti: 
INSERT INTO artisti (id_artist, nume_artist, data_nasterii)
VALUES (101, 'Artist Test', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
--Error report -
--ORA-00001: unique constraint (BD110.ARTISTI_PK) violated

--PK clienti
INSERT INTO clienti (id_client, nume_client, email, telefon)
VALUES (300, 'Client Test', 'client.test@example.com', '0712345678');
--Error report -
--ORA-00001: unique constraint (BD110.CLIENTI_PK) violated

--PK piese
INSERT INTO piese (id_piesa, titlu_piesa, id_album, id_artist)
VALUES (200, 'Piesa Test', 1, 101);
--Error report -
--ORA-00001: unique constraint (BD110.PIESE_PK) violated


--testam CONSTRANGEREA NN (nu poate fi NULL)-------------------
--NN artisti
INSERT INTO artisti ( nume_artist, data_nasterii)
VALUES (NULL, TO_DATE('1985-05-10', 'YYYY-MM-DD'));

--Error at Command Line : 695 Column : 9
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD110"."ARTISTI"."NUME_ARTIST")

--https://docs.oracle.com/error-help/db/ora-01400/01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values. Reservable columns cannot
--          accept NULL values

--NN album: nicio data nu poate fi NULL
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES (NULL, 'Album Test', 10, 101);
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD110"."ALBUM"."TIP_ALBUM")
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', NULL, 10, 101);
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD110"."ALBUM"."TITLU_ALBUM
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Album Test', NULL , 101);
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD110"."ALBUM"."STOC")

--NN clienti: nume_client nu poate fi null
INSERT INTO clienti (nume_client, email, telefon)
VALUES (NULL, 'client@example.com', '0712345678');
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD110"."CLIENTI"."NUME_CLIENT")


--NN detalii_album: pretul nu poate fi null
INSERT INTO detalii_album (pret, id_album, data_lansare)
VALUES (NULL, 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD110"."DETALII_ALBUM"."PRET")


--NN piese: titlul_piesa nu poate fi null
INSERT INTO piese (titlu_piesa, id_album, id_artist)
VALUES (NULL,1, 101);
--Error report -
--SQL Error: ORA-01400: cannot insert NULL into ("BD110"."PIESE"."TITLU_PIESA")


--testam constrangerile UK 
--UK email+nume
INSERT INTO clienti(nume_client, email, telefon)
VALUES ('Chaol Westfall', 'chaol.westfall@gmail.com', '0712345675');

--Error starting at line : 709 in command -
--INSERT INTO clienti(nume_client, email, telefon)
--VALUES ('Chaol Westfall', 'chaol.westfall@gmail.com', '0712345675')
--Error report -
--ORA-00001: unique constraint (BD110.CLIENTI_EMAIL_NUME_CLIENT_UN) violated


--testam CONSTRANGERILE CK 
--CK album:
--(stocul trebuie sa fie mai mare decat 0)
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('vinyl', 'Album Negativ', -5, 101);
--Error report -
--ORA-02290: check constraint (BD110.ALBUM_STOC_CK) violated

--id_ul poate avea maxim 3 cifre
INSERT INTO album (id_album, tip_album, titlu_album, stoc, id_artist)
VALUES (1000, 'CD', 'Album Test', 10, 101);
--Error report -
--SQL Error: ORA-01438: value larger than specified precision allowed for this column

--tip_album poate fi doar CD sau vinyl
INSERT INTO album (id_album, tip_album, titlu_album, stoc, id_artist)
VALUES (1, 'Tape', 'Album Test', 10, 101);
--Error report -
--ORA-02290: check constraint (BD110.ALBUM_TIP_ALBUM_CK) violated


--CK artisti:
--numele e de forma <PRENUME> <NUME>
INSERT INTO artisti (id_artist, nume_artist, data_nasterii)
VALUES (120, 'mary', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
--INSERT INTO artisti (id_artist, nume_artist, data_nasterii)
--VALUES (101, 'johnDoe', TO_DATE('1980-01-01', 'YYYY-MM-DD'));

--id_ul poate avea maxim 3 cifre
INSERT INTO artisti (id_artist, nume_artist, data_nasterii)
VALUES (1200, 'Arisst Test', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
--Error report -
--SQL Error: ORA-01438: value larger than specified precision allowed for this column

--CK clienti
--email-ul trebuie sa respecte tiparul specific
INSERT INTO clienti (id_client, nume_client, email, telefon)
VALUES (301, 'Client Test', 'client.test.com', '0712345678');
--Error report -
--ORA-02290: check constraint (BD110.CLIENTI_EMAIL_CK) violated

--numarul de telefon trebuie sa contina 10 cifre
INSERT INTO clienti (id_client, nume_client, email, telefon)
VALUES (301, 'Client Test', 'client.test@example.com', '712345');
--Error report -
--ORA-02290: check constraint (BD110.CLIENTI_TELEFON_CK) violated

--id_ul poate avea maxim 3 cifre
INSERT INTO clienti (id_client, nume_client, email, telefon)
VALUES (3010, 'Client Test', 'client.test@example.com', '0712345678');
--Error report -
--SQL Error: ORA-01438: value larger than specified precision allowed for this column

--numele e de forma <PRENUME> <NUME>
INSERT INTO clienti (id_client, nume_client, email, telefon)
VALUES (301, 'client', 'client.test@example.com', '0712345678');
--Error report -
--ORA-02290: check constraint (BD110.CLIENTI_NUME_CLIENT_CK) violated

--CK Piese
--id ul poate avea maxim 3 cifre
INSERT INTO piese (titlu_piesa, id_album, id_artist, id_piesa) VALUES ('Melodie1', 1, 1, 2001);
--Error report -
--SQL Error: ORA-01438: value larger than specified precision allowed for this column

--testam constrangerea FK (id-ul artistului trebuie sa existe pt a se face un album ce contine acel id)
--FK album
INSERT INTO album (tip_album, titlu_album, stoc, id_artist)
VALUES ('CD', 'Album Fara Artist', 5, 999);
--Error report -
--ORA-02291: integrity constraint (BD110.ALBUM_ARTISTI_FK) violated - parent key not found

--FK detalii_album
INSERT INTO detalii_album (id_album, data_lansare, pret)
VALUES (999, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 100);
--Error report -
--ORA-02291: integrity constraint (BD110.DETALII_ALBUM_ALBUM_FK) violated - parent key not found


-----UPDATE----
--PK
UPDATE album SET id_album = 1 WHERE id_album = 2;  -- id_album = 1 există deja
--Error report -
--ORA-00001: unique constraint (BD110.ALBUM_PK) violated

--NN
UPDATE artisti SET nume_artist=NULL WHERE id_artist= 101; --numele artistului nu poate nu NULL
--Error report -
--SQL Error: ORA-01407: cannot update ("BD110"."ARTISTI"."NUME_ARTIST") to NULL

--UK
UPDATE clienti SET email = 'chaol.westfall@gmail.com', nume_client = 'Chaol Westfall'
    WHERE id_client = 302;  -- email+nume exista deja
--Error report -
--ORA-00001: unique constraint (BD110.CLIENTI_EMAIL_NUME_CLIENT_UN) violated

--CK
UPDATE detalii_album SET pret= 30 where id_album = 1; --pretul nu este intre 50 si 200
--Error report -
--ORA-02290: check constraint (BD110.DETALII_ALBUM_PRET_CK) violated

--FK
UPDATE detalii_album SET id_album= 999 where id_album= 1; --id-ul 999 nu exista in tabela 'album'
--Error report -
--ORA-02291: integrity constraint (BD110.DETALII_ALBUM_ALBUM_FK) violated - parent key not found


----DELETE-------
--PK
DELETE FROM album WHERE id_album = 1; --id_ul este folosit in detalii_album deci nu poate fi sters
--Error report -
--ORA-02292: integrity constraint (BD110.DETALII_ALBUM_ALBUM_FK) violated - child record found