 CREATE OR REPLACE FUNCTION get_my_variable() RETURNS TEXT AS $$
DECLARE
    my_variable TEXT := 'some_value';
BEGIN
    RETURN my_variable;
END $$ LANGUAGE plpgsql;
 
-- Fonksiyonu çalıştırarak değeri alabilirsiniz
SELECT get_my_variable();