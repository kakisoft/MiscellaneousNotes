## 確認
select 
    ORIGINAL_NAME
   ,OBJECT_NAME
   ,TYPE
   ,DROPTIME
from
    USER_RECYCLEBIN


## 削除
PURGE RECYCLEBIN


## リサイクルビンを残さずにテーブルを削除
DROP TABLE XXX PUERGE;

