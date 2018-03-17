## insert
```
insert into table01 ( column01, column02 ) values ('value01', 'value12');
insert into table01 ( id, column01, column02 ) values ( null, 'value02', 'value12');
insert into table01 ( id, column01, column02 ) values ( null, 'value03', 'contain'' commna');
insert into table01 ( id, column01, column02 ) values ( null, 'value04', '改行
                                                                          する');
```

## like
```
_  任意の位置文字
%  0字以上の文字
大文字と小文字を区別しない。
```
```
エスケープ文字を指定して検索ができる。
select * from users where name like '%@%' escape '@';
```

## limit
```
（上位３件を表示）
select * from users order by score desc limit 3;

（上位２件を飛ばして、上から３件を表示。）
select * from users order by score desc limit 3 offset 2;
select * from users order by score desc limit 2, 3;
```

## 組み込み関数
集計
```
select
    count(id)
   ,max(score)
   ,min(score)
   ,avg(score)
from
    users;
``` 
文字列操作
```
select
    name
   ,length(name)
   ,upper(name)
   ,substr(name, 2, 3)
from
    users;
```

## 直近で挿入されたレコードのrowid
```
select last_insert_rowid();
```

## ランダムに１つ抽出
```
select * from users order by random() limit 1;
```

## case
```
select
    id
   ,score
   ,case
      when score > 70 then 'A'
      when score > 50 then 'B'
      else 'C'
    end as rank
from
    users
;
```

## transaction
```
begin transaction;
update users set score = score + 10 where score > 10;
delete from users where score >= 100;
commit;
```

## rollback
```
begin transaction;
update users set score = 0;
rollback;
```

## 日付
```
select
 datetime('now')              as "タイムゾーンを考慮しない"
,datetime('now', '+09:00:00') as "日本時間"
,date()
,time()
,date('2015-07-17', '+3 months', 'start of month', '-1 day') --２か月後の末日
;
```




## posts
```
drop table if exists posts;
create table posts (
   id     integer primary key
  ,title  text
  ,body   text
);
```
## comments
```
drop table if exists comments;
create table comments (
   id       integer primary key
  ,post_id  integer
  ,comment  text
);
```

```
insert into posts (id, title, body) values (1, 't1', 'b1');
insert into posts (id, title, body) values (2, 't2', 'b2');
insert into comments (id, post_id, comment) values (1, 1, 'c1');
insert into comments (id, post_id, comment) values (2, 1, 'c2');
```


## 内部結合
```
select
    posts.id
   ,posts.title
   ,comments.comment
from
    posts
    inner join comments on posts.id = comments.post_id
;
```

## 外部結合
```
select
    posts.id
   ,posts.title
   ,comments.comment
from
    posts
    left join comments on posts.id = comments.post_id
;
```

## 交差結合
```
select
    posts.id
   ,posts.title
   ,comments.comment
from
    posts
    cross join comments
;
```