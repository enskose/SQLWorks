create or replace FUNCTION public.Calisanlar(yil INT)
 returns TABLE (Calisan   varchar, ciro NUMERIC) 
as 
$func$
select  e.First_Name Calisan,sum(od.Quantity*od.Unit_Price*(1-Discount)) Ciro 
    from Employees e
    inner join orders o on e.Employee_ID = o.Employee_ID
    inner join Order_Details od on od.Order_ID=o.Order_ID
    where date_part('year',o.order_date)=yil 
     group by  e.First_Name 
    order by ciro desc ;
$func$
LANGUAGE sql;

select * from Calisanlar(1997);

CREATE OR REPLACE FUNCTION public.CalisanPerformansi()
    RETURNS TABLE (
        Calisan VARCHAR,
        Yil INT,
        Adet BIGINT,
        Ciro FLOAT8
    )
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT e.first_name Calisan, 
    EXTRACT(year from o.order_date)::int as Yil,
    COUNT(*) as Adet, 
    SUM(od.quantity * od.unit_price)
    FROM employees as e
    JOIN orders o on o.employee_id = e.employee_id
    JOIN order_details as od on od.order_id = o.order_id
    GROUP BY e.first_name, EXTRACT(YEAR FROM o.order_date);
END $$;

select * from public.CalisanPerformansi(1)

