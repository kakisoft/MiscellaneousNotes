# Oracle：Trigger

構文
```sql
CREATE [ OR REPLACE ] TRIGGER トリガー名
  { BEFORE | AFTER | INSTEAD OF }
  { INSERT | UPDATE [OF 列名,...] | DELETE }
    [OR {INSERT | UPDATE [OF 列名,...] | DELETE }]
    [ REFERENCING OLD AS old_alias NEW AS new_alias PARENT AS parent_alias] 
      ON テーブル名
    [ FOR EACH ROW ]
    [ WHEN 条件式 ]
      BEGIN
        処理内容
      END
;

```

### OR REPLACE
同じ名前のトリガーがあった場合は上書きする。  
　  

### BEFORE | AFTER | INSTEAD OF
トリガーを起動させるタイミング。  
 * before：データが操作される前  
 * after：データが操作された後  
 * instead of：データが操作されるSQLが実行された時、そのSQLは実行せずにトリ
ガーだけを起動する   
　  

### INSERT | UPDATE | DELETE
トリガーの起動イベント。  
　  

### ON テーブル名
トリガーの起動対象テーブル。  
　  

### FOR EACH ROW
この宣言があると、行トリガー。（:old、:new を使い、操作されたレコードを指定
できる。）  
無い場合、文トリガー。（レコードを指定できない。）
　  

### REFERENCINGオプション
トリガーとの名前の競合の回避。
oldまたはnewと、名前がバッティングする時、エイリアスを付けて、重複を避ける事
ができる。

### [WHEN 条件式]
トリガーの起動条件。
一定の条件を満たした場合にのみトリガーを起動させることができる。
　  

### ＜バインド変数（ホスト変数）＞
トリガー内で更新前後の値を参照できる。
　  
:old.列名  
:new.列名
　  
値が参照できるのは行トリガーのみで文トリガーは参照できない。
また、起動イベントによりold/newに格納される値が異なる。

| 起動イベント |      old     |      new     |
|:------------:|:-------------|:-------------|
|    INSERT    |  NULL        |  更新後の値  |
|    UPDATE    |  更新前の値  |  更新後の値  |
|    DELETE    |  更新前の値  |  NULL        |


※値が参照できるのは行トリガーのみで文トリガーは参照できない。


### Tips

#### 起動イベントの分岐

起動イベントでINSERT OR UPDATE OR DELETEとした場合に、トリガー内で処理を分岐
するにはDMLの種類を評価します。
```sql
IF INSERTING THEN   -- INSERTの場合
  ...
ELSIF UPDATING THEN -- UPDATEの場合
  ...
ELSIF DELETING THEN -- DELETEの場合
  ...
END IF;
```


#### 注意点
・トリガー内の処理でCOMMITやROLLBACKは禁止  
トリガーは上位のトランザクションよる起動されるので、トリガー内でCOMMITを行う
と、上位のトランザクションでROLLBACKができなくなります。
　  
　  
・起動対象テーブルへのデータ更新
例えば、UPDATEイベントで起動されるトリガ内でデータ更新をすると、メモリがなく
なるまで再帰処理を続けます


#### 有効/無効の切り替え
無効
```
ALTER TRIGGER <トリガー名> DISABLE;
```
有効
```
ALTER TRIGGER <トリガー名> ENABLE;
```
状態確認
```sql
SELECT 
 trigger_name, status 
FROM
 user_triggers
```


### ＜参考サイト＞
[Oracle]データベーストリガーの作成方法   
http://skill-note.net/post-579/  
　  
ORACLE／TRIGGER編 - オラクルちょこっとリファレンス  
http://oracle-chokotto.com/ora_trigger.html  








