### インストール（Windows）
```
sudo apt-get update
sudo apt-get install -y postgresql
```
### バージョン確認
psql --version

## 一覧確認
```
psql -l
\l
```

## DB作成
createdb blogapp01

## DB削除
dropdb blogapp01

## 接続
psql blogapp01

## 終了
\q

## ヘルプ表示
```
help
\?
```

## とりあえずの動作確認にでも
select now();





## 参考サイト
https://qiita.com/kaitoii11/items/7acd24cce5315792931f    
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04    
http://ts0818.hatenablog.com/entry/2017/02/11/210104    
