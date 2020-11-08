import 'package:flutter/material.dart';

import 'item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCart',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('MyCart'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              MyItem(),
            ],
          ),
        ),
      ),
    );
  }
}
