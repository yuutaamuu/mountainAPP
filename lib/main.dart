import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:mountain/first_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

class Home extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<Home> {
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> complete = [];

  void _removeItems(items, index) {
    items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("リスト一覧"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () async {
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return TodoAddPage();
              }),
            );
            if(newListText != null) {
              setState(() {
                // リスト追加
                items.add({"text": newListText.itemText, "date": newListText.dateFormat});
                print({newListText});
                print(newListText.itemText);
              });
            }
          },
          child: Icon(Icons.add),
        ),
        body: Container(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "未完了タスク",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                      )
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(items[index]["date"]),
                                Text(items[index]["text"]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            complete.add(items[index]);
                                            _removeItems(items, index);

                                          });
                                    },
                                        child: Text("完了へ")),
                                    SizedBox(width: 20),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _removeItems(items, index);
                                          });
                                        },
                                        child: Text("削除")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "完了タスク",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                      )
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: complete.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(complete[index]["date"]),
                                Text(complete[index]["text"]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            items.add(complete[index]);
                                            _removeItems(complete, index);

                                          });
                                        },
                                        child: Text("未完了へ")),
                                    SizedBox(width: 20),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _removeItems(complete, index);
                                          });
                                        },
                                        child: Text("削除")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}