PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "table01" ( id, column01, column02 );
INSERT INTO table01 VALUES(NULL,'value01','value02');
INSERT INTO table01 VALUES(NULL,'value01','value02');
INSERT INTO table01 VALUES(NULL,'value01','contain'' commna');
INSERT INTO table01 VALUES(NULL,'value01',replace('改行\n                                                                          する','\n',char(10)));
INSERT INTO table01 VALUES(NULL,'value01','value12');
INSERT INTO table01 VALUES(NULL,'value02','value12');
INSERT INTO table01 VALUES(NULL,'value03','contain'' commna');
INSERT INTO table01 VALUES(NULL,'value04',replace('改行\n                                                                          する','\n',char(10)));
CREATE TABLE product(id integer, name text default 'no name', 
  price integer default 0);
INSERT INTO product VALUES(3,'no name',5000);
CREATE TABLE users (
                      id     integer primary key
                     ,name   text    not null
                     ,score  integer default 10 check (score >=0)
                     ,memo   text    default 'user profile'
                     ,email  text    unique
                   );
INSERT INTO users VALUES(1,'kaki%',40,'user profile','aaa@bbcbs');
INSERT INTO users VALUES(2,'ishida',80,'user profile',NULL);
INSERT INTO users VALUES(3,'yamada',90,'user profile',NULL);
INSERT INTO users VALUES(4,'koga',100,'user profile',NULL);
INSERT INTO users VALUES(5,'tagawa',110,'user profile',NULL);
INSERT INTO users VALUES(6,'ogawa',120,'user profile',NULL);
CREATE TABLE messages (message);
INSERT INTO messages VALUES('name:tagawa 80->110');
INSERT INTO messages VALUES('name:ogawa 90->120');
CREATE TABLE posts (
   id     integer primary key
  ,title  text
  ,body   text
);
INSERT INTO posts VALUES(1,'t1','b1');
INSERT INTO posts VALUES(2,'t2','b2');
CREATE TABLE comments (
   id       integer primary key
  ,post_id  integer
  ,comment  text
);
INSERT INTO comments VALUES(1,1,'c1');
INSERT INTO comments VALUES(2,1,'c2');
CREATE TABLE table02 ( 
                        id           integer primary key  autoincrement
                       ,column_int   integer
                       ,column_text  text 
                       ,column_real  real 
                       ,column_blb   blb 
                       ,column_null 
                     );
INSERT INTO table02 VALUES(3,111,NULL,NULL,NULL,NULL);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('table02',3);
CREATE TRIGGER new_winner update of score on users when new.score > 100
begin
  insert into messages (message) values (
    'name:' || new.name ||
    ' ' || old.score ||
    '->'  || new.score
  );
end;
CREATE INDEX score_index on users(score);
COMMIT;
