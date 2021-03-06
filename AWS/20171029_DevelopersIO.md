# Developers.IO 2017 WORLD in 福岡

### Visionで変わるiOSのアプリ開発
- Vision（画像解析フレームワーク）
    - 顔検出 Face Detection
    - 横顔の検出も可
    - 顔特徴点検出 Face Landmarks
    - 矩形検出
    - バーコード検出（iOS標準搭載となった）
    - テキスト検出
    - オブジェクトトラッキング（対象の人などを、追跡し続ける）

 Visionを利用したプロセス
 - Request
 - RequestHandler
 - Observation

Vision と Core ML（機械学習フレームワーク）

Keras（ディープラーニング用のライブラリ）
 - バックエンドに TendorFloｗを利用


### Amazon Elasticsearch Serviceの使いドコロ
全文検索
 - 複数の文書（ファイル）から特定の文字列を検索する事
 　　適合率（正確性）　
 　　再現率（網羅率。漏れがないか）


RDBMSの索引型全文検索
 - grep型
 - 索引型

Mecabパーサー
辞書を基に分解。

HTMLのタグは予め排除する。（検索対象外とする）

AWS環境における全文検索の選択肢
 - Amazon CloudSearch
 - Elasticsearch on EC2
     - EC2インスタンス上でElasticsearchクラスタを構築
     - AWS利用費が低コスト
     - Elasticsearch 機能を制限なく利用可
     - 運用はご自身で。
 - 

EC2でなく、運用まで面倒見てくれるサービスがおすすめ。

RDBMSを利用するか、Elasticsearchを使用するかは状況によって使い分け。


### UXデザインというマジックワードで玉砕した昔話とクラスメソッドでのデザイン活動
UX  
デザイナとエンジニアの境界線が無くなってきている。

弁論術
 - ロゴス（論理的に話す事）
 - エトス(信頼。誰が話すか)
 - パトス（情熱）

人それぞれに得意とする感覚がある
　用核
　言語
　触覚
　視覚

### AWS Security Best Practices Whitepaperをガッツリ読み解く会
AWSが公式として出しているセキュリティのベストプラクティス。
具体的な設定方法は書いてない。

保護する必要があるアセットを定義

＜＞
ベストプラクティスは、「必要最低限」だが、コストがかかる。
ある程度、緩く設定した方がいい。
問題発生を即座に検知、対応できる仕組みづくりをしておくほうが現実的。

１人１ユーザ。強くお勧め。
グループ使え。個人に割り当てたら管理が死ぬ。一人しか使わないポリシーとしてもだ。

移譲。
例えば、EC2で実行するなら、ユーザでなくEC2に権限を与えればいい。

アクセスキーは最後の手段。
原則として、IAMロールや一時的認証を使用する。


暗号化はELBで完結させて、それ以降は通常のHTTP
というやり方がある。

カスタムAMI-Windows
必須でないデフォルト設定は無効化しておく。

**EC2 Systems Manager**がある。
エージェントをインストールするだけで使える。

abuse reportは無視しない。
セキュリティ用連絡メールアドレスを作成。

脆弱性診断

セキュリティ管理は楽になる。
やらないでいい部分が出来る。

### クラスメソッドの紹介



