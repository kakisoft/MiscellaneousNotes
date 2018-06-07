## ＜連番があるかどうか＞
『 「N+1」との集合を取り、積集合が 1以上であれば、連席あり』というロジックで行けそう。
```
select
 count(*)
from
 TABLE3
where  1=1
  and  COLUMN1 = 1
  and  ID in (
               select
                (ID + 1)
               from
                TABLE3
               where  1=1
                 and  COLUMN1 = 1
             )
```




## ＜抜け番＞


