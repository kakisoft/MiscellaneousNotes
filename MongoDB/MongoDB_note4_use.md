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

## ドキュメントへのデータ挿入
```
db.collection01.insert(
                        {
                          name:"kaki",
                          score: 30
                        }
                      );

db.collection01.insert(
                        {
                          name:"ogawa",
                          score: 50,
                          tags:["web","mobile"]
                        }
                      );
```
JavaScriptを使用
```
for (var i=0; i<5; i++){
  db.collection01.insert({score:Math.random()});
}
```

## ドキュメントの個数を確認
db.collection01.count();

## ドキュメントの中身を確認
db.collection01.find();

## 条件を指定して検索
db.collection01.find({name:"kaki"});

## ドキュメントの中身を削除
db.collection01.remove({});


