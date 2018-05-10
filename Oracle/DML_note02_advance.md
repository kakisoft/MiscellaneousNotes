## まとめて insert

カラム指定
```sql
insert all
into TABLE1 (ID, COLUMN1, COLUMN2) values (101, 1101, '22201')
into TABLE1 (ID, COLUMN1, COLUMN2) values (102, 1102, '22202')
into TABLE1 (ID, COLUMN1, COLUMN2) values (103, 1103, '22203')
select * from dual; --(select insert の体に見せかけるため、select句は必須)
--commit;
```

カラム省略
```sql
insert all
into TABLE1 values (201, 2201, '33301', null, null, null)
into TABLE1 values (202, 2202, '33302', null, null, null)
into TABLE1 values (203, 2203, '33303', null, null, null)
select * from dual;
```


## 大文字/小文字　半角/全角　ひらがな/カタカナ
```sql
select
    UPPER('a')             as  "小文字→大文字"  -- A
   ,LOWER('A')             as  "大文字→小文字"  -- a
   ,TO_MULTI_BYTE ('a')    as  "半角→全角"      -- ａ
   ,TO_SINGLE_BYTE ('Ａ')  as  "全角→半角"      -- A
   -- CHAR
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('a')) ,'kana_fwkatakana') as S1 -- 半角:a
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('A')) ,'kana_fwkatakana') as S2 -- 半角:A
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('ａ')),'kana_fwkatakana') as S3 -- 全角:ａ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('Ａ')),'kana_fwkatakana') as S4 -- 全角:Ａ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('あ')),'kana_fwkatakana') as S5 -- 全角:あ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('ア')),'kana_fwkatakana') as S6 -- 全角:ア
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('ｱ')) ,'kana_fwkatakana') as S7 -- 半角:ｱ
   -- NVARCHAR2
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE(to_char(substr(COL1,1,1)))),'kana_fwkatakana') as V1 -- 半角:b
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE(to_char(substr(COL2,1,1)))),'kana_fwkatakana') as V2 -- 半角:B
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE(to_char(substr(COL3,1,1)))),'kana_fwkatakana') as V3 -- 全角:ｂ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE(to_char(substr(COL4,1,1)))),'kana_fwkatakana') as V4 -- 全角:Ｂ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE(to_char(substr(COL5,1,1)))),'kana_fwkatakana') as V5 -- 全角:い
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE(to_char(substr(COL6,1,1)))),'kana_fwkatakana') as V6 -- 全角:イ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE(to_char(substr(COL7,1,1)))),'kana_fwkatakana') as V7 -- 半角:ｲ
from
    (
       select
            CAST('b: 半角'  as NVARCHAR2(100)) as COL1
           ,CAST('B: 半角'  as NVARCHAR2(100)) as COL2
           ,CAST('ｂ: 全角' as NVARCHAR2(100)) as COL3
           ,CAST('Ｂ: 全角' as NVARCHAR2(100)) as COL4
           ,CAST('い: 全角' as NVARCHAR2(100)) as COL5
           ,CAST('イ: 全角' as NVARCHAR2(100)) as COL6
           ,CAST('ｲ: 全角'  as NVARCHAR2(100)) as COL7
       from
           dual
    ) TMP_VIEW01

from
    dual
```
**＜出力結果＞**    

| S1 | S2 | S3 | S4 | S5 | S6 | S7 | V1 | V2 | V3 | V4 | V5 | V6 | V7 |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| Ａ | Ａ | Ａ | Ａ | ア | ア | ア | Ｂ | Ｂ | Ｂ | Ｂ | イ | イ | イ |


|    変換名文字列           |      説明                                      |
|:--------------------------|:-----------------------------------------------|
|  'kana_fwkatakana'        |  すべてのタイプの仮名文字を全角カタカナに変換  |
|  'kana_hwkatakana'        |  すべてのタイプの仮名文字を半角カタカナに変換  |
|  'kana_hiragana'          |  すべてのタイプの仮名文字を全角ひらがなに変換  |
|  'fwkatakana_hwkatakana'  |  全角カタカナのみを半角カタカナに変換          |
|  'fwkatakana_hiragana'    |  全角カタカナのみを全角ひらがなに変換          |
|  'hwkatakana_fwkatakana'  |  半角カタカナのみを全角カタカナに変換          |
|  'hwkatakana_hiragana'    |  半角カタカナのみを全角ひらがなに変換          |
|  'hiragana_fwkatakana'    |  全角ひらがなのみを全角カタカナに変換          |
|  'hiragana_hwkatakana'    |  全角ひらがなのみを半角カタカナに変換          |


