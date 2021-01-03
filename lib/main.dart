import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import 'screens/item_detail_screen.dart';
import 'screens/category_items_screen.dart';
import './screens/categories_screen.dart';
import './screens/filters_screen.dart';
import './screens/profile_screen.dart';
import './screens/login_screen.dart';
import './screens/signup_as_buyer_screen.dart';
import './screens/signup_screen.dart';
import './screens/admin_panel.dart';
import './screens/admin_view_users.dart';
import './screens/admin_view_requests.dart';
import './perference_manager/perference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  PrefManager myPrefManager = new PrefManager();

  @override
  Widget build(BuildContext context) {
    print("PREFMGR: " + myPrefManager.getPermission().toString());
    if (myPrefManager.getPermission() == 0) {
      return MaterialApp(
        title: 'MyCart',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Color.fromRGBO(255, 255, 255, 1),
          canvasColor: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        // home: CategoriesScreen(),
        initialRoute: LoginFormState.routeName, // default is '/'
        routes: {
          LoginFormState.routeName: (ctx) => LoginForm(),
          SignupFormBuyerState.routeName: (ctx) => SignupFormBuyer(),
          SignupFormSellerState.routeName: (ctx) => SignupFormSeller(),
        },
      );
    } else {
      return MaterialApp(
        title: 'MyCart',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Color.fromRGBO(255, 255, 255, 1),
          canvasColor: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        // home: CategoriesScreen(),
        initialRoute: '/', // default is '/'
        routes: {
          '/': (ctx) => TabsScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailScreenState.routeName: (ctx) => MealDetailScreen(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          AdminPanel.routeName: (ctx) => AdminPanel(),
          SignupFormSeller.routeName: (ctx) => SignupFormSeller(),
          LoginFormState.routeName: (ctx) => LoginForm(),
          AdminViewUsers.routeName: (ctx) => AdminViewUsers(),
          AdminViewRequests.routeName: (ctx) => AdminViewRequests(),
        },
      );
    }
  }
}
