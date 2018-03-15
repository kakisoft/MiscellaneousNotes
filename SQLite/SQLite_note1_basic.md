```
大文字・小文字を区別しない

主キーは１つのテーブルにつき１つ

フィールド名の変更・削除はできない。
そうしたい場合、新しいテーブルを新規で用意する事になる。

文字列はダブルクォーテーションでなく、シングルクォーテーションで囲む。

プライマリキーに指定したカラムは、insert時に何も挿入しなかった場合 or NULL を挿入した場合、
自動で連番が入る。

=====< 型 >=====
integer    整数
real       浮動小数点
text       文字列
blb        バイナリラージオブジェクト
null       データが格納された時に動的に決まる。（文字列が入れば text型）
-----------
他のRDBとの互換を保つために、integerは int, tinyintとも書けるし、
real は doubleとも書けて、text は varchar(255) とも書ける。
-----------
日時を表す型は無く、文字列や数字で管理し、関数を組み合わせてやりくりする。
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
=====< 制約 >=====
```
unique      重複を許可しない
not null    nullを許可しない
default     デフォルト値
check       値のチェック
```

## テーブル削除
```
drop table table01;
drop table if exists table01;
```

## テーブル一覧を確認
.tables
## 外部ファイル読み込み
````
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





