```
大文字・小文字を区別しない
```

### インストール（Windows）
choco install sqlite

### バージョン確認
sqlite3 --version

## ヘルプ
.help

### 起動（myapp01を起動。無ければ作成する。）
sqlite3 myapp01

## 終了
.exit

## テーブル作成
create table tmp01 ( id, head, body );

## テーブル削除
drop table tmp01;

## テーブル一覧を確認
.tables

## 外部ファイル読み込み
.read external_command_file01.sql
<!-- sqlite3 myapp01.db < external_command_file01.sql -->

## スキーマ確認
.schema [テーブル名]

## テーブル作成
無ければ作成（以下の例は、「posts」というテーブル名）
```
CREATE table if not exists posts(
   id
  ,title
  ,body
);
```

