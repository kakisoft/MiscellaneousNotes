## dumpファイル作成
mysqldump -u root -p DATABASE_NAME < dump_file.sql 

## dumpファイルから復元
mysql -u root -p DATABASE_NAME < dump_file.sql 

## dumpファイルから復元（文字コードを指定）
mysql -u root -p database_name --default-character-set=utf8 < dump_file.sql 
　  
※上記では utf8を指定。インポート時に「Unknown command '\".」と出ていたら、これで回避できた。


