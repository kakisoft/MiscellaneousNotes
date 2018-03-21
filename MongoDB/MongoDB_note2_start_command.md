## 起動
sudo service mongod start

## 接続確認
```
tail /var/log/mongodb/mongod.log

（以下の記述があるか確認）
[initandlisten] waiting for connections on port 27017
```

## 停止
sudo service mongod stop

## 再起動
sudo service mongod restart


## マシン起動時に自動的にstart
```
sudo sysv-rc-conf mongod on
```
無ければ先にインストール。    
sudo apt-get install sysv-rc-conf


## バージョン確認
mongo --version



