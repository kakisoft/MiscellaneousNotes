## ubuntuでアクセスできない
```
＜ubuntu＞
psql: FATAL:  role "root" does not exist
```
インストールをすると、postgresというユーザ名とロールが作成される。    
初期はこのユーザのみが編集できる。    
 * postgresユーザを使う
 * ポスグレを編集できるようにロールを編集する 
どっちかで対処。 

ー１ー　postgresユーザを使う場合
```
sudo passwd postgres
（パスワードを入力）
su - postgres
```
