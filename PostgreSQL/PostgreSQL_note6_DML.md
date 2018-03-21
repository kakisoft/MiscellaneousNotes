## insert
```sql
insert into table01 (title, body) values ('title1','body001');


insert into table01 (title, body) values 
 ('title3','body003')
,('title4','body004')
,('title5','body005')
;
```

## limit
```
（スコア上位３件）
select * from table01 order by score limit3;
```

```sql
select 
    * 
from 
    table01 
where true 
order by 
    title limit 3
;
```

## offset
```sql
select * from table01 order by title limit 3 offset 3;
```

```
concat
substring
```
### ランダム
```sql
select ramdom()
```

### 無作為に抽出
```sql
select * from table01 order by random() limit 1;
```

