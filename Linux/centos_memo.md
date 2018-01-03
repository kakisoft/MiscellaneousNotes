【CentOS release 6.6 (Final)】
## webサーバ系ツールのインストール
sudo yum -y install httpd

## webサーバ起動
sudo service httpd start

## 起動時にwebサーバが自動で立ち上がる設定
sudo chkconfig httpd on

##　ファイアウォール停止
sudo service iptables stop

###
webページは、以下のディレクトリに作成する
```
/var/www/html/
```

