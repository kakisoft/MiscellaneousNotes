# Visual Studio Code メモ

#### ショートカット

|　　操作                               |　　キー                    |
|:--------------------------------------|:---------------------------|
| 定義へ移動                            |  Ctrl + マウスホバー       |
| シンボルへ移動(「:」でグループごと)   |  Ctrl + Shift + o          |
| 矩形選択                              |  Shift + Alt + ドラッグ    |
| グローバル検索                        |  Ctrl Shivt + f            |
| コメントアウト                        |  Ctrl + /                  |
| 警告・エラーを表示                    |  Ctrl + Shift + m          |
| 画面分割                              |  Ctrl + \                  |
| インテリセンス                        |  Ctrl + Space              |
  
  
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
