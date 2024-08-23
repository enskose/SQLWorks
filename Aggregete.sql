-- Bu bölümdeki genel hatlar: toplama fonksiyonları, gruplama fonksiyonları, sayma fonksiyonlar
select count(*) from employees -- bütün çalışanların sayısı
select count(first_name) from employees -- 9 kayit
select count(region) from employees -- 5 kayit: null değerleri saymaz!!
select * from employees where region is null -- region bölümü null olan kayıtlar
select count(DISTINCT country) from employees -- DISTINCT farklı değerleri getirir

-- SUM => Toplama
select SUM(unit_price) from products -- products tablosundaki unit_price sütunundaki sayısal değerlerin toplamı
select * from products

select avg(date_part('year', birth_date)) from employees -- çalışanların yaşlarının ortalaması
select avg(unit_price) from products where category_id = 1 -- category_id'si 1 olan kategorideki birim fiyatlarının ortalamasını alır

-- Yukarı yuvarlama
select ceiling(10.5)
select ceiling(11.5)

-- Aşağıya yuvarlama
select floor(10.9)
select floor(10.5)
select floor(10.1)

-- Normal yuvarlama
select ROUND(10.3)
select ROUND(10.5)
select ROUND(10.7)

-- Max, Min bulma
select max(unit_price) from products
select * from products order by unit_price desc limit 3 -- en pahalı 3 tane kayıtı getirir
select min(unit_price) from products

-- Order By, sıralama
select * from employees order by first_name
-- Azalan sıralama
select * from employees order by first_name desc
select * from employees order by first_name desc, birth_date -- virgül(,) ile ayırarak istediği kadar uzatılabilir

select first_name, last_name, birth_date, title from employees order by 2, 4 -- seçilen kolonların sırasına göre sıralandırabilir
-- kolonları isimlendirip yeni isimlerine göre sıralama
select first_name Ad, last_name Soyad, birth_date DogumTarihi, title from employees order by Ad, DogumTarihi


