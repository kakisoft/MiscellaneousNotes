## insert
```sql
create table users (
    id    serial primary key
   ,name  varchar(255)
   ,score real
   ,team  varchar(255)
);
insert into users (name, score, team) values
  ('kaki'    , 5.5, 'red'  )
 ,('ogawa'   , 8.3, 'blue' )
 ,('sato'    , 2.2, 'blue' )
 ,('yamato'  , 5.0, 'green')
 ,('fukuyama', 4.6, 'green')
 ,('ono'     , 4.7, 'red'  )
 ,('igawa'   , 5.5, 'green')
 ;

create table posts (
    id      serial       primary key
   ,user_id int not      null
   ,title   varchar(255) not null
   ,body    text         not null
);
insert into posts (user_id, title, body) values
  (1, 'title1-1', 'body1-1')
 ,(1, 'title1-2', 'body1-2')
 ,(2, 'title2',   'body2'  )
 ,(4, 'title4',   'body4'  )
 ,(5, 'title5',   'body5'  )
 ;
```

```sql
select
    users.name
   ,users.score
   ,posts.title
from
    users
    left join posts on users.id = posts.user_id
where  true
  and  users.score > 4
;
```

