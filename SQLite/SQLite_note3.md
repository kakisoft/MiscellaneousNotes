```
=====< 制約 >=====
unique      重複を許可しない
not null    nullを許可しない
default     デフォルト値
check       値のチェック
```
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
## like
```
_  任意の位置文字
%  0字以上の文字
大文字と小文字を区別しない。
```
```
エスケープ文字を指定して検索ができる。
select * from users where name like '%@%' escape '@';
```

## glob
大文字小文字を区別する
?      任意の１文字
*      0回以上の繰り返し
[abc]  abcのどれか
[a-z]  a～zのどれか
※プチ正規表現として使用できる、と解釈しよう。

## limit
```
（上位３件を表示）
select * from users order by score desc limit 3;

（上位２件を飛ばして、上から３件を表示。）
select * from users order by score desc limit 3 offset 2;
select * from users order by score desc limit 2, 3;
```

## view
```
create view viewname1 as 
   select
       name
      ,score
   from
       users
   where  1=1
     and  name is not null
   order by
       score desc
   limit 5
;
```
削除
```
drop view if exists viewname1;
```


