## dump：エクスポート
ログイン後に実行
```
.output dumpfile01.sql
.dump [tablename]
```
※テーブル名を省略した場合、全テーブルが対象

## インポート
ログアウト後に実行
```
sqlite3 myapp02.db < dumpfile01.sql
```

## csvファイルにエクスポート
```
.mode csv
.output users_out.csv
select * from users;
```

## csvファイルからインポート
```
.mode csv
.import users_out.csv users
```
