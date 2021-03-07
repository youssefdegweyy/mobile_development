import 'package:mycart/screens/contactus_screen.dart';
import 'package:mycart/screens/main_menu.dart';
import 'package:mycart/screens/offers_screen.dart';
import 'package:mycart/screens/sign_in.dart';
import 'package:mycart/services/data_manager.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTitle(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
          //fontFamily: 'RobotoCondensed',
          fontSize: 18,
          //fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints.expand(),
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF00d466),
                        Color(0xFF00af87),
                      ],
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/main/back.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(25.0),
                  child: Image.asset(
                    "assets/images/main/logo.png",
                    width: 300,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          buildListTitle(
            'Offers',
            Icons.offline_bolt,
            () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, OffersScreen.routeName);
            },
          ),
          /*buildListTitle(
            'Calorie Calculator',
            Icons.calculate,
            () {
              Navigator.of(context).pop();
              //Navigator.pushNamed(context, CalorieCalculatorScreen.routeName);
            },
          ),*/
          /*buildListTitle(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context).pop();
              //Navigator.pushNamed(context, SettingsScreen.routeName);
            },
          ),*/
          buildListTitle(
            'Contact Us',
            Icons.contact_phone,
            () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, ContactUsScreen.routeName);
            },
          ),
          buildListTitle(
            'Logout',
            Icons.exit_to_app,
            () {
              DataManager.mPrefManager.logOut();
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}