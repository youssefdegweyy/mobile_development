import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/admin_panel.dart';
import 'package:flutter_complete_guide/screens/admin_view_requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/admin-pref-requests';

  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var number = 1;

  @override
  void initState() {
    super.initState();
    getIntFromLocalMemory('COUNTER_NUMBER').then((value) {
      if (number == 1) {
        Navigator.pushNamed(context, AdminPanel.routeName);
      } else if (number == 2) {
        Navigator.pushNamed(context, '/');
      } else if (number == 3) {
        Navigator.pushNamed(context, AdminViewRequests.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Save data locally'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    number--;
                  });
                  saveIntInLocalMemory('COUNTER_NUMBER', number);
                },
                child: Text('-'),
              ),
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Text(number.toString()),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    number++;
                  });
                  saveIntInLocalMemory('COUNTER_NUMBER', number);
                },
                child: Text('+'),
              )
            ],
          ),
        ));
  }

  /*
  * It saves the int value to the local memory.
  * */
  Future<int> getIntFromLocalMemory(String key) async {
    var pref = await SharedPreferences.getInstance();
    var number = pref.getInt(key) ?? 0;
    return number;
  }

  /*
  * It returns the saved the int value from the memory.
  * */
  Future<void> saveIntInLocalMemory(String key, int value) async {
    var pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }
}
