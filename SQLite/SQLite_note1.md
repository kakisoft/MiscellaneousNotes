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
create table table01 ( id, head, body );

## テーブル削除
```
drop table table01;
drop table if exists table01;
```

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





