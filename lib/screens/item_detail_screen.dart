import 'package:flutter/material.dart';

import '../dummy_data.dart';


class MealDetailScreen extends StatefulWidget {

  @override
  MealDetailScreenState createState() => MealDetailScreenState();
}

class MealDetailScreenState extends State<MealDetailScreen> {
  bool _pressed = false;
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, '${selectedMeal.title}'),
            Text('Price: ${selectedMeal.price}', 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
                  child: _pressed ? Text('Item Added') : Text('Add to cart'),
                  textColor: Colors.white,
                  // 2
                  color: _pressed ? Colors.black : Colors.blue,
                  // 3
                  onPressed: () => {
                    setState(() {
                      _pressed = !_pressed;
                    })
                  },
                )
          ],
        ),
      ),
    );
  }
}
