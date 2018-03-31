## 自分の環境設定用
```
vagrant init ubuntu/xenial64
vagrant up
```
##### boxイメージの拝借元
https://app.vagrantup.com/ubuntu/boxes/xenial64


〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
```
create user remoteuser identified by 'password';
※パスワードは'(シングルクォーテーション)で囲む必要があります。

##
ユーザに、外部から接続できる権限を付与する。
grant all privileges on *.* to remoteuser@"%" identified by 'password';
※privileges on databasename.tablename とデータベース・テーブル単位でのアクセス制限可。 また、@以降は「172.16.24.%」と、IPを指定する事ができる。



grant all privileges on *.* to remoteuser@"%" identified by 'password';
※privileges on databasename.tablename とデータベース・テーブル単位でのアクセス制限可。 また、@以降は「172.16.24.%」と、IPを指定する事ができる。


設定内容を反映させる。
flush privileges;


追加・編集したユーザの内容は、以下のコマンドで確認。
select user, host, password from mysql.user;



繋がらない場合、接続できるホストが制限されていないかを確認する。
my.cnf（Windowsの場合、my.ini）にて、以下の記述があるか確認。
bind-address = 127.0.0.1
先頭に「#」を付けてコメントアウトにするか、接続する端末のIPを追記する。
my.cnf は、環境により /etc にあったり /etc/mysql/ にあったりする事もあるので、「sudo find / -name "my.cnf"」などで検索を。 


それでも繋がらない場合、ポートが待ち受けとなっているか確認する。（デフォルトは3306）確認コマンドは以下。
netstat -antu



## AWS：Redmine での MySQL Workbench起動
http://kakistamp.hatenadiary.jp/entry/2016/11/08/040357
```

〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
```
create database mydb01;
create database mydb02;
create database mydb03;

create user dbuser01 identified by 'password';

create user dbuser01@localhost identified by 'password';


〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
```
