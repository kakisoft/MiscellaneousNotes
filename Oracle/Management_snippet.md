## ロック
V$LOCK
のtypeは、
V$LOCK_TYPE
に詳細が書いてある。

## 設定ファイルのパス
sqlnet.ora
tnsnames.ora
``` 
$ORACLE_HOME/network/admin/ 
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE" /s
```

## 接続確認
nsping <net_service_name> [ try_count ]

## DBA権限の確認
```sql
select * from DBA_ROLE_PRIVS order by GRANTEE
```

## DBFの保存先確認
```sql
select TABLESPACE_NAME, FILE_NAME from DBA_DATA_FILES
```

## リスナー起動チェック
```
lsnrctl services
```
実行結果例
```
(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=hostname)(PORT=1521)))に接続中
サービスのサマリー...
サービス"servicename"には、1件のインスタンスがあります。
  インスタンス"wmsdb"、状態READYには、このサービスに対する1件のハンドラがあります...
    ハンドラ:
      "DEDICATED" 確立:337 拒否:0 状態:ready
         LOCAL SERVER
```

対象のservicenameが存在していなかった場合、リスナーを再起動させる。

```
lsnrctl stop <リスナー名>
lsnrctl start <リスナー名>
```

