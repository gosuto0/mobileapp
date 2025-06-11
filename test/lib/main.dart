import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = [
    ];
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(listItems: list),
    );
  }
}

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