-- Union: iki farkli sorguyu tek bir sonuç olarak birleştirmeye yarar
-- Sorgudaki kolon sayıları aynı olmak zorundadır. Gelen kayıtlar tekildir. 
-- Hepsini görmek istersek union all ifadesini kullanmak gerekir.

SELECT p.product_id , p.product_name 
from products p 
UNION 
SELECT p1.product_id , p1.product_name 
from yedekurunler p1 