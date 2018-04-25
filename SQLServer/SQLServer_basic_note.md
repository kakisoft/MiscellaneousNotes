## よく使う構文
```sql
select
 getdate() as "本日の日付"

,cast(12345 as varchar) as "文字列に変換"
,cast(getdate() as varchar) as "本日の日付"
,cast('2018/01/01' as datetime)  as "datetime"  --ミリ秒まで
,cast('2018/01/01' as datetime2) as "datetime2" -- マイクロ秒まで
,convert(datetime, left(convert(varchar, dateadd(month, 0, getdate()), 112), 6) + '01') as "月初1"
,dateadd( day,1-datepart(day, getdate()), getdate()) as "月初2"
,eomonth(getdate()) as "月末の日にち"
,datediff(month, cast('2018/01/01' as date), cast('2018/05/15' as date))  as  "月の差分"  --(結果：4)

,convert(varchar(5), 12345) as "convert1"
,convert(varchar, getdate(), 112) as "yyyymmdd"
,convert(varchar, getdate(), 11) as "yy/mm/dd"
,convert(varchar, getdate(), 111) as "yyyy/mm/dd"

,right('   ' + '1' , 4) as "先頭スペース埋め"
,left('12' + '   ' , 4) as "後方スペース埋め"

,format(1, '0000') as "先頭0埋め1"
,format(1, 'D4')   as "先頭0埋め2" -- 1と同じ

,cast('1' as varchar) + 1   as "結果：2"   -- 勝手に数値型に変換される
,cast('1' as varchar) + '1' as "結果：11"  -- 連結させたい場合、文字列である事を明示する

,convert(varchar(2),'あいうえお')  as  "byte単位で切り出し" --型変換を利用して、擬似的に実現する
,convert(varchar(10),reverse('あいうえお'))  as "末尾から切り出し"
,substring(cast('あいうえお' as text), 3, 4)  as "途中からバイト単位で切り出し" --(先頭は1)

,LEN('あいうえお') as "長さ" -- 5
,DATALENGTH('あいうえお') as "バイト長" --10
```


```
/*

varchar
　Unicodeでない可変長の文字列。
  (最大 8000byte)

nvarchar
　Unicode可変長文字列。
  (最大 8000byte)

decimal(p, s)
numeric(p, s)
  p：全体の桁数　s：小数点以下の桁数
  両方同じ。ただのエイリアス。

float [ (n) ] 
（n の既定値は 53 ）

|   値   |有効桁数|  サイズ  |
|:-------|:-------|:---------|
| 1-24   |  7 桁  | 4 バイト |
| 25-53  | 15 桁  | 8 バイト |

  1<=n<=24 の場合、n は 24 として扱われ、25<=n<=53 の場合、n は 53 として扱
われる。 

※有効桁数…小数部、整数部をひっくるめた桁数。


text
  Unicodeでない可変長の文字列。
  (最大 2G)

ntext
  Unicodeでない可変長の文字列。
  (最大 2G)

image
  バイナリ

bit
  1, 0, NULL のどれか

table
  SELECT文実行結果のテーブルを格納可能

XML
  XMLデータを格納可能

uniqueidentifier
  16バイトのGUID(グローバルユニークID)

https://kaya-soft.com/sqlserver2008-toranomaki/beginner/columntype/

*/
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SET @string1 = N'UniCodeの文字列'
SET @string2 = '非UniCodeの文字列'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## ＜with副問い合わせ＞
```sql

with alias1 as (
                  select
                   *
                  from
                   database.table1
               )
    ,alias2 as (
                  select
                   *
                  from
                   database.table2
               )
select
    *
from
    alias1
    left join alias2 on alias1.code_a = alias2.code_a
where  1=1
```

## ＜結合前にテーブルのレコードを絞る＞
```sql
from
   table1   
   left join table2 on table1.code_A  = table2.code_A
                   and table1.code_B  = table2.code_B
                   and table2.colomn1 = '0000'
                   and table2.colomn2 = 0

-- Oracleの
--    table2.colomn1(+) = '0000'
-- に相当。
```


