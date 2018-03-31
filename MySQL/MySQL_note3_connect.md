## ログイン
```
mysql -u ユーザ名 -p [データベース名]
mysql -u root -p rootpassword

（ユーザ名：dbuser01、DB：mydb01　で接続）
mysql -u dbuser01 -p mydb01

（リモート）
mysql -h hostname -u remoteusername -p
※hostnameは、IPでも可。
```
## データベース選択
use データベース名

## 終了
quit