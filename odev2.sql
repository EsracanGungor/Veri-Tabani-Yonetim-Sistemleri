CREATE DATABASE muzik;
USE muzik;

CREATE TABLE Besteci(bestecino int Primary Key,adi nvarchar(25),soyadi nvarchar(25));
CREATE TABLE Sozyazari(yazarno int Primary Key,adi nvarchar(25),soyadi nvarchar(25));
CREATE TABLE Sarkici(sarkicino int Primary Key,adi nvarchar(25),soyadi nvarchar(25),turu nvarchar(10));
CREATE TABLE Sarki (sarkino int Primary Key,adi nvarchar(25),turu nvarchar(10), uzunluk int,bestecino int not null,yazarno int not null,foreign key (bestecino) references Besteci(bestecino),
foreign key (yazarno) references Sozyazari(yazarno));
CREATE TABLE Icra(sarkicino int not null,sarkino int not null,foreign key (sarkicino) references Sarkici(sarkicino),
foreign key (sarkino) references Sarki(sarkino));

INSERT INTO Sozyazari(yazarno,adi,soyadi) VALUES (1, 'Orhan','Gencebay');
INSERT INTO Sozyazari(yazarno,adi,soyadi) VALUES (2, 'Nejat','Buhara');
INSERT INTO Sozyazari(yazarno,adi,soyadi) VALUES (3, 'Serafettin','Ozdemir');

INSERT INTO Besteci(bestecino,adi,soyadi) VALUES (1, 'Orhan','Gencebay');
INSERT INTO Besteci(bestecino,adi,soyadi) VALUES (2, 'Nejat','Buhara');
INSERT INTO Besteci(bestecino,adi,soyadi) VALUES (3, 'Umit','Mutlu');

INSERT INTO Sarki(sarkino, adi, turu, uzunluk, bestecino, yazarno) VALUES (1, 'Ben dogarken olmusum', 'Arabesk',180,1,1);
INSERT INTO Sarki(sarkino, adi, turu, uzunluk, bestecino, yazarno) VALUES (2, 'Carsambayi sel aldi', 'Halk',230,2,2);
INSERT INTO Sarki(sarkino, adi, turu, uzunluk, bestecino, yazarno) VALUES (3, 'Yesil gozlerinden muhabbet kaptim', 'Sanat',220,3,3);
INSERT INTO Sarki(sarkino, adi, turu, uzunluk, bestecino, yazarno) VALUES (4, 'Vardar Ovasi', 'Halk',210,2,2);

INSERT INTO Sarkici(sarkicino, adi,soyadi,turu) VALUES (1, 'Orhan ', 'Gencebay', 'Arabesk');
INSERT INTO Sarkici(sarkicino, adi,soyadi,turu) VALUES (2, 'Muzeyyen ','Senar', 'Sanat');
INSERT INTO Sarkici(sarkicino, adi,soyadi,turu) VALUES (3, 'Atakan', 'Celik', 'Halk');

INSERT INTO Icra(sarkino,sarkicino) VALUES (1,1);
INSERT INTO Icra(sarkino,sarkicino) VALUES (2,3);
INSERT INTO Icra(sarkino,sarkicino) VALUES (3,2);

INSERT INTO Icra(sarkino,sarkicino) VALUES (1,2);
INSERT INTO Icra(sarkino,sarkicino) VALUES (1,3);
INSERT INTO Icra(sarkino,sarkicino) VALUES (2,2);
INSERT INTO Icra(sarkino,sarkicino) VALUES (2,1);
INSERT INTO Icra(sarkino,sarkicino) VALUES (3,1);
INSERT INTO Icra(sarkino,sarkicino) VALUES (4,1);

//1.soru
MariaDB [muzik]> SELECT *
    -> FROM sarki
    -> ORDER BY adi ASC;
+---------+---------------------------+---------+---------+-----------+---------+
| sarkino | adi                       | turu    | uzunluk | bestecino | yazarno |
+---------+---------------------------+---------+---------+-----------+---------+
|       1 | Ben dogarken olmusum      | Arabesk |     180 |         1 |       1 |
|       2 | Carsambayi sel aldi       | Halk    |     230 |         2 |       2 |
|       4 | Vardar Ovasi              | Halk    |     210 |         2 |       2 |
|       3 | Yesil gozlerinden muhabbe | Sanat   |     220 |         3 |       3 |
+---------+---------------------------+---------+---------+-----------+---------+
4 rows in set (0.000 sec)

//2.soru
MariaDB [muzik]> SELECT s.sarkicino,s.adi,s.soyadi
    -> FROM besteci b, icra i,sarkici s,sarki x
    -> WHERE b.adi='Orhan'
    -> AND b.soyadi='Gencebay' AND b.bestecino=x.bestecino AND x.sarkino=i.sarkino
    -> AND i.sarkicino=s.sarkicino;
+-----------+-----------+----------+
| sarkicino | adi       | soyadi   |
+-----------+-----------+----------+
|         1 | Orhan     | Gencebay |
|         2 | Muzeyyen  | Senar    |
|         3 | Atakan    | Celik    |
+-----------+-----------+----------+
3 rows in set (0.001 sec)

//3.soru
MariaDB [muzik]> SELECT y.adi,y.soyadi
    -> FROM sarki s,sozyazari y
    -> WHERE s.turu='Sanat'
    -> AND s.yazarno=y.yazarno
    -> UNION
    -> SELECT y.adi,y.soyadi
    -> FROM sarkici a,sozyazari y,icra i,sarki s
    -> WHERE a.adi='Muzeyyen' AND a.sarkicino=i.sarkicino
    -> AND i.sarkino=s.sarkino AND s.yazarno=y.yazarno;
