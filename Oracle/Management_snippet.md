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
```
tnsping <net_service_name> [ try_count ]
```

## ホスト名やインスタンス名を確認
```sql
select * from v$instance
```

## 接続ユーザ確認
```sql
select * from v$session
```

## リサイクルビン削除
```
purge recyclebin
```

## 複数のバージョンが共存する場合
Oracle Universal Installer
にて、どちらを優先して使うか選択可能。（どちらかを無効する事も出来る。）
コンパクトインストール時にはInstallerが入らないので、その場合はインストーラを起動。


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

## DB名とスキーマ名を取得
```sql
select
     SYS_CONTEXT('USERENV', 'DB_NAME') as DB_NAME      -- DB名
    ,USER                              as SCHEMA_NAME  -- スキーマ名
from
    dual
```

## DBの文字コードをチェック
```sql
select 
 *
from 
 NLS_DATABASE_PARAMETERS
where  1=1
  and  PARAMETER in ('NLS_CHARACTERSET','NLS_NCHAR_CHARACTERSET')
```

## テーブル一覧をコメント付きで出力
```sql
select
    USER_TABLES.TABLE_NAME
   ,USER_TAB_COMMENTS.COMMENTS
from
    USER_TABLES
    left join USER_TAB_COMMENTS on USER_TABLES.TABLE_NAME = USER_TAB_COMMENTS.TABLE_NAME
where  1=1
order by 1
```

## カラム一覧をコメント付きで出力
```sql
select
    USER_TAB_COLUMNS.COLUMN_ID
   ,USER_TAB_COLUMNS.TABLE_NAME
   ,USER_TAB_COMMENTS.COMMENTS
   ,USER_TAB_COLUMNS.COLUMN_NAME
   ,USER_COL_COMMENTS.COMMENTS
from
    USER_TAB_COLUMNS
    left join USER_TAB_COMMENTS on USER_TAB_COLUMNS.TABLE_NAME = USER_TAB_COMMENTS.TABLE_NAME
    left join USER_COL_COMMENTS on USER_TAB_COLUMNS.TABLE_NAME  = USER_COL_COMMENTS.TABLE_NAME
                               and USER_TAB_COLUMNS.COLUMN_NAME = USER_COL_COMMENTS.COLUMN_NAME
where  1=1
  and  USER_TAB_COLUMNS.TABLE_NAME in ('table_name') --テーブル名を指定
--  and  lower(USER_TAB_COLUMNS.COLUMN_NAME) like '%column_name%' --カラム検索内容
order by
    USER_TAB_COLUMNS.TABLE_NAME
   ,USER_TAB_COLUMNS.COLUMN_ID
```

## カラムの定義内容を参照
```
select
    TABLE_NAME
   ,COLUMN_ID
   ,COLUMN_NAME
   ,DATA_TYPE
   ,DATA_LENGTH
   ,NULLABLE
from
    USER_TAB_COLUMNS
where  1=1
  and  TABLE_NAME = 'TABLE1'
order by
    TABLE_NAME
   ,COLUMN_ID
```
