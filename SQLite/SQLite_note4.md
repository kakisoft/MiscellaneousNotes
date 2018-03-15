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
