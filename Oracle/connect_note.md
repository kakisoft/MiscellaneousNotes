## 接続情報

|  名前                          | 確認方法 (11g)                               | 使用例                                             |
|:-------------------------------|:--------------------------------------------|:---------------------------------------------------|
| システム識別子(SID)            | 環境変数のORACLE_SIDを確認                  | -                                                  |
| インスタンス名(INSTANCE_NAME)  | SQL> select instance_name from v$instance;  | -                                                  |
| データベース名(DB_NAME)        | show parameter db_name                      | -                                                  |
| サービス名                     | show parameter service_name                 | -                                                  |
| ドメイン名                     | show parameters db_domain                   | -                                                  |
| 接続識別子,TNS サービス名      | tnsnames.ora 内で定義                       | SQL> connect <ユーザ名>/<パスワード>@<接続識別子>  |

### 【 システム識別子(SID) 】           
ホスト内でインスタンスにアクセスするための識別子。  
**[初期値]**  
データベース作成時にデータベースと同じ名前が設定される。  
　  
### 【 インスタンス名(INSTANCE_NAME) 】
ホスト外よりネットワーク経由でインスタンスにアクセスするための名前。  
**[初期値]**  
データベース作成時にデータベースと同じ名前が設定される。  
　  
### 【 データベース名(DB_NAME) 】
データベースの名前。  
**[初期値]**  
データベース作成時に設定する。  
　  
### 【 サービス名 】       
主に一つのインスタンスを指す。  
外部から接続させる名前（インスタンス名とドメイン名を合わせた名前。  
**[初期値]**  
tnsnames.ora　の「SERVICE_NAME」で記載。
　  
### 【 ドメイン名 】                  
ネットワーク全体でサービス名を識別させるための名前。  
（サービス名がネットワーク内で重複しても識別できる）  
設定しなくても良い  
**[初期値]**  
データベース作成時のパラメータで指定。  
　  
### 【 接続識別子,TNS サービス名 】
クライアント側のtnsnames.oraで定義される。  
ホスト名(またはIPアドレス)、プロトコル、ポート、サービス名などで構成されている。  
SQLPLUS などで使用。  
**[初期値]**  
ー



　  
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
