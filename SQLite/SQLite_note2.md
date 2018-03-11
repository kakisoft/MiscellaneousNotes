## テーブル作成
```
create table table01 ( id, column01, column02 );
create table table02 ( 
                        id           integer primary key
                       ,column_int   integer
                       ,column_text  text 
                       ,column_real  real 
                       ,column_blb   blb 
                       ,column_null 
                     );
```

## insert
```
insert into table01 ( column01, column02 ) values ('value01', 'value12');
insert into table01 ( id, column01, column02 ) values ( null, 'value02', 'value12');
insert into table01 ( id, column01, column02 ) values ( null, 'value03', 'contain'' commna');
insert into table01 ( id, column01, column02 ) values ( null, 'value04', '改行
                                                                          する');
```
