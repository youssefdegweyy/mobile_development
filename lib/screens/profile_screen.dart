import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("PlaceHolder Value"),
          Row(
            children: <Widget>[
              const FlutterLogo(),
              const Text(
                '',
                overflow: TextOverflow.ellipsis,
              ),
              const Icon(Icons.sentiment_very_satisfied),
            ],
          )
        ],
      ),
    );
  }
}
