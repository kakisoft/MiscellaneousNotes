## 公式サイト
https://www.mysql.com/jp/


## データ型
```
=====< データ型 >=====
【数値(number)】
int             整数
float           浮動小数
double          floatよりも精度が高い
int unsigned    正の値しかとらない場合、こう書ける。（使用できる桁数が多くなる）

【文字(string)】
char(4)         固定長
varchar(255)    可変長
text            可変長

【日付(date/time)】
date        日付
time        時間
datetime    両方    '2018-04-01 17:30:25'

【真偽値(true/false)】
boolean    ※tinyint(1)の別名。（１桁しか扱わないint）
               true :1
               false:0

※MySQLでは、0とnullがfalse。
　それ以外は true。（空文字は true）
```
