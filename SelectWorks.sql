-- customers tablosunda ülkesi = UK olan ve şehri = Cowes olan kayıtları listeler
select * from customers where country = 'UK' and city = 'Cowes'

-- region kısmı null olan kayıtları listeler
select * from customers where region is null

-- tarih ile ilgili alanların sorgulanması 
select * from orders where date_part('year', order_date) = 1996