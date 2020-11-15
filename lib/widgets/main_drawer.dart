import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_as_buyer_screen.dart';
import '../screens/signup_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'MyCart',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          buildListTitle(
            'Profile',
            Icons.person,
            () {
              Navigator.of(context).pushNamed(ProfileScreen.routeName);
            },
          ),
          buildListTitle(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
          buildListTitle(
            'Login',
            Icons.login,
            () {
              Navigator.of(context).pushNamed(LoginFormState.routeName);
            },
          ),
          buildListTitle(
            'Signup',
            Icons.app_registration,
            () {
              Navigator.of(context).pushNamed(SignupFormBuyerState.routeName);
            },
          ),
          buildListTitle(
            'Sell with us',
            Icons.money,
            () {
              Navigator.of(context).pushNamed(SignupFormSellerState.routeName);
            },
          ),
        ],
      ),
    );
  }
}
