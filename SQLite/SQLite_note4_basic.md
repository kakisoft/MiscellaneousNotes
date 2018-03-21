## ヘルプ
.help

## テーブル作成
```sql
create table table01 ( id, column01, column02 );
create table table02 ( 
                        id           integer primary key  autoincrement
                       ,column_int   integer
                       ,column_text  text 
                       ,column_real  real 
                       ,column_blb   blb 
                       ,column_null 
                     );

drop table if exists users;
create table users (
                      id     integer primary key
                     ,name   text    not null
                     ,score  integer default 10 check (score >=0)
                     ,memo   text    default 'user profile'
                     ,email  text    unique
                   );
```
※integer primary key => rowid    

## テーブル削除
```sql
drop table table01;
drop table if exists table01;
```

