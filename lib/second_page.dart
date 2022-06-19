import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,
            style: TextStyle(
              fontSize: 50,
            ),),
            ElevatedButton(
              onPressed: () {
              //ボタンを押した時に呼ばれるコードを書く。
              Navigator.pop(context);
            },
              child: const Text('戻る'),)
          ],

        ),
      ),
    );
  }
}