## insert
```
insert into users (id, name, score) values (1, 'kaki'  , 5.8 );


insert into users (id, name, score, rank) values 
    (2, 'ogawa' , 8.2, 'gold'  )
   ,(3, 'yamato', 6.1, 'silver')
   ,(4, 'fukui' , 1.0,  3 )
;
```
enumへの insertは数値でも可。（1～　開始する）

## like
```
select * from users where name like 'K%'
小文字の「k」も検索対象となる。

区別する場合は、binary句を使用する。
select * from users where name like binary 'K%';
```

## limit
```
select * from users limit 3;

（最初の３件を除外して、次の３件を表示）
select * from users limit 3 offset 3;

（上位３件）
select * from users order by score desc limit 3;
```

## 組み込み関数
```
select
 round(5.355)    -- 5
,round(5.355, 1) -- 5.4
,floor(5.833)    -- 5（切り捨て）
,ceil(5.238)     -- 6（切り上げ）
,rand();         -- 0以上1未満のランダムな値
```

## ランダムな値を抽出
```
select * from users order by rand() limit 1;
```

## 文字列の演算
select
 length('Hello')         -- 5
,substr('Hello', 2)      -- ello
,substr('Hello', 2, 3)   -- ell
,upper('Hello')          -- HELLO
,lower('Hello')          -- hello
,concat('Hello','World') -- HelloWorld
;