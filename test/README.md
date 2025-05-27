# Gitの基本操作
- リポジトリの初期化

    git init

- ファイルのステージング

    git add FILE_NAME

- コミットの作成

    git commit -m COMMIT_MESSAGE
# FlutterのMyAppウィジェットの基本
```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', #タイトルを変更
      home: Text(
        'Hello, Flutter World!!', 
        style: TextStyle(fontSize:32.0), #文字のスタイル
      ),
    );
  }
}
```