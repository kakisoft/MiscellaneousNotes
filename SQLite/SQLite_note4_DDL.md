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
