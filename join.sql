-- Join işlemi

-- 1 - Inner Join: Bir tablodaki her bir kaydın diğer tabloda bir karşılığı olan kayıtları listeler
-- Inner Join ifadesini yazarken Inner yazmasak da default olarak Inner Join işlemi yapacaktır
-- Seçtiğimiz sütunlar içerisinde her iki tabloda da aynı sütunlar var ise açıkça bildirmek zorundayız

select * from products 
inner join categories on products.category_id = categories.category_id

select products.product_name, categories.category_name from products 
inner join categories on products.category_id = categories.category_id

-- Filtreleme, ilişkisel veritabanı, p, c, s tarzında isimlendirme yaparak daha okunabilir bir kod yazdık
select p.product_name, c.category_name, s.company_name from products p
inner join categories c on p.category_id = c.category_id
inner join suppliers s on s.supplier_id = p.supplier_id

-- Almanyadan tedarik ettiğim ürünler hangileridir ve kategorileri nelerdir?
select p.product_name, c.category_name, s.company_name, s.country
from products p
inner join suppliers s on p.supplier_id = s.supplier_id
inner join categories c on c.category_id = p.category_id
where s.country = 'Germany'

-- Yıllara göre ciro dağılımı

select extract(year from o.order_date) Yil, Round(sum(floor(od.unit_price * od.quantity))) Ciro
from orders o
inner join order_details od on o.order_id = od.order_id
group by extract(year from o.order_date)
order by Yil

