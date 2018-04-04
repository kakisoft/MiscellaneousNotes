## データベース作成
create database DATABASE_NAME;

## データベース削除
drop database DATABASE_NAME;

## 現在選択中のデータベースを表示
select database();

## テーブル一覧表示
```
show tables from データベース名
（「from データベース名」はデータベース選択後なら省略可）
```

## テーブル作成
```
drop table if exists users;
create table users (
  id int unsigned
 ,name  varchar(20)
 ,score float
);
```

```
drop table if exists users;
create table users (
  id     int unsigned  primary key auto_increment
 ,name   varchar(20)   unique
 ,score  float         default 0.0  not null
);
```

## テーブル削除
drop table テーブル名;

## スキーマ確認
desc テーブル名;