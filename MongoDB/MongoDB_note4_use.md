## コレクション作成
db.createCollection("collection01");

## コレクションを削除
db.collection01.drop();

## データベースに関する情報を確認
db.stats()

## コレクション名を変更
db.collection01.renameCollection("collection02");

## コレクション一覧を表示
show collections