## dump：エクスポート
ログイン後に実行
```
.output dumpfile01.sql
.dump users
```
※テーブル名を省略した場合、全テーブルが対象

## インポート
ログアウト後に実行
```
sqlite3 myapp02.db < dumpfile01.sql
```

.output dumpfile02.sql
.dump


sqlite3 myapp01.db < dumpfile02.sql
