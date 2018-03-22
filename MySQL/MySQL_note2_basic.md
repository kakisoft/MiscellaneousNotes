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

## ヘルプ
help;



___________________________________________________

## rootパスワード変更
/installdir/mysql/bin/mysqladmin -p -u root password NEW_PASSWORD 


（インストールディレクトリ検索）
sudo find / -name "mysqladmin"
多分、
/usr/bin/mysqladmin
/usr/share/bash-completion/completions/mysqladmin


/installdir/mysql/bin/mysqladmin -p -u root password NEW_PASSWORD 

/usr/bin/mysqladmin -p -u root password rootpassword 


sudo find / -name "mysqld.log"


https://qiita.com/okuzawats/items/d3cd9f8aca7262715629