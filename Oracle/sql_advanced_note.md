## 大文字/小文字　半角/全角　ひらがな/カタカナ
```sql
select
    UPPER('a')             as  "小文字→大文字"  -- A
   ,LOWER('A')             as  "大文字→小文字"  -- a
   ,TO_MULTI_BYTE ('a')    as  "半角→全角"      -- ａ
   ,TO_SINGLE_BYTE ('Ａ')  as  "全角→半角"      -- A
   -----< 大文字/小文字　半角/全角　ひらがな/カタカナ >-----
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('あ')),'kana_fwkatakana') as s1 -- ア
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('ア')),'kana_fwkatakana') as s2 -- ア
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('ｱ')),'kana_fwkatakana')  as s3 -- ア
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('a')),'kana_fwkatakana')  as s4 -- Ａ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('A')),'kana_fwkatakana')  as s5 -- Ａ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('ａ')),'kana_fwkatakana') as s5 -- Ａ
   ,UTL_I18N.TRANSLITERATE(UPPER(TO_MULTI_BYTE('Ａ')),'kana_fwkatakana') as s4 -- Ａ
from
    dual
```

## with
```sql
WITH OPEN_TARGET_QUERY AS 
(
   select 'x' as X from dual
)
select X from OPEN_TARGET_QUERY;
```

## case
,case
   when  COLUMN1 = '1'  then  'data1'
   when  COLUMN1 = '2'  then  'data2'
   when  COLUMN1 = '3'  then  'data3'
   else ' '
 end  as  "STATUS"

## 重複列を抽出
select
    COLUMN1
from
    TABLE1
group by
    COLUMN2
having 
    COUNT(*) >= 2

## 特定列を集計
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



## 複数UPDATE
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



## インサート or アップデート
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