### 参考サイト
http://otndnld.oracle.co.jp/document/products/oracle10g/102/doc_cd/appdev.102/B19245-02/u_i18n.htm#CACIJHFB    
http://505056310.blogspot.jp/2015/12/oracle.html

## with
```sql
WITH OPEN_TARGET_QUERY AS 
(
   select 'x' as X from dual
)
select X from OPEN_TARGET_QUERY;
```

## case
```sql
,case
   when  COLUMN1 = '1'  then  'data1'
   when  COLUMN1 = '2'  then  'data2'
   when  COLUMN1 = '3'  then  'data3'
   else ' '
 end  as  "STATUS"
```

## 重複列を抽出
```sql
select
    COLUMN1
from
    TABLE1
group by
    COLUMN2
having 
    COUNT(*) >= 2
```

## 特定列を集計
```sql
select               
    TABLE1.PROD_NO         
   ,sum(decode(TABLE2.CATEGORY,'1',TABLE1.SALES                 ,0              ))  as  SALES
   ,sum(decode(TABLE2.CATEGORY,'2',round(TABLE1.PAYMENT / 1.08 ), TABLE1.PAYMENT))  as  PAYMENT
from                 
    TABLE1             
    left join TABLE2 on TABLE1.CATEGORY_CD = TABLE2.CATEGORY_CD
where  1=1
  and  TABLE1.COLUMN1 = 'CD'
group by
    TABLE1.PROD_NO
```


## 複数UPDATE
```sql
update  TABLE1
   set  COLUMN1 = (select COLUMN1 from TABLE2 where  1=1 
                                                and  TABLE1.ID = TABLE2.ID
               )
where  1=1
  and  TABLE1.COLUMN2 in ('01','02')
  and  TABLE1.ID in (
                       select
                           TABLE1.ID
                       from
                           TABLE1
                           left join TABLE2 on TABLE1.ID = TABLE2.ID
                       where  1=1
                         and  TABLE1.COLUMN2 in ('01','02')
                         and  TABLE2.COLUMN3 is not null
                    )
```


## インサート or アップデート
```sql
merge into TABLE1
using
(
   select
        'Param1'        as  COLUMN1
       ,'Param2'        as  COLUMN2
       ,'UpdateParam1'  as  UPDATE_COLUMN1
       ,'UpdateParam2'  as  UPDATE_COLUMN2
   from
       dual
) DUMMY on (
                   1=1
              and  TABLE1.COLUMN1 = DUMMY.COLUMN1
              and  TABLE1.COLUMN2 = DUMMY.COLUMN2
           )
-- 既存レコードの更新
when MATCHED then
  update set
      UPDATE_COLUMN1 = DUMMY.UPDATE_COLUMN1
     ,UPDATE_COLUMN2 = UPDATE_COLUMN2 + DUMMY.UPDATE_COLUMN2
-- 新規レコードの作成
when not MATCHED then
  insert
  (
      ID
     ,COLUMN1
     ,COLUMN2
     ,UPDATE_COLUMN1
     ,UPDATE_COLUMN2
  )
  values
  (
      TABLE1SEQ.NEXTVAL
     ,DUMMY.COLUMN1
     ,DUMMY.COLUMN2
     ,DUMMY.UPDATE_COLUMN1
     ,DUMMY.UPDATE_COLUMN2
   )
```

## case の null判定
```sql
select
  -- nvarchar2 は、caseでの空文字比較がちゃんとできない？
  case n''
    when n'' then n'1'  
    else n'2'  
  end as x1


  -- ・・・と思ったら、nullがイケてなかった。
 ,case null
    when null then n'1'  
    else n'2'  
  end as x2

  -- こんな感じで。
  ,case
     when '' is null then n'1'
     else n'2'  
   end x3

  -- 通常の文字は当然OK
 ,case '1'
    when '1' then n'1'  
    else n'2'  
  end as x4

from
 dual
```
実行結果

| X1 | X2 | X3 | X4 |
|:--:|:--:|:--:|:--:|
| 2  | 2  | 1  |  1 |


