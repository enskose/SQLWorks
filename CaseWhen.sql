select first_name, last_name, country from employees

-- case kullanımı swtich case benzeri bir yapı
select first_name, last_name, 
case (country) 
    when 'USA' then 'Amerika' -- USA yerine Amerika
    when 'UK' then 'İngiltere' -- UK yerine İngiltere
end    
from employees

-- ürün fiyatı 50'den ucuzsa ucuz ürün, 50 ile 150 arasındaysa ekonomik ürün, 150 ile 200 arasında ise pahalı
-- 200 ve üzerindeyse lüks kategorisine alalım
select product_name, unit_price,
CASE
    when unit_price < 50 then 'Ucuz Ürün'
    when unit_price >= 50 and unit_price < 150 then 'Ekonomik Ürün'
    when unit_price >= 150 and unit_price < 200 then 'Pahalı Ürün'
    else 'Lüx Ürün'
end 
 from products