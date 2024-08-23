-- Tarih sorgularında genel olarak kullanılan date_part fonksiyonu vardır
select * from orders where DATE_PART('year', order_date) = 1996 and DATE_PART('month', order_date) = 07 and DATE_PART('day', order_date) = 15
select DATE_PART('doy', CURRENT_TIMESTAMP) -- day of year
select DATE_PART('dow', CURRENT_TIMESTAMP) -- day of week
select CURRENT_TIMESTAMP -- anlık gün ve saat

select * from employees
select AGE(CURRENT_TIMESTAMP, birth_date) from employees -- çalışanların yaşı
select NOW() -- şu andaki tarih ve zaman
show timezone -- saat dilimi

select DATE_PART('quarter', order_date) from orders;
-- 96 yılının 4. çeyreğindeki order'ları listeler
select * from orders where DATE_PART('quarter', order_date) = 4 and DATE_PART('year', order_date) = 1996

