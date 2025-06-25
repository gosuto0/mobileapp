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

# Flutterを用いたTodoリスト
```
class TodoListPage extends StatelessWidget {
  final List listItems;
  TodoListPage({required this.listItems});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        automaticallyImplyLeading: false
      ),
      body: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(listItems[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage(listItems: listItems);
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {
  String text = "";
  final List listItems;
  TodoAddPage({required this.listItems});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// ## APPBAR
      appBar: AppBar(
        title: Text('Todo 管理'),
        automaticallyImplyLeading: false
      ),
      /// ##
      body: Container(
        child: Column(
          children: [
            TextField(
                onChanged: (value){
                    text = value;
                },
            ),
            ElevatedButton(
              onPressed: () {
                listItems.add(text);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TodoListPage(listItems: listItems);
                  }));
              },
              child: Text('Todoに追加する', style: TextStyle(color: Colors.blue))
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TodoListPage(listItems: listItems);
                  }));
              },
              child: Text('TodoList一覧に戻る', style: TextStyle(color: Colors.blue))
            ),
          ],
        )
      ),
    );
  }
}
```
複数のColumnを乗せる場合はContainerのchildrenを使用することで一つのContainerの中に複数のアイテムを入れることができる。
```
body: Container(
        child: Column(
          children: [
            TextField(
                onChanged: (value){
                    text = value;
                },
            ),
            ElevatedButton(
              onPressed: () {
                listItems.add(text);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TodoListPage(listItems: listItems);
                  }));
              },
              child: Text('Todoに追加する', style: TextStyle(color: Colors.blue))
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TodoListPage(listItems: listItems);
                  }));
              },
              child: Text('TodoList一覧に戻る', style: TextStyle(color: Colors.blue))
            ),
          ],
        )
```
# データのアクセスと管理
データファイル取得にはpath_providerを使用する
```
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<File> getDataFile(String filename) async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  return File('$path/$filename');
}
```
# Httpリクエスト
リクエストにはhttpを使用する
```
import 'package:http/http.dart' as http;

Future<String> fetchDataFile(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.stat#usCode == 200) {
    return response.body;
  } else {
    throw Exception('ファイル取得失敗: ${response.statusCode}');
  }
}
```