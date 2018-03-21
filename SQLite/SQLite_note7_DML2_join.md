## create table：posts
```sql
drop table if exists posts;
create table posts (
   id     integer primary key
  ,title  text
  ,body   text
);
```
## create table：comments
```sql
drop table if exists comments;
create table comments (
   id       integer primary key
  ,post_id  integer
  ,comment  text
);
```

```sql
insert into posts (id, title, body) values (1, 't1', 'b1');
insert into posts (id, title, body) values (2, 't2', 'b2');
insert into comments (id, post_id, comment) values (1, 1, 'c1');
insert into comments (id, post_id, comment) values (2, 1, 'c2');
```


## 内部結合
```sql
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
```sql
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
```sql
select
    posts.id
   ,posts.title
   ,comments.comment
from
    posts
    cross join comments
;
```