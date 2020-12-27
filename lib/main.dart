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
  @override
  Widget build(BuildContext context) {
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
        LoginFormState.routeName: (ctx) => LoginForm(),
        SignupFormBuyerState.routeName: (ctx) => SignupFormBuyer(),
        SignupFormSellerState.routeName: (ctx) => SignupFormSeller(),
        AdminPanel.routeName: (ctx) => AdminPanel(),
        AdminViewUsers.routeName: (ctx) => AdminViewUsers(),
        AdminViewRequests.routeName: (ctx) => AdminViewRequests(),
        MyHomePage.routeName: (ctx) => MyHomePage(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }

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
