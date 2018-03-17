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



