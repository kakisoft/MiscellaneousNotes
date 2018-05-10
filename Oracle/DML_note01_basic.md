## メモ
with句も、「副問い合わせ」と呼称する、みたい。

## 型
```
NUMBER        38桁の浮動小数点型
NUMBER(n)     n桁の整数型。nは 1～38
NUMBER(n ,m)  n桁の小数型。mは小数部の桁数。nは 1～38、mは-84～127。
              『NUMBER(7,2) 』の場合、整数部 5桁、小数部 2桁。
```

## フォーマット
```sql
select
    TO_CHAR(1, '0000') --先頭0埋め
   ,TO_CHAR(2, '9999') --満たない場合は表示しない
   ,TO_CHAR(3, 'S999,999')  --符号を付ける
   ,TO_CHAR(-4, 'S999,999') --符号を付ける
   ,TO_CHAR(1234567, '000,000,000') --カンマ区切り
   ,TO_CHAR(1234567, '999,999,999') --カンマ区切り
from
   dual
```

## 日付
```sql
select
    SYSDATE       
   ,SYSTIMESTAMP  
   ,to_char(sysdate,'yyyy/mm/dd hh24:mi:ss')           
   ,to_char(systimestamp,'yyyy/mm/dd hh24:mi:ss.ff3')  
from
    dual
```

## 月の計算
```sql
select 
    trunc(sysdate, 'MM') as "今月1日" 
   ,last_day(sysdate)    as "最終日"
   ,months_between(to_date('2018/05/01'), to_date('2018/01/01')) as "間の月数"  --(結果：4)
   ,months_between(to_date('2018/05/01'), to_date('2018/01/15')) as "間の月数2" --(結果：3.5483871)
   ,trunc(months_between(to_date('2018/05/01'), to_date('2018/01/01')))  as "間の月数3"  --(結果：4)
   ,ceil(months_between(to_date('2018/05/01'), to_date('2018/01/01')))  as "xxx"
from 
    dual
```

## 特殊文字
|    文字       |   ASCII Code Style    |  備考  |
|:-------------:|:---------------------:|:------:|
|  タブ         |  CHR(9)               |  \\t   |
|  CR           |  CHR(13)              |  \\r   |
|  LF           |  CHR(10)              |  \\n   |
|  スペース     |  CHR(32)              |        |
|  引用符(')    |  CHR(39)              |        |
|  改行(Win)    |  CHR(13) \|\| CHR(10) |        |
|  改行(Linux)  |  CHR(10)              |        |


## like検索：任意の文字を指定
変数を指定可
```sql
select
*
from
 TABLE1
where  1=1
  and  COLUMN2 like '%' || '検索文字' || '%'
```

