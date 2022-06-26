import 'package:flutter/material.dart';
import 'package:mountain/main.dart';
import 'package:mountain/second_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String itemText = '';
  dynamic dateTime;
  dynamic dateFormat;
  
  _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        locale: const Locale("ja"),
        context: context,
        initialDate: dateTime,
        firstDate: DateTime((2003)),
        lastDate: DateTime(2023));
    if(datePicked != null && datePicked != dateTime) {
      setState(() {
        dateFormat = DateFormat("yyyy年MM月dd日").format(datePicked);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    dateFormat = DateFormat("yyyy年MM月dd日").format(dateTime);
  }

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
              Row(
                children: [
                  Text("$dateTime"),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      _datePicker(context);
                    },
                    child: const Text('日付を選択'),
                  ),
                ],
              ),
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