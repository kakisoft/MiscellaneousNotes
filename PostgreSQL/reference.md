## 公式サイト
https://www.postgresql.org/


```
=====< 型 >=====
【数値】
integer         (int)
real            小数
serial          連番

【文字】
char(5)         固定長
varchar(255)    上限付き可変長、
text            上限なし

【真偽値】
boolean

【日付】
date            日付
time            時間
timestamp       両方

＜その他は公式サイトにて＞
https://www.postgresql.org/docs/10/static/datatype.html
```

```
=====< 制約 >=====
not null
unique
default
primary key(not null, unique) ※１つのテーブルに１つのみ
check
```
