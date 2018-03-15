PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
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
