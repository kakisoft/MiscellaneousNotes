## 設定内容確認
show variables

## 設定ファイル
/etc/my.cnf

## データベース一覧表示
show databases

## 前回のエラー内容を表示
show errors

## 前回の警告内容を表示
show warnings

## コンソールの表示内容整形（改行入って見づらい時）
```
ログイン後、
pager less -S

（レコードごとに縦表示する方法）

select * from table_name\G
```