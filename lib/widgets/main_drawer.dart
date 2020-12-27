import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/perference_manager/perference_manager.dart';

import '../screens/filters_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_as_buyer_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/admin_panel.dart';
import '../screens/admin_view_requests.dart';
import '../screens/admin_view_users.dart';

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
      child: ListView(
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
            'Categories',
            Icons.shop,
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
          buildListTitle(
            'Admin Panel',
            Icons.admin_panel_settings,
            () {
              Navigator.of(context).pushNamed(AdminPanel.routeName);
            },
          ),
          buildListTitle(
            'Admin Users',
            Icons.admin_panel_settings_sharp,
            () {
              Navigator.of(context).pushNamed(AdminViewUsers.routeName);
            },
          ),
          buildListTitle(
            'Admin Requests',
            Icons.admin_panel_settings_sharp,
            () {
              Navigator.of(context).pushNamed(AdminViewRequests.routeName);
            },
          ),
          buildListTitle(
            'Pref Requests',
            Icons.access_alarm,
            () {
              Navigator.of(context).pushNamed(MyHomePage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
