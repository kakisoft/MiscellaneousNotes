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


ora	<< 前へ | 次へ >>
Oracle：<ORA-12514> ある日、突然リスナー異常が発生して繋がらなくなった。

正常稼働していたが、ある日突然繋がらなくなった。


### クライアントから接続した時のエラー内容
```
ORA-12514: TNS:listener does not currently know of service requested in connect descriptor
```

### サーバから接続した時のエラー内容
```
ORA-01034: ORACLE not available
ORA-27101: shared memory realm does not exist
```

あれ？エラーの内容が違う。
よく調べてたら、DBFを保存しているドライブがパンパンになっていて、SGA（共有メモリ）へ正常にアクセスできなかったのが原因だったみたい。

ディスク容量を空けた後、マシン再起動で解決した。


### 参考情報
DBFの保存先は、以下のコマンドで確認できる。
```
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

