## テーブル一覧を表示
\dt

## スキーマ確認
\d [テーブル名]

## 外部ファイルからコマンドを実行
 \i external_command_file01.sql

## テーブル作成
```sql
create table table01 (
                        id        serial        primary key
                       ,title     varchar(255)  not null
                       ,body      text          check(length(body) > 5)
                       ,is_draft  boolean       default TRUE
                       ,created   timestamp     default 'now'
                     );
```

## テーブル名変更
alter table table01 rename to table02;

## テーブル削除
drop table table02;

## カラム追加
alter table table01 add column01 varchar(255);

## カラム削除
alter table table01 drop column01;

## カラム名変更
alter table table01 rename column01 to column02;

## カラム定義変更
alter table table01 alter column01 type varchar(32);

## インデックス作成
（「column01」という項目で検索される事が多くなった、等    
　検索は速くなるが、upsertは遅くなる。）    
create index column01_index on table01(column01);

## インデックス削除
drop index column01_index;