+------------+----------+
| adi        | soyadi   |
+------------+----------+
| Serafettin | Ozdemir  |
| Orhan      | Gencebay |
| Nejat      | Buhara   |
+------------+----------+
3 rows in set (0.002 sec)

//4.soru
MariaDB [muzik]> 
MariaDB [muzik]> SELECT b.adi,b.soyadi
    -> FROM besteci b,(SElECT b.bestecino
    -> FROM besteci b,sarki s
    -> WHERE s.uzunluk>180 AND b.bestecino=s.bestecino
    -> EXCEPT
    -> SELECT b.bestecino
    -> FROM besteci b,sarki s
    -> WHERE s.turu='Halk' AND b.bestecino=s.bestecino)t
    -> WHERE t.bestecino=b.bestecino;
+------+--------+
| adi  | soyadi |
+------+--------+
| Umit | Mutlu  |
+------+--------+
1 row in set (0.004 sec)

//5.soru
MariaDB [muzik]> SELECT s.adi,s.soyadi
    -> FROM sarkici s
    -> WHERE NOT EXISTS(SELECT sarkino
    -> FROM sarki
    -> EXCEPT
    -> SELECT sarkino
    -> FROM icra i
    -> WHERE i.sarkicino=s.sarkicino);
+--------+----------+
| adi    | soyadi   |
+--------+----------+
| Orhan  | Gencebay |
+--------+----------+
1 row in set (0.001 sec)

//6.soru
MariaDB [muzik]> SELECT s.adi,s.soyadi
    -> FROM sarkici s
    -> WHERE s.sarkicino IN(SELECT s.sarkicino
    -> FROM icra i,sarki a,sarkici s
    -> WHERE s.adi='Orhan'
    -> AND s.soyadi='Gencebay' AND i.sarkicino=s.sarkicino AND i.sarkino=a.sarkino);
+--------+----------+
| adi    | soyadi   |
+--------+----------+
| Orhan  | Gencebay |
+--------+----------+
1 row in set (0.002 sec)

//7.soru
MariaDB [muzik]> SELECT s.adi
    -> FROM sarki s
    -> WHERE s.uzunluk NOT IN(SELECT s.uzunluk
    -> FROM besteci b,sarki s
    -> WHERE b.adi='Umit' 
    -> AND b.soyadi='Mutlu' AND b.bestecino=s.bestecino);
+----------------------+
| adi                  |
+----------------------+
| Ben dogarken olmusum |
| Carsambayi sel aldi  |
| Vardar Ovasi         |
+----------------------+
3 rows in set (0.007 sec)

//8.soru
MariaDB [muzik]> SELECT DISTINCT a.*
    -> FROM sarkici a,(SELECT i.sarkicino 
    -> FROM sarki s,icra i 
    -> WHERE s.turu='Halk')t
    -> WHERE EXISTS(SELECT i.sarkicino 
    -> FROM sarki s,icra i 
    -> WHERE s.turu='Halk' 
    -> AND i.sarkino=s.sarkino AND t.sarkicino=a.sarkicino);
+-----------+-----------+----------+---------+
| sarkicino | adi       | soyadi   | turu    |
+-----------+-----------+----------+---------+
|         1 | Orhan     | Gencebay | Arabesk |
|         2 | Muzeyyen  | Senar    | Sanat   |
|         3 | Atakan    | Celik    | Halk    |
+-----------+-----------+----------+---------+
3 rows in set (0.003 sec)

//9.soru
MariaDB [muzik]> SELECT DISTINCT a.sarkicino,a.adi,a.soyadi,sum(s.uzunluk)toplam,avg(s.uzunluk)ort,max(s.uzunluk)enuzun,min(s.uzunluk)enkisa,count(s.sarkino)sayi
    -> FROM sarkici a,sarki s, icra i
    -> WHERE a.sarkicino=i.sarkicino
    -> AND s.sarkino=i.sarkino
    -> GROUP BY s.sarkino;
+-----------+-----------+----------+--------+----------+--------+--------+------+
| sarkicino | adi       | soyadi   | toplam | ort      | enuzun | enkisa | sayi |
+-----------+-----------+----------+--------+----------+--------+--------+------+
|         1 | Orhan     | Gencebay |    540 | 180.0000 |    180 |    180 |    3 |
|         3 | Atakan    | Celik    |    690 | 230.0000 |    230 |    230 |    3 |
|         2 | Muzeyyen  | Senar    |    440 | 220.0000 |    220 |    220 |    2 |
|         1 | Orhan     | Gencebay |    210 | 210.0000 |    210 |    210 |    1 |
+-----------+-----------+----------+--------+----------+--------+--------+------+
4 rows in set (0.001 sec)

//10.soru
MariaDB [muzik]> SELECT b.bestecino,b.adi,b.soyadi,count(s.sarkino)sarkisayisi
    -> FROM besteci b,sarki s
    -> WHERE b.bestecino=s.bestecino
    -> GROUP BY bestecino
    -> HAVING count(b.bestecino)>1;
+-----------+-------+--------+-------------+
| bestecino | adi   | soyadi | sarkisayisi |
+-----------+-------+--------+-------------+
|         2 | Nejat | Buhara |           2 |
+-----------+-------+--------+-------------+
1 row in set (0.001 sec)
