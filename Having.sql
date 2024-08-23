-- Ülkelerin siparişlerinin yıllara göre dağılımı 
select extract(year from order_date) yil, ship_country, count(*) adet 
from orders group by extract(year from order_date), ship_country 
having count(*) >= 10 and count(*) <= 20 order by adet desc

-- En yüksek cirolu ilk 5 sipariş
select order_id, sum(unit_price * quantity) Ciro from order_details GROUP BY order_id ORDER BY Ciro desc limit 5

-- Toplam cirosu 5000 ile 10.000 arası olan siparişlerin listesi
select order_id, sum(unit_price * quantity) Ciro from order_details group by order_id having sum(unit_price * quantity) > 5000 
and sum(unit_price * quantity) < 10000 ORDER BY Ciro desc

-- between ile çözümü
select order_id, sum(unit_price * quantity) Ciro from order_details group by order_id having sum(unit_price * quantity) > 5000 
and sum(unit_price * quantity) < 10000 ORDER BY Ciro desc