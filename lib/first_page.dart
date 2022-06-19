import 'package:flutter/material.dart';
import 'package:mountain/second_page.dart';

class FirstPage extends StatelessWidget {
  String nameText = '';

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
              Image.asset('images/sweetdreams.png'),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (text){
                  nameText = text;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  //ボタンを押した時に呼ばれるコードを書く。
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage(nameText),
                    fullscreenDialog: true,
                    ),
                  );
                },
                child: const Text('次の画面へ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}