MySQLのクエリでは、大文字・小文字が区別されない。      
（like検索とかでも）
___________________________
※注意点
```
-- コメントの後ろには、半角スペースが必要。付けない場合、「--」の演算子として評価される。（+の計算）

# これもコメント
```
___________________________
## ヘルプ
help;

## 開始
sudo service mysql start

## 停止
sudo service mysql stop

## 再起動
sudo service mysql restart

## サービスの状態確認
```
sudo service mysql status

RedHat系だと「mysqld」？
```

## 現在のユーザを表示
select user();

## ユーザ作成
```
create user dbuser01@localhost identified by 'password';
create user remoteuser identified by 'password';
```

## ユーザ一覧確認
select Host, User, Password from mysql.user;

## ユーザ削除
drop user dbuser01@localhost;

## 権限付与
grant all on mydb01.* to dbuser01@localhost;
___________________________________________________

## rootパスワード変更
/installdir/mysql/bin/mysqladmin -p -u root password NEW_PASSWORD 

```
（インストールディレクトリ検索）
sudo find / -name "mysqladmin"
多分、
/usr/bin/mysqladmin
/usr/share/bash-completion/completions/mysqladmin


/installdir/mysql/bin/mysqladmin -p -u root password NEW_PASSWORD 

/usr/bin/mysqladmin -p -u root password rootpassword 


sudo find / -name "mysqld.log"
```
https://qiita.com/okuzawats/items/d3cd9f8aca7262715629
