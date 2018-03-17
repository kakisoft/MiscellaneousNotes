## ヘルプ
.help

## テーブル作成
```
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
```
drop table table01;
drop table if exists table01;
```

## テーブル一覧を確認
.tables
## 外部ファイル読み込み
```
（ログイン状態から実行）
.read external_command_file01.sql

（ログインしない状態から実行）
sqlite3 myapp01.db < external_command_file01.sql
※powershellでは「<」が予約語となっているため、実行できない。
```

## スキーマ確認
.schema [テーブル名]

## テーブル作成
無ければ作成（以下の例は、「posts」というテーブル名）
```
CREATE table if not exists posts(
   id     integer primary key
  ,title  text
  ,body   text
  ,size   real
  ,image  blb  
  ,other  
);
```

## テーブル名変更
alter table table01 rename to table02;

## カラム追加
alter table table01 add column added_column01 text;








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
--                       ,created_at datetime (datetime('now', '+09:00:00')) --日付型は無いが、こう書ける？
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

## 組み込み関数
集計
```
select
    count(id)
   ,max(score)
   ,min(score)
   ,avg(score)
from
    users;
``` 
文字列操作
```
select
    name
   ,length(name)
   ,upper(name)
   ,substr(name, 2, 3)
from
    users;
```
直近で挿入されたレコードのrowid
```
select last_insert_rowid();
```
ランダムに１つ抽出
```
select * from users order by random() limit 1;
```

## case
```
select
    id
   ,score
   ,case
      when score > 70 then 'A'
      when score > 50 then 'B'
      else 'C'
    end as rank
from
    users
;
```

## transaction
```
begin transaction;
update users set score = score + 10 where score > 10;
delete from users where score >= 100;
commit;
```

## rollback
```
begin transaction;
update users set score = 0;
rollback;
```

## trigger
```
-- CREATE table if not exists messages (message);
create trigger new_winner update of score on users when new.score > 100
begin
  insert into messages (message) values (
    'name:' || new.name ||
    ' ' || old.score ||
    '->'  || new.score
  );
end;
```
削除
```
drop trigger <trigger_name>
```

## index
```
create index score_index on users(score);
create unique index name_index on users(name);  --重複を許可しない
検索は早くなるが、更新・挿入は遅くなる
```
確認
```
.indices [<テーブル名>]
.schema [<テーブル名>]
.drop indes if exists <定義名>
```

## 日付
```
select
 datetime('now')              as "タイムゾーンを考慮しない"
,datetime('now', '+09:00:00') as "日本時間"
,date()
,time()
,date('2015-07-17', '+3 months', 'start of month', '-1 day') --２か月後の末日
;
```


