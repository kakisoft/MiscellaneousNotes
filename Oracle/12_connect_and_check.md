## プラガブルデータベース起動
```
alter pluggable database orclpdb open;
```

## 現在のコンテナをプラガブルデータベースに変更
```
alter session set container = orclpdb;
```

## 接続中のコンテナを確認
```
show con_name;
```
ルートコンテナに接続している状態なら「CDB$ROOT」となる。

### open_mode 確認
```
select name, open_mode from v$pdbs;
```
READ WRITEとなっているか確認。

```
Oracle Database 12c R1からマルチテナントアーキテクチャと呼ばれるアーキテクチャが導入された。

ルートコンテナにはローカルユーザーを作成することができない。
ルートコンテナにローカルユーザーを作成しようとすると、エラーが発生する。

マルチテナントアーキテクチャでは、単一のインスタンス内に複数のデータベースを配置することができる。
マルチテナントアーキテクチャにおける個々のデータベースをプラガブルデータベース(PDB)と呼ぶ。
マルチテナントアーキテクチャにただ1つ存在する管理用のデータベースとしてマルチテナントコンテナデータベース(CDB)が存在する。
マルチテナントコンテナデータベースをルートコンテナと呼ぶ場合もある。
```

### アーキテクチャ
https://www.climb.co.jp/blog_dbmoto/archives/1272

### Oracle 12cでユーザ登録からテーブル作成までをやってみた。
http://replication.hatenablog.com/entry/2015/08/05/093000

## ネットワーク利用の有効化Add Star
http://d.hatena.ne.jp/cyokodog-memo/20120522/1337676161

```
データベースmylocaldbに接続中です。
PL/SQLの実行中: CALL DBMS_DEBUG_JDWP.CONNECT_TCP( '127.0.0.1', '54003' )
ORA-24247: アクセス制御リスト(ACL)によりネットワーク・アクセスが拒否されました
ORA-06512: "SYS.DBMS_DEBUG_JDWP", 行68
ORA-06512: 行1
プロセスが終了しました。
データベースmylocaldbから切断中です。
```
