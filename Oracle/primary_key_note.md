## 主キーを検索
```sql
select
    USER_CONS_COLUMNS.OWNER
   ,USER_CONS_COLUMNS.TABLE_NAME
   ,USER_CONS_COLUMNS.COLUMN_NAME
   ,USER_TAB_COLUMNS.DATA_TYPE
   ,USER_TAB_COLUMNS.DATA_LENGTH
from
    USER_CONS_COLUMNS
    left join USER_TAB_COLUMNS on USER_CONS_COLUMNS.COLUMN_NAME = USER_TAB_COLUMNS.COLUMN_NAME
    inner join USER_CONSTRAINTS on USER_CONS_COLUMNS.CONSTRAINT_NAME = USER_CONSTRAINTS.CONSTRAINT_NAME 
                               and  USER_CONSTRAINTS.CONSTRAINT_TYPE = 'P'
where  1=1
order by 1,2,3
```



### USER_CONSTRAINTS
CONSTRAINT_NAME（制約名）はあるが、カラム名が無い。      
CONSTRAINT_TYPE = 'P'  が主キー。

その他のCONSTRAINT_TYPEで表示される制約定義の種類。
 * C - 表でのチェック制約
 * P - 主キー
 * U - 一意のキー
 * R - 参照整合性
 * V - ビューでのチェック・オプション付き
 * O - ビューで読取り専用
 * H - ハッシュ式
 * F - REF列を含む制約
 * S - サプリメンタル・ロギング

　      
https://blogs.oracle.com/oracle4engineer/oracle-database-v24



## USER_CONS_COLUMNS
現行のユーザーが所有していて、制約定義に指定されている列を示す。


### USER_TAB_COLUMNS
現行のユーザーが所有する表

