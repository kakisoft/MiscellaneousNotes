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
```sql
CREATE table if not exists posts(
   id     integer primary key
  ,title  text
  ,body   text default 'no name'
  ,size   realINTEGER    
  ,image  blb  
  ,other  
);
```
 * real：小数を扱える
 * INTEGER：符号付整数。1, 2, 3, 4, 6, or 8 バイトで格納
 * TEXT：テキスト。UTF-8, UTF-16BE or UTF-16-LEのいずれかで格納
 * BLOG：Binary Large OBject。入力データをそのまま格納
 * NULL：NULL値


## テーブル名変更
alter table table01 rename to table02;

## カラム追加
alter table table01 add column added_column01 text;

## テーブル作成
```sql
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
```sql
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
```sql
drop view if exists viewname1;
```

## trigger
```sql
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
```sql
drop trigger <trigger_name>
```

## index
```sql
create index score_index on users(score);
create unique index name_index on users(name);  --重複を許可しない
検索は早くなるが、更新・挿入は遅くなる
```
確認
```sql
.indices [<テーブル名>]
.schema [<テーブル名>]
.drop indes if exists <定義名>
```
