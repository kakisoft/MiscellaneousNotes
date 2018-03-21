## 接続
(su - postgres)
psql blogapp01

## 終了
\q

### バージョン確認
psql --version

## 一覧確認
```
psql -l
\l
```

## とりあえずの動作確認にでも
select now();
