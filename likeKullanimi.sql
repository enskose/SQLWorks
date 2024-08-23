-- Like kullanımı WHERE şartından sonra kullanılır 
select * from employees where first_name like 'M%' -- PostgreSQl key sensivity, büyük küçük harf duyarlıdır

-- First Name'i 'a' ile bitenler
select * from employees where first_name like '%a'

-- First Name'inin içerisinde 'an' harfleri olanları listeler
select * from employees where first_name like '%an%'

-- Pattern oluşturma işlemi: ismin ilk harfi 'a' olacak, ikinci harf önemli değil, 3. harf n olan çalışanlar
select * from employees where first_name like 'a_n%' -- alt çizgi (_) aradaki 1 karakterin ne olduğunu bilmiyorum demek
                                                     -- yani 1. harf, 2. harf bilinmiyor, 3. harf n   

-- Notlarda Italian kelimesi geçenler
select * from employees where notes ILIKE '%italian%' -- ILIKE keysensivty olmadan listemek için

-- Adının ilk harfi a ya da l olanlar
select * from employees where first_name SIMILAR TO '[AL]%' -- PostgreSQL SIMILAR TO kullanımı: Bu, first_name değeri a veya l ile başlayan tüm kayıtları döndürür.
select * from employees where LOWER(first_name) SIMILAR TO '[al]%' -- LOWER() fonksiyonu ile keysensivty aşılabilir
select * from employees where lower(first_name) SIMILAR TO '[j-r]%' ORDER BY first_name

select * from employees where lower(first_name) SIMILAR TO '%[j-r]%' ORDER BY first_name

