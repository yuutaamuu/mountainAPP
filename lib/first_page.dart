import 'package:flutter/material.dart';
import 'package:mountain/main.dart';
import 'package:mountain/second_page.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String itemText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value){
                  setState(() {
                    itemText = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  //ボタンを押した時に呼ばれるコードを書く。
                  Navigator.of(context).pop(itemText);
                },
                child: const Text('保存する'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}