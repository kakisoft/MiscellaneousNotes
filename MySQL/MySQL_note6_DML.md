## insert
```
insert into users (id, name, score) values (1, 'kaki'  , 5.8 );


insert into users (id, name, score) values 
    (2, 'ogawa' , 8.2 )
   ,(3, 'yamato', 6.1 )
   ,(4, 'fukui' , null)
;
```

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

