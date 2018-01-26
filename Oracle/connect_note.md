## 接続情報

|  名前                          | 確認方法 (11g R2 Windowsの場合)             | 使用例                                             |
|:-------------------------------|:--------------------------------------------|:---------------------------------------------------|
| システム識別子(SID)            | 環境変数のORACLE_SIDを確認                  | -                                                  |
| インスタンス名(INSTANCE_NAME)  | SQL> select instance_name from v$instance;  | -                                                  |
| データベース名(DB_NAME)        | show parameter db_name                      | -                                                  |
| サービス名                     | show parameter service_name                 | -                                                  |
| ドメイン名                     | show parameters db_domain                   | -                                                  |
| 接続識別子,TNS サービス名      | tnsnames.ora 内で定義                       | SQL> connect <ユーザ名>/<パスワード>@<接続識別子>  |




## ホスト側での確認
```
lsnrctl services
```


## sqlplusで接続情報などを確認する
```
def
```


## SQL Developerからの接続
ホスト名：インストール時は「localhost」となっている。DBサーバを指定する。  
```
　　ポート：デフォルト 1521  
　　SID：tnsnames.ora を確認。  
```

### ＜参考サイト＞
http://tooljp.com/database/Oracle/Oracle-SID-INSTANCE/Oracle-SID-INSTANCE.html  
https://www.shift-the-oracle.com/config/oracle_sid-db_name-global_name.html  
