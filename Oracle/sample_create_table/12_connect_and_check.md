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
