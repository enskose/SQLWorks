-- customers tablosunda ülkesi = UK olan ve şehri = Cowes olan kayıtları listeler
select * from customers where country = 'UK' and city = 'Cowes'

-- region kısmı null olan kayıtları listeler
select * from customers where region is null

-- tarih ile ilgili alanların sorgulanması 
select * from orders where date_part('year', order_date) = 1996 and date_part('month', order_date) = 04 and date_part('day', order_date) = 16

-- amerika dışındaki tedarikçilerin listesi
select * from suppliers where country != 'USA'

-- işlenecek konular
-- like, sum, count, avg fonksiyonları, sub query 
-- gruplama ve having 
-- join (inner, left, right, full)
-- procedure, view, trigger, konuları ele alınacak
-- crud işlemleri Create, Update, Delete

-- Kendi databese'imizi oluşturma
-- Normalization 