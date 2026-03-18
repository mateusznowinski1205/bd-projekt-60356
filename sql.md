1. > **Lista 1 SQL**

- [ ] Zadanie 1 

```
select drg_name 
from drug limit 5;
```

- [ ] Zadanie 2

```
select drg_description 
from drug
where drg_description like '%przeciwzapalny%'
```

- [ ] Zadanie 3

```
select ord_audit_cd 
from `order`
order by ord_audit_cd desc
```

- [ ] Zadanie 4

```
select ord_comment, ord_status 
from `order`
where ord_status = 'RECEIVED'
order by ord_audit_cd ASC
```

- [ ] Zadanie 5

```
select ord_audit_cd, pha_id, pha_name as pha, usr_login as login, usr_id 
from pharmacy as p, `user` , `order`
where `user`.usr_id = `order`.ord_usr_id 
AND p.pha_id = `order`.ord_pha_id
and usr_id = 10 
and pha_id = 1 
and ord_audit_cd like '%2025%';

```
- [ ] Zadanie 6 

```
select usr_id, usr_enabled, usr_name, usr_surname, usr_phone, usr_audit_cd
from `user`;
```
