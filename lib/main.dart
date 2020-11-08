import 'package:flutter/material.dart';

<<<<<<< HEAD
import './categories_screen.dart';

void main() => runApp(MyApp());
=======
import 'item.dart';

void main() {
  runApp(MyApp());
}
>>>>>>> 32301be293cfee0bc54d0b0edfb650f09b202359

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      home: CategoriesScreen(),
=======
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
>>>>>>> 32301be293cfee0bc54d0b0edfb650f09b202359
    );
  }
}
