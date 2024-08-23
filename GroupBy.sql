select country, COUNT(country) from employees GROUP BY country -- her bir ülkeden kaç adet var, onu gösterir

-- Hangi ülkeden kaç adet müşterim var, azalan şekilde sırala
select country, COUNT(*) from customers GROUP BY country ORDER BY 2

-- Hangi kategoriden kaç adet ürün var
select category_id, COUNT(*) from products GROUP BY category_id

-- Hangi tedarikçiden kaç adet ürün alıyorum
select supplier_id, count(*) from products GROUP BY supplier_id

-- 97 yılında hangi ülkeye kaç adet sipariş gönderdim
select ship_country, count(*) from orders where extract(year from order_date) = 1997 GROUP BY ship_country

-- 97 yılında en az sipariş veren ülkeler hangileridir
select ship_country, count(*) from orders where extract(year from order_date) = 1997 GROUP BY ship_country ORDER BY count limit 3

-- 98 yılında en fazla sipariş alan çalışanlarımdan ilk 3'ü hangisidir
select employee_id, count(*) from orders where extract(year from order_date) = 1998 GROUP BY employee_id ORDER BY count desc limit 3

-- kargo firmalarının taşıdığı sipariş sayısı nedir
select ship_via, count(*) from orders GROUP BY ship_via ORDER BY 2 desc 