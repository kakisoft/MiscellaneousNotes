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
## ドキュメントの中身を削除
db.collection01.remove({});

## ドキュメントの個数を確認（select count(*) from TABLE01）
db.collection01.count();

## ドキュメントの中身を確認（select * from TABLE01）
db.collection01.find();

## 条件を指定して検索
```
（name が "kaki"）
db.collection01.find({name:"kaki"});

（score が 50以上）
db.collection01.find({score: {$gte: 50}});

（正規表現を使って検索）
db.collection01.find({name: /^k/ });

（フィールドにどんな値があるのか抽出）
db.collection01.distinct("name");
```
#### 条件式
```
$gte    Greater Than or Equal
$gt     Greater Then
$lte    Less Then or Equal
$eq     Equal
$neq    Not Equal
```

## AND：複数条件で検索
nameに "a" を含む、かつ score 40以上
```
db.collection01.find( 
                       {
                          name:/a/, 
                          score:{$gte:40},
                       }
                     );
```

## OR：複数条件で検索
nameに "a" を含む、または score 40以上
```
db.collection01.find( 
                       {$or:
                          [
                            {name:/a/}, 
                            {score:{$gte:40}},
                          ]
                       }
                     );
```

## in検索
```
db.collection01.find( 
                       {
                         score:{
                                 $in:[30,50]
                               }
                       }
                     );

```
