## DB一覧表
\dt

## スキーマ確認
\d [テーブル名]

## 外部ファイルからコマンドを実行
 \i external_command_file01.sql

## テーブル作成
```
create table table01 (
                        title varchar(255)
                       ,body text
                     );
```

## テーブル名変更
alter table table01 rename to table02;

## テーブル削除
drop table table02;




create table table01 (
                        title varchar(255)
                       ,body text
                     );


数値：integer(int), real（小数）, serial（連番）
文字：char（固定長）, varchar(255) 上限付き可変長、text（上限なし）
真偽：boolean
日付：date, time, timestamp
https://www.postgresql.org/docs/10/static/datatype.html
