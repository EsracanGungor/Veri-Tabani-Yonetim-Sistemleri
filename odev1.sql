/*Ödev no:1
Ad Soyad:Esracan Güngör
No:1306170067
Ders adı,kodu:VERİ TABANI YÖNETİM SİSTEMLERİ,BIMU3064*/

MariaDB [(none)]> CREATE DATABASE restoran ;
Query OK, 1 row affected (0.002 sec)
MariaDB [(none)]> USE restoran ;
Database changed
MariaDB [restoran]> CREATE TABLE Musteri (
    ->     mno int Primary Key,
    ->     madi nvarchar(25),
    ->     msoyadi nvarchar(25),
    ->     mtelefon varchar(10)
    ->     );
Query OK, 0 rows affected (0.350 sec)

MariaDB [restoran]> CREATE TABLE Yemek(
    ->     yno int Primary Key,
    ->     yadi nvarchar(25),
    ->     ykalori int,
    ->     ybirimFiyati int,
    ->     yturu nvarchar(25)
    ->     );
Query OK, 0 rows affected (0.268 sec)

MariaDB [restoran]> CREATE TABLE Siparis(
    ->     mno int not null,
    ->     yno int not null,
    ->     tarihsaat datetime,
    ->     foreign key (mno) references Musteri(mno),
    ->     foreign key (yno) references Yemek(yno)
    ->     );
Query OK, 0 rows affected (0.913 sec)

MariaDB [restoran]> CREATE TABLE Malzeme(
    ->     zno int Primary Key,
    ->     zadi nvarchar(25),
    ->     ztipi nvarchar(25),
    ->         zbirimFiyati int
    ->     );
Query OK, 0 rows affected (0.411 sec)

MariaDB [restoran]> CREATE TABLE Kullan(
    ->     yno int not null,
    ->     zno int not null,
    ->     miktar int,
    ->     foreign key (yno) references Yemek(yno),
    ->     foreign key (zno) references Malzeme(zno)
    ->     );
Query OK, 0 rows affected (0.282 sec)

MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (1, 'Esracan', 'Gungor', '5345698729');
Query OK, 1 row affected (0.083 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (2, 'Ali', 'Kurt', '0123456789');
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (3, 'Ayse', 'Kurt', '1234567892');
Query OK, 1 row affected (0.099 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (4, 'Selim', 'Gungor', '1234123400');
Query OK, 1 row affected (0.086 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (5, 'Gulcan', 'Gungor', '1234512345');
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (6, 'Fatih', 'Gungor', '1234560000');
Query OK, 1 row affected (0.032 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (7, 'Gulsum', 'Gungor', '1234567000');
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (8, 'Hamide', 'Gungor', '1234567800');
Query OK, 1 row affected (0.066 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (9, 'Yusra', 'Gungor', '1234567900');
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (10, 'Seyma', 'Gungor', '1234567900');
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Musteri (mno, madi, msoyadi, mtelefon) VALUES (11, 'Yasin', 'Gungor', '1234567901');
Query OK, 1 row affected (0.041 sec)

MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (1, 'Biftek', 1560, 7, 'Ana yemek');
Query OK, 1 row affected (0.073 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (2, 'Beyti Kebabi', 1430, 20, 'Ana Yemek');
Query OK, 1 row affected (0.108 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (3, 'Kuru Fasulye', 1300, 15, 'Ana Yemek');
Query OK, 1 row affected (0.096 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (4, 'Borek', 500, 5, 'Ara Sicak');
Query OK, 1 row affected (0.033 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (5, 'Mantar', 200, 10, 'Ara Sicak');
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (6, 'Ezogelin', 1300, 18, 'Baslangic');
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (7, 'Kereviz Salatasi', 1560, 9, 'Baslangic');
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (8, 'Corba', 200, 5, 'Baslagic');
Query OK, 1 row affected (0.030 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (9, 'Salata', 100, 7, 'Baslangic');
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Yemek (yno, yadi, ykalori, ybirimFiyati, yturu) VALUES (10, 'Pilav', 300, 7, 'Ana Yemek');
Query OK, 1 row affected (0.030 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (1, 'Su', 'tip1',1);
Query OK, 1 row affected (0.038 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (2, 'Et', 'tip2',35);
Query OK, 1 row affected (0.069 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (3, 'Kereviz', 'tip3',10);
Query OK, 1 row affected (0.093 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi ,zbirimFiyati) VALUES (4, 'Sogan', 'tip4',4);
Query OK, 1 row affected (0.130 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (5, 'Biber', 'tip5',3);
Query OK, 1 row affected (0.060 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (6, 'Yogurt', 'tip2',5);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (7, 'Mantar', 'tip4',8);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (8, 'Patates', 'tip3',7);
Query OK, 1 row affected (0.032 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (9, 'Kasar', 'tip2',18);
Query OK, 1 row affected (0.027 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (10, 'Pirinc', 'tip3',25);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (11, 'Yumurta', 'tip4',2);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (12, 'Kiyma', 'tip4',39);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (13, 'Ekmek', 'tip4',2);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (14, 'Maydanoz', 'tip4',3);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Malzeme (zno, zadi, ztipi, zbirimFiyati) VALUES (15, 'Domates', 'tip4',6);
Query OK, 1 row affected (0.027 sec)

MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (1, 7, '2019-10-22 17:18:17');
Query OK, 1 row affected (0.036 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (4, 5, '2019-10-21 17:15:19');
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (5, 8, '2019-10-17 17:14:20');
Query OK, 1 row affected (0.131 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (6, 4, '2019-10-19 19:13:19');
Query OK, 1 row affected (0.092 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (7, 5, '2019-05-20 17:12:19');
Query OK, 1 row affected (0.042 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (8, 8, '2019-10-18 17:11:19');
Query OK, 1 row affected (0.041 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (9, 2, '2019-10-16 17:09:17');
Query OK, 1 row affected (0.039 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (10, 3, '2019-10-15 17:08:17');
Query OK, 1 row affected (0.109 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (11, 3, '2019-10-14 19:01:17');
Query OK, 1 row affected (0.080 sec)

MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (1, 10, '2019-10-13 19:02:17');
Query OK, 1 row affected (0.107 sec)

MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (2, 8, '2019-10-12 19:03:19');
Query OK, 1 row affected (0.050 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (3, 1, '2019-10-11 19:14:19');
Query OK, 1 row affected (0.053 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (4, 2, '2019-10-10 19:12:19');
Query OK, 1 row affected (0.039 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (5, 3, '2019-10-09 19:17:19');
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (6, 6, '2019-10-08 19:16:19');
Query OK, 1 row affected (0.027 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (7, 10, '2019-10-07  20:07:19');
Query OK, 1 row affected (0.038 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (8, 9, '2019-10-06 20:17:19');
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (9, 6, '2019-10-05 21:10:19');
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (10, 6, '2019-10-04 22:12:19');
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Siparis (mno, yno, tarihsaat) VALUES (11, 9, '2019-10-03 23:11:19');
Query OK, 1 row affected (0.028 sec)

MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (1, 1, 100);
Query OK, 1 row affected (0.027 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (1, 4, 200);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (1, 5, 300);
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (1, 14, 400);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (1, 7, 500);
Query OK, 1 row affected (0.029 sec
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (1, 11, 550);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (2, 15, 150);
Query OK, 1 row affected (0.026 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (2, 13, 250);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (2, 9, 350);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (2, 3, 450);
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (2, 8, 650);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (2, 7, 750);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (3, 2, 11);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (3, 5, 19);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (3, 15, 25);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (3, 9, 36);
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (3, 4, 644);
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (3, 12, 89);
Query OK, 1 row affected (0.063 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (4, 1, 74);
Query OK, 1 row affected (0.032 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (4, 9, 44);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (5, 12, 220);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (5, 10, 160);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (5, 3, 360);
Query OK, 1 row affected (0.031 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (5, 6, 250);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (6, 10, 370);
Query OK, 1 row affected (0.032 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (6, 11, 370);
Query OK, 1 row affected (0.052 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (6, 15, 210);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (6, 12, 140);
Query OK, 1 row affected (0.032 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (7, 1, 230);
Query OK, 1 row affected (0.028 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (7, 9, 261);
Query OK, 1 row affected (0.049 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (7, 4, 262);
Query OK, 1 row affected (0.053 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (7, 7, 263);
Query OK, 1 row affected (0.051 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (8, 10, 164);
Query OK, 1 row affected (0.053 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (8, 4, 165);
Query OK, 1 row affected (0.039 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (8, 2, 166);
Query OK, 1 row affected (0.041 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (8, 3, 167);
Query OK, 1 row affected (0.040 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (8, 15, 168);
Query OK, 1 row affected (0.052 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (9, 3, 169);
Query OK, 1 row affected (0.074 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (9, 1, 755);
Query OK, 1 row affected (0.042 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (10, 15, 165);
Query OK, 1 row affected (0.029 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (10, 3, 266);
Query OK, 1 row affected (0.485 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (10, 1, 64);
Query OK, 1 row affected (0.207 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (10, 3, 960);
Query OK, 1 row affected (0.163 sec)
MariaDB [restoran]> INSERT INTO Kullan (yno, zno, miktar) VALUES (10, 15, 60);
Query OK, 1 row affected (0.121 sec)

MariaDB [restoran]> select * from musteri;
+-----+---------+---------+------------+
| mno | madi    | msoyadi | mtelefon   |
+-----+---------+---------+------------+
|   1 | Esracan | Gungor  | 5345698729 |
|   2 | Ali     | Kurt    | 0123456789 |
|   3 | Ayse    | Kurt    | 1234567892 |
|   4 | Selim   | Gungor  | 1234123400 |
|   5 | Gulcan  | Gungor  | 1234512345 |
|   6 | Fatih   | Gungor  | 1234560000 |
|   7 | Gulsum  | Gungor  | 1234567000 |
|   8 | Hamide  | Gungor  | 1234567800 |
|   9 | Yusra   | Gungor  | 1234567900 |
|  10 | Seyma   | Gungor  | 1234567900 |
|  11 | Yasin   | Gungor  | 1234567901 |
+-----+---------+---------+------------+
11 rows in set (0.001 sec)

MariaDB [restoran]> select * from yemek;
+-----+------------------+---------+--------------+-----------+
| yno | yadi             | ykalori | ybirimFiyati | yturu     |
+-----+------------------+---------+--------------+-----------+
|   1 | Biftek           |    1560 |            7 | Ana yemek |
|   2 | Beyti Kebabi     |    1430 |           20 | Ana Yemek |
|   3 | Kuru Fasulye     |    1300 |           15 | Ana Yemek |
|   4 | Borek            |     500 |            5 | Ara Sicak |
|   5 | Mantar           |     200 |           10 | Ara Sicak |
|   6 | Ezogelin         |    1300 |           18 | Baslangic |
|   7 | Kereviz Salatasi |    1560 |            9 | Baslangic |
|   8 | Corba            |     200 |            5 | Baslagic  |
|   9 | Salata           |     100 |            7 | Baslangic |
|  10 | Pilav            |     300 |            7 | Ana Yemek |
+-----+------------------+---------+--------------+-----------+
10 rows in set (0.000 sec)

MariaDB [restoran]> select * from malzeme;
+-----+----------+-------+--------------+
| zno | zadi     | ztipi | zbirimFiyati |
+-----+----------+-------+--------------+
|   1 | Su       | tip1  |            1 |
|   2 | Et       | tip2  |           35 |
|   3 | Kereviz  | tip3  |           10 |
|   4 | Sogan    | tip4  |            4 |
|   5 | Biber    | tip5  |            3 |
|   6 | Yogurt   | tip2  |            5 |
|   7 | Mantar   | tip4  |            8 |
|   8 | Patates  | tip3  |            7 |
|   9 | Kasar    | tip2  |           18 |
|  10 | Pirinc   | tip3  |           25 |
|  11 | Yumurta  | tip4  |            2 |
|  12 | Kiyma    | tip4  |           39 |
|  13 | Ekmek    | tip4  |            2 |
|  14 | Maydanoz | tip4  |            3 |
|  15 | Domates  | tip4  |            6 |
+-----+----------+-------+--------------+
15 rows in set (0.000 sec)

MariaDB [restoran]> select * from siparis;
+-----+-----+---------------------+
| mno | yno | tarihsaat           |
+-----+-----+---------------------+
|   1 |   7 | 2019-10-22 17:18:17 |
|   4 |   5 | 2019-10-21 17:15:19 |
|   5 |   8 | 2019-10-17 17:14:20 |
|   6 |   4 | 2019-10-19 19:13:19 |
|   7 |   5 | 2019-05-20 17:12:19 |
|   8 |   8 | 2019-10-18 17:11:19 |
|   9 |   2 | 2019-10-16 17:09:17 |
|  10 |   3 | 2019-10-15 17:08:17 |
|  11 |   3 | 2019-10-14 19:01:17 |
|   1 |  10 | 2019-10-13 19:02:17 |
|   2 |   8 | 2019-10-12 19:03:19 |
|   3 |   1 | 2019-10-11 19:14:19 |
|   4 |   2 | 2019-10-10 19:12:19 |
|   5 |   3 | 2019-10-09 19:17:19 |
|   6 |   6 | 2019-10-08 19:16:19 |
|   7 |  10 | 2019-10-07 20:07:19 |
|   8 |   9 | 2019-10-06 20:17:19 |
|   9 |   6 | 2019-10-05 21:10:19 |
|  10 |   6 | 2019-10-04 22:12:19 |
|  11 |   9 | 2019-10-03 23:11:19 |
+-----+-----+---------------------+
20 rows in set (0.000 sec)

MariaDB [restoran]> select * from kullan;
+-----+-----+--------+
| yno | zno | miktar |
+-----+-----+--------+
|   1 |   1 |    100 |
|   1 |   4 |    200 |
|   1 |   5 |    300 |
|   1 |  14 |    400 |
|   1 |   7 |    500 |
|   1 |  11 |    550 |
|   2 |  15 |    150 |
|   2 |  13 |    250 |
|   2 |   9 |    350 |
|   2 |   3 |    450 |
|   2 |   8 |    650 |
|   2 |   7 |    750 |
|   3 |   2 |     11 |
|   3 |   5 |     19 |
|   3 |  15 |     25 |
|   3 |   9 |     36 |
|   3 |   4 |    644 |
|   3 |  12 |     89 |
|   4 |   1 |     74 |
|   4 |   9 |     44 |
|   5 |  12 |    220 |
|   5 |  10 |    160 |
|   5 |   3 |    360 |
|   5 |   6 |    250 |
|   6 |  10 |    370 |
|   6 |  11 |    370 |
|   6 |  15 |    210 |
|   6 |  12 |    140 |
|   7 |   1 |    230 |
|   7 |   9 |    261 |
|   7 |   4 |    262 |
|   7 |   7 |    263 |
|   8 |  10 |    164 |
|   8 |   4 |    165 |
|   8 |   2 |    166 |
|   8 |   3 |    167 |
|   8 |  15 |    168 |
|   9 |   3 |    169 |
|   9 |   1 |    755 |
|  10 |  15 |    165 |
|  10 |   3 |    266 |
|  10 |   1 |     64 |
|  10 |   3 |    960 |
|  10 |  15 |     60 |
+-----+-----+--------+
44 rows in set (0.000 sec)

/* Soru 1 */
MariaDB [restoran]> select distinct musteri.mno,musteri.madi,musteri.msoyadi,musteri.mtelefon from malzeme,kullan,siparis,musteri where malzeme.zadi='Kereviz' and malzeme.zno=kullan.zno and kullan.yno=siparis.yno and siparis.mno=musteri.mno;
+-----+---------+---------+------------+
| mno | madi    | msoyadi | mtelefon   |
+-----+---------+---------+------------+
|   1 | Esracan | Gungor  | 5345698729 |
|   2 | Ali     | Kurt    | 0123456789 |
|   4 | Selim   | Gungor  | 1234123400 |
|   5 | Gulcan  | Gungor  | 1234512345 |
|   7 | Gulsum  | Gungor  | 1234567000 |
|   8 | Hamide  | Gungor  | 1234567800 |
|   9 | Yusra   | Gungor  | 1234567900 |
|  11 | Yasin   | Gungor  | 1234567901 |
+-----+---------+---------+------------+
8 rows in set (0.057 sec)

/* Soru 2 */
MariaDB [restoran]> select * from(select k.zno from(select s.yno from(select musteri.mno from musteri,siparis s,yemek where s.yno=yemek.yno and musteri.mno=s.mno except select musteri.mno from yemek,siparis s,musteri where yemek.yno=s.yno and yemek.yadi='Kuru Fasulye' and s.mno=musteri.mno)t,siparis s where t.mno=s.mno)a,kullan k where a.yno=k.yno)b,malzeme m where m.zno=b.zno;
+-----+-----+----------+-------+--------------+
| zno | zno | zadi     | ztipi | zbirimFiyati |
+-----+-----+----------+-------+--------------+
|   1 |   1 | Su       | tip1  |            1 |
|   1 |   1 | Su       | tip1  |            1 |
|   1 |   1 | Su       | tip1  |            1 |
|   1 |   1 | Su       | tip1  |            1 |
|   1 |   1 | Su       | tip1  |            1 |
|   1 |   1 | Su       | tip1  |            1 |
|   2 |   2 | Et       | tip2  |           35 |
|   2 |   2 | Et       | tip2  |           35 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   3 |   3 | Kereviz  | tip3  |           10 |
|   4 |   4 | Sogan    | tip4  |            4 |
|   4 |   4 | Sogan    | tip4  |            4 |
|   4 |   4 | Sogan    | tip4  |            4 |
|   4 |   4 | Sogan    | tip4  |            4 |
|   5 |   5 | Biber    | tip5  |            3 |
|   6 |   6 | Yogurt   | tip2  |            5 |
|   6 |   6 | Yogurt   | tip2  |            5 |
|   7 |   7 | Mantar   | tip4  |            8 |
|   7 |   7 | Mantar   | tip4  |            8 |
|   7 |   7 | Mantar   | tip4  |            8 |
|   7 |   7 | Mantar   | tip4  |            8 |
|   8 |   8 | Patates  | tip3  |            7 |
|   8 |   8 | Patates  | tip3  |            7 |
|   9 |   9 | Kasar    | tip2  |           18 |
|   9 |   9 | Kasar    | tip2  |           18 |
|   9 |   9 | Kasar    | tip2  |           18 |
|   9 |   9 | Kasar    | tip2  |           18 |
|  10 |  10 | Pirinc   | tip3  |           25 |
|  10 |  10 | Pirinc   | tip3  |           25 |
|  10 |  10 | Pirinc   | tip3  |           25 |
|  10 |  10 | Pirinc   | tip3  |           25 |
|  10 |  10 | Pirinc   | tip3  |           25 |
|  10 |  10 | Pirinc   | tip3  |           25 |
|  11 |  11 | Yumurta  | tip4  |            2 |
|  11 |  11 | Yumurta  | tip4  |            2 |
|  11 |  11 | Yumurta  | tip4  |            2 |
|  12 |  12 | Kiyma    | tip4  |           39 |
|  12 |  12 | Kiyma    | tip4  |           39 |
|  12 |  12 | Kiyma    | tip4  |           39 |
|  12 |  12 | Kiyma    | tip4  |           39 |
|  13 |  13 | Ekmek    | tip4  |            2 |
|  13 |  13 | Ekmek    | tip4  |            2 |
|  14 |  14 | Maydanoz | tip4  |            3 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
|  15 |  15 | Domates  | tip4  |            6 |
+-----+-----+----------+-------+--------------+
62 rows in set (0.001 sec)

/* Soru 3 */
MariaDB [restoran]> SELECT distinct count(malzeme.zno),sum(miktar) FROM 
    ->    malzeme, musteri, siparis, yemek, kullan WHERE 
    ->   musteri.madi = 'Ali' AND 
    -> musteri.msoyadi='Kurt' AND
    -> musteri.mno=siparis.mno AND 
    -> siparis.yno=yemek.yno AND 
    -> yemek.yno=kullan.yno AND 
    -> kullan.zno=malzeme.zno AND
    -> yemek.yadi in(
    -> SELECT yemek.yadi FROM
    ->  kullan, malzeme, yemek WHERE
    -> yemek.yno = kullan.yno AND
    -> kullan.zno = malzeme.zno AND
    ->   musteri.madi = 'Ayse' AND 
    -> musteri.msoyadi='Kurt'AND
    -> siparis.yno=yemek.yno 
    -> );
+--------------------+-------------+
| count(malzeme.zno) | sum(miktar) |
+--------------------+-------------+
|                  0 |        NULL |
+--------------------+-------------+
1 row in set (0.000 sec)

/* Soru 4 */
MariaDB [restoran]> select yemek.yadi
    -> from yemek,malzeme,kullan
    -> where kullan.yno=yemek.yno and kullan.zno=malzeme.zno
    -> and malzeme.zno =ALL(select zno from malzeme);
Empty set (0.152 sec)

/* Soru 5*/
MariaDB [restoran]> select distinct yemek.yno,count(kullan.zno)as sayi,sum(ybirimFiyati-(miktar*zbirimFiyati))as karzarar from yemek,malzeme,kullan where kullan.yno=yemek.yno and kullan.zno=malzeme.zno group by yno;
+-----+------+----------+
| yno | sayi | karzarar |
+-----+------+----------+
|   1 |    6 |    -8058 |
|   2 |    6 |   -22630 |
|   3 |    6 |    -7197 |
|   4 |    2 |     -856 |
|   5 |    4 |   -17390 |
|   6 |    4 |   -16638 |
|   7 |    4 |    -8044 |
|   8 |    5 |   -13223 |
|   9 |    2 |    -2431 |
|  10 |    5 |   -13639 |
+-----+------+----------+
10 rows in set (0.001 sec)
