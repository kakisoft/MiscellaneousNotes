# Visual Studio Code メモ

#### ショートカット

|　　操作                                |　　キー                                   |
|:--------------------------------------|:-----------------------------------------|
| 定義へ移動                             |  Ctrl + マウスホバー                      |
| 定義へ移動                             |  F12                                     |
| 変数の参照元を検索                      |  Shift + F12   その後、↑↓でスクロール。    |
| シンボルへ移動(「:」でグループごと)      |  Ctrl + Shift + o                         |
| 矩形選択                               |  Shift + Alt + ドラッグ                   |
| グローバル検索                          |  Ctrl Shivt + f                           |
| コメントアウト                          |  Ctrl + /                                 |
| 警告・エラーを表示                      |  Ctrl + Shift + m                         |
| 画面分割                               |  Ctrl + \                                 |
| インテリセンス                         |  Ctrl + Space                             |
| タブを閉じる                           |  Ctrl + w                                |
| タブ切替                               |  Ctrl + ↑ or ↓                           |
| ターミナルを表示                        |  Ctrl + Shift @                           |

  
　  
　  
　  
追加のキー設定は、
```
ファイル→基本設定→キーボードショートカット
「高度なカスタマイズを～」keybinding.json
```
（例）
```
    // 大文字に変換
    {
        "key": "ctrl+u",
        "command": "editor.action.transformToUppercase"
    },
    // 小文字に変換
    {
        "key": "ctrl+shift+u",
        "command": "editor.action.transformToLowercase"
    }
```

# プラグイン

### Live HTML Previewer
HTMLのプレビュー  
横にプレビューを表示　　Ctrl + q → s  
エディタ全体にプレビューを表示　　Ctrl +q → f  
ブラウザで表示　Ctrl +q → w  
  
### スニペット
HTML Snippets
