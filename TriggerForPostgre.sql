CREATE OR REPLACE FUNCTION stok_kontrol()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
DECLARE
   eldekistok int;
   fark int;
BEGIN
   RAISE NOTICE 'Yeni Kayit : % Gelen Stock Id:%', NEW, NEW.product_id;
   
   SELECT p.units_in_stock INTO eldekistok 
   FROM products p 
   WHERE p.product_id = NEW.product_id;

   RAISE NOTICE 'Eldeki Stok :%', eldekistok;
   
   SELECT (eldekistok - NEW.quantity) INTO fark;

   RAISE NOTICE 'Eldeki stok  : %  Gelen Siparis:% fark:%', eldekistok, NEW.quantity, fark;  
    
   IF fark < 0 THEN
       RAISE EXCEPTION 'Eldeki stok yeterli değil: % . Yeteri kadar urun yok.', (eldekistok - NEW.quantity);
   END IF;
   
   IF NEW.quantity < 0 THEN
       RAISE EXCEPTION 'Adet 0''dan kucuk olamaz: %', NEW.quantity;
   END IF;

   RETURN NEW;
END;
$$;

CREATE TRIGGER order_details_before_insert
BEFORE INSERT
ON order_details
FOR EACH ROW
EXECUTE FUNCTION stok_kontrol();

select * from order_details where order_id =10248 limit 5
delete from order_details where order_id =10248 and product_id =1

insert into order_details (order_id,product_id,unit_price,quantity,discount)
values (10248,1,10,400,0)
