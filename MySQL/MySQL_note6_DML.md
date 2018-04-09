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
