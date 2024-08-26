-- Ülkelerin yaptığı ciroları bulalım
select c.country, SUM(od.quantity * od.unit_price) as ToplamCiro
from customers c
join orders o on c.customer_id = o.customer_id
join order_details od ON o.order_id = od.order_id
group by c.country
order by ToplamCiro desc

-- Ülkelerin yaptığı ciroları yıllara göre dağıtalım
select c.country, EXTRACT(year from o.order_date) as SiparisYili, SUM(od.quantity * od.unit_price) as ToplamCiro
from customers c
join orders o on c.customer_id = o.customer_id
join order_details od on o.order_id = od.order_id
group by c.country, SiparisYili
order by c.country, SiparisYili


-- Çalışanların yaptığı ciro nedir? (1997 yılı)
select e.employee_id, e.first_name || ' ' || e.last_name as CalisanIsmi, SUM(od.quantity * od.unit_price) as ToplamCiro
from employees e
join orders o on e.employee_id = o.employee_id
join order_details od on o.order_id = od.order_id
where EXTRACT(year from o.order_date) = 1997
group by e.employee_id, CalisanIsmi
order by ToplamCiro desc


-- Kargo firmalarının taşıdığı siparişlerin toplam değeri nedir?
select s.shipper_id,s.company_name, SUM(od.quantity * od.unit_price) as ToplamDeger
from shippers s
join orders o on s.shipper_id = o.ship_via
join order_details od on o.order_id = od.order_id
group by s.shipper_id, s.company_name
order by ToplamDeger desc

-- Kategorilere göre ciro nedir?
select c.category_id,c.category_name, SUM(od.quantity * od.unit_price) as ToplamCiro
from categories c
join products p on c.category_id = p.category_id
join order_details od on p.product_id = od.product_id
group by c.category_id, c.category_name
order by ToplamCiro desc


-- 1997 yılındaki ciroların aylara göre dağılımları nedir?
select EXTRACT(month from o.order_date) as order_month, SUM(od.quantity * od.unit_price) as total_revenue
from orders o
join order_details od on o.order_id = od.order_id
where EXTRACT(year from o.order_date) = 1997
group by order_month
order by order_month
