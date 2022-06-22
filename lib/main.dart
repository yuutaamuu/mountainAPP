import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  int count2 = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(count2.toString()),
          ElevatedButton(
            onPressed: () {
              // データを更新する時は setState を呼ぶ
              setState(() {
                // データを更新
                count2 = count2 + 2;
              });
            },
            child: Text('カウントアップ'),
          ),
        ],
      ),
    );
  }
}