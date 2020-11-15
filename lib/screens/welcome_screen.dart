import 'package:flutter/material.dart';

import './login_screen.dart';
import 'signup_as_buyer_screen.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: ListView(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Logo section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("images/Logo.png"),
                  width: 350,
                  height: 150,
                )
              ],
            ),
            //login button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 100, left: 100, top: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(9.0)),
                      child: FlatButton(
                        child: Text("Login",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginForm()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //signup buyer button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 100, left: 100, top: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(9.0)),
                      child: FlatButton(
                        child: Text("Signup as buyer",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupFormBuyer()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //signup seller button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 100, left: 100, top: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(9.0)),
                      child: FlatButton(
                        child: Text("Signup as seller",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ])));
  }
}
