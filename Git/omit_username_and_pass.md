## githubでユーザー名とパスワードを毎回聞かれる問題解消
https://qiita.com/non0311/items/03e3e7a042f70f072286
## git pull や git push 時にユーザ ID やパスワードの入力を省きたい
https://qiita.com/ltcmdr927/items/fe8ba2e54b0b8e32d25d
## git パスワード を毎回聞かれる問題の解決方法
https://qiita.com/rorensu2236/items/df7d4c2cf621eeddd468
## GitHubでユーザ名・パスワード省略（push, pull）
https://qiita.com/azusanakano/items/8dc1d7e384b00239d4d9


設定確認
```
config --list
```
通信設定確認（httpかsshか）
```
git remote -v
```

## １．sshに変える
－１：通信をsshに変える －
```
git remote set-url origin git@github.com:
git remote -v
```
－２：リモートリポジトリをセット－
```
git remote set-url origin git@github.com:△△××/◯◯△△.git
git remote -v
```

－３：－
```
git pull
```

## ２．URL にユーザ ID およびパスワードを入れて更新する。
```
git remote set-url origin https://userid:password@github.com/yourname/awesome-app.git
```
*** パスワードとユーザ名に記号が入っている場合 ***    
URL エンコーディングの要領で記号を変換する。以下の例はユーザ名が user.id で、パスワードが pass%word$ の場合。
```
git remote set-url origin https://user%2Eid:pass%25word%24@github.com/yourname/awesome-app.git
```

## ３．clone済のリポジトリの設定を変更する場合
{cloneしたリポジトリDir}/.git/configを編集
```
[remote "origin"]
  url = https://username@github.com/username/repository.git
```

## ４．git cloneするURLに埋め込む（新規でcloneする場合）
```
git clone https://username@github.com/username/repository.git
```

## ~/.netrc

