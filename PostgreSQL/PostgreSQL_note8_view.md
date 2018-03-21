### view一覧
/dv

## view作成
```sql
create view view01 as
(
        select 1 
  union select 2
  union select 3
  union select 4
  union select 5
  order by 1
)
;
```
## view削除
```sql
drop view view01;
```

