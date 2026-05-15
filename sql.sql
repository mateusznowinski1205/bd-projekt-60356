-- 1. > **Lista 1 SQL**

-- [ ] Zadanie 1 


select drg_name 
from drug limit 5;


-- [ ] Zadanie 2


select drg_description 
from drug
where drg_description like '%przeciwzapalny%'


-- [ ] Zadanie 3


select ord_audit_cd 
from `order`
order by ord_audit_cd desc


-- [ ] Zadanie 4

select ord_comment, ord_status 
from `order`
where ord_status = 'RECEIVED'
order by ord_audit_cd ASC


-- [ ] Zadanie 5


SELECT 
    ord_audit_cd,
    pha_id,
    pha_name AS pha,
    usr_login AS login,
    usr_id
FROM
    pharmacy AS p,
    `user`,
    `order`
WHERE
    `user`.usr_id = `order`.ord_usr_id
        AND p.pha_id = `order`.ord_pha_id
        AND usr_id = 10
        AND pha_id = 1
        AND ord_audit_cd LIKE '%2025%';


-- [ ] Zadanie 6 

SELECT 
    usr_id,
    usr_enabled,
    usr_name,
    usr_surname,
    usr_phone,
    usr_audit_cd
FROM
    `user`;

-- 2. > **Lista 2 SQL**

-- Zadanie 1

SELECT 
    o.ord_id,
    o.ord_status,
    o.ord_comment,
    o.ord_audit_cd,
    o.ord_audit_md,
    u.usr_name,
    u.usr_surname,
    p.pha_name
FROM
    `order` AS o
        JOIN
    `user` AS u ON o.ord_usr_id = u.usr_id
        JOIN
    pharmacy AS p ON p.pha_id = o.ord_pha_id;

-- Zadanie 2

SELECT distinct 
   o.ori_ord_id,
   o.ori_price,
   o.ori_qty,
   d.drg_name
FROM
    order_drug AS o
        JOIN
    drug AS d ON o.ori_drg_id = d.drg_id

-- Zadanie 3

SELECT ori_ord_id, COUNT(*)
FROM order_drug
GROUP BY ori_ord_id;

-- Zadanie 4

SELECT 
    u.usr_name, u.usr_surname, u.usr_id, COUNT(*) as liczba_zamówien
FROM
    `order` AS o
        JOIN
    `user` AS u ON o.ord_usr_id = u.usr_id
GROUP BY 
	u.usr_id, 
    u.usr_name, 
    u.usr_surname;

-- Zadanie 5 

SELECT 
    ori_ord_id, sum(ori_price * ori_qty) AS wartosc
FROM
    order_drug
GROUP BY ori_ord_id;

-- Zadanie 6

SELECT 
    u.usr_name, u.usr_surname, u.usr_id, COUNT(*) as liczba_zamowien
FROM
    `order` AS o
        JOIN
    `user` AS u ON o.ord_usr_id = u.usr_id
GROUP BY 
	u.usr_id, 
    u.usr_name, 
    u.usr_surname
having liczba_zamowien > 1;

-- 2. > **Lista 2 SQL**

-- Zadanie  1

SELECT 
    *
FROM
    `user` AS u
WHERE
    EXISTS (SELECT 
            1
        FROM
            `order` AS o
        WHERE
            o.ord_usr_id = u.usr_id);

-- Zadanie 2 



-- Zadanie 3 

SELECT 
    o.ori_id, o.ori_price, ord.ord_comment
FROM
    order_drug AS o
        JOIN
    `order` AS ord ON o.ori_ord_id = ord.ord_id
WHERE
    o.ori_price > (SELECT 
            AVG(ori_price)
        FROM
            order_drug);