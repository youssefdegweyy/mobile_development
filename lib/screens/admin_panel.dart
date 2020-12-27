import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  static const routeName = '/admin-panel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Admin Panel",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  SizedBox(height: 30),
                  const SizedBox(
                    width: 200,
                    child: const RaisedButton(
                      onPressed: null,
                      child: Text('View All Users',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 20),
                  const SizedBox(
                    width: 200,
                    child: const RaisedButton(
                      onPressed: null,
                      child: Text('View All Items',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 20),
                  const SizedBox(
                    width: 200,
                    child: const RaisedButton(
                      onPressed: null,
                      child: Text('Disabled Button',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 20),
                  const SizedBox(
                    width: 200,
                    child: const RaisedButton(
                      onPressed: null,
                      child: Text('Disabled Button',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
