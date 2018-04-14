## 作成
```sql
create sequence MY_SEQUENCE_01  
    minvalue 1 
    maxvalue 9999 
    increment by 1 
    start with 1 
    cache 20 
    nocycle  
    noorder  
--    nopartition
```

```
create sequence ROUND_SEQ
    increment by 1
    start with 0
    maxvalue 9
    minvalue 0
    cycle 
    nocache
    order 
```

## 使用
```
select 
    MY_SEQUENCE_01.currval   
   ,MY_SEQUENCE_01.nextval  
from 
    dual
```

## デフォルトをシーケンスに設定
https://github.com/kakisoft/MiscellaneousNotes/blob/master/Oracle/sample_create_table/12/04_2_create_table02.sql
