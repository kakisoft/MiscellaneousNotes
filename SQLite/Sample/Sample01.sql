CREATE TABLE artists(
   id          INTEGER PRIMARY key
  ,name        TEXT
  ,created_at  TIMESTAMP DEFAULT (DATETIME('now','localtime'))
  ,updated_at  TIMESTAMP DEFAULT (DATETIME('now','localtime'))
);



CREATE TABLE albums(
   id            INTEGER PRIMARY key
  ,release_name  TEXT
  ,year          INTEGER
  ,created_at    TIMESTAMP DEFAULT (DATETIME('now','localtime'))
  ,updated_at    TIMESTAMP DEFAULT (DATETIME('now','localtime'))
  ,artist_id     INTEGER
);



CREATE TABLE IF NOT EXISTS songs (
   id            INTEGER PRIMARY key
  ,title         TEXT
  ,length        REAL
  ,created_at    TIMESTAMP DEFAULT (DATETIME('now','localtime'))
  ,updated_at    TIMESTAMP DEFAULT (DATETIME('now','localtime'))
  ,artist_id     INTEGER
  ,album_id      INTEGER
);
