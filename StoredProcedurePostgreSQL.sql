-- orders tablosuna insert atan procedure
select * from orders limit 5

-- VINET 1 numaralı employee arasin ve 1, 10, 40 numaralı ürünlerden 10 adet sipariş versin
select * from products where products.product_id in (1, 10, 40)

-- Kayıt eklemede kullanılacak olan komut insert komutu
-- insert into <tablo_adi> (column_1, column_2, vb.) values (value_1, value_2, vb.)
insert into orders (order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_city, ship_country)
values (831, 'VINET', 1, '2024-08-27', '2024-09-15', '2024-08-27', 'Istanbul', 'Turkey')

INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount)
values (831, 40, 25, 10, 0)

select * from order_details where order_id = 831

-- UPDATE: veri güncelleme
update orders set ship_via = 1 where order_id = 831

select * from orders where order_id = 831

-- DELETE: kayıt silme
DELETE FROM shippers where shipper_id = 7
select * from shippers

CREATE OR REPLACE PROCEDURE KargoEkle (shipper_id int, firmadi varchar, telefon varchar)
language plpgsql 
as $$
DECLARE
-- variable declaration
BEGIN
-- stored procedure body
insert into shippers (shipper_id, company_name, phone) values (shipper_id, firmadi, telefon)
end; 
$$;

call KargoEkle(7, 'MNG Kargo', '444 44 44')
select * from shippers
