import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  static const routeName = '/login-screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
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
            //Email textfield
            Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9.0)),
                                  child: TextFormField(
                                      validator: (value) {
                                        if(value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[500]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(9))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.green[300]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(9))),
                                          prefixIcon: Icon(Icons.email),
                                          hintText: 'Email'),
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black))),
                            ),
                          )
                        ],
                      ),
                      //Password textfield
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 10.0),
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9.0)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[500]),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(9))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green[300]),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(9))),
                                        prefixIcon: Icon(Icons.lock),
                                        hintText: 'Password'),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                    obscureText: true,
                                  )),
                            ),
                          )
                        ],
                      ),
                      //login button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 100, left: 100, top: 10),
                              child: Container(
                                alignment: Alignment.center,
                                height: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(9.0)),
                                child: FlatButton(
                                  child: Text("Login",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {}
                                    //checking if the email and password are correct
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //sign up navigation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 60.0,
                              child: GestureDetector(
                                  child: RichText(
                                text: TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Signup",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ]),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ])),
          ],
        ),
      ),
    ]))));
  }
}
