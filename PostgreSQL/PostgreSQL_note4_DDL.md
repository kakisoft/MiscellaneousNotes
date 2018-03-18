## テーブル一覧を表示
\dt

## スキーマ確認
\d [テーブル名]

## 外部ファイルからコマンドを実行
 \i external_command_file01.sql

## テーブル作成
```
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




