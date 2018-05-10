## 確認
```sql
select 
    ORIGINAL_NAME
   ,OBJECT_NAME
   ,TYPE
   ,DROPTIME
from
    USER_RECYCLEBIN
```

## 削除
purge recyclebin


## リサイクルビンを残さずにテーブルを削除
drop table XXX purge;

