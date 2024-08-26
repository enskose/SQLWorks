select s.company_name, count(*) 
-- join anahtar kelimesinin sağındaki veya solundaki tabloyla işlem yapmak için left veya right
-- left join shippers tablosunun hepsinin getirir
-- right join orders tablosunun hepsini getirir
from shippers s left join orders o on s.shipper_id = o.ship_via
GROUP BY s.company_name

-- hiç sipariş vermemiş müşterilerim kimlerdir?
select c.company_name, count(o.order_id)
from customers c left join orders o on c.customer_id = o.customer_id
GROUP BY c.company_name
having COUNT(o.order_id) = 0

-- full outer join: solda veya sağda bulunan tabloa kayıtlarında bir eşleşme olduğunda tüm kayıtları döndürür.
select p.product_name, c.category_name 
from categories c
full outer join products p on p.category_id = c.category_id

