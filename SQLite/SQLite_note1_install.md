
## インストール（Windows）
choco install sqlite

## GUI管理ツール
DB Browser for SQLite
```
choco install sqlitebrowser
choco upgrade sqlitebrowser
```

## サードパーティ製ライブラリ
https://www.npmjs.com/package/sqlite3-webapi-kit
```
npm install sqlite3-webapi-kit
```

## バージョン確認
sqlite3 --version


## 起動（myapp01.dbを起動。無ければ作成する。）
sqlite3 myapp01.db

## 終了
.exit

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





