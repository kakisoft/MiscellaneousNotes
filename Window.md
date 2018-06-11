## Lead・Rank・
http://www.oracle.com/technetwork/jp/articles/otnj-sql-image3-3-323605-ja.html

```sql
select
 ID
,Lead(ID) over(order by ID) as NEXT_ID
from
 TABLE1
```

