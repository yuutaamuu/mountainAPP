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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(items[index]["date"]),
                            Text(items[index]["text"]),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    items.removeAt(index);
                                    print(items);
                                  });
                            },
                                child: Text("削除"))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}