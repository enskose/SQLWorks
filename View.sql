-- View'lar, karmaşık sorguları daha kolay tekrar kullanmak ve veritabanı şemasını daha anlaşılır hale getirmek için kullanılır.
-- View'lar sanal tablolardır; veriyi fiziksel olarak saklamazlar, sadece sorgunun sonucunu saklarlar.
-- Yukarıdaki örnekte, UrunlerListesi view'ı, ürünlerin isimlerini, kategorilerini ve tedarikçilerini içeren bir sanal tablo gibi davranır.
-- Bu sayede veriyi yönetmek ve analiz etmek daha kolay hale gelir.

create VIEW UrunlerListesi
as 
select p.product_name,c.category_name ,s.company_name
from products p
inner join categories c on p.category_id = c.category_id
inner join suppliers s on s.supplier_id = p.supplier_id

select category_name,count(*) Adet
from UrunlerListesi 
Group by category_name