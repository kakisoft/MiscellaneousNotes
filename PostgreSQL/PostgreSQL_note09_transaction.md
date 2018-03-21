## トランザクション
```sql
begin;
update users 
   set score = score - 1.0
where true
  and name like 'k%'
;

update users 
   set score = score + 1.0
where true
  and name like '%wa'
;

commit;
```

## ロールバック
```sql
begin;
  ～
rollback;
```