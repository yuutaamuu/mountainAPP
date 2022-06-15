import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Second'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //ボタンを押した時に呼ばれるコードを書く。
            Navigator.pop(context);
          },
          child: const Text('戻る'),
        ),
      ),
    );
  }
}