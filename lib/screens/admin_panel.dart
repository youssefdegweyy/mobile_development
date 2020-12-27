import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  static const routeName = '/admin-panel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  const Text(
                    "Admin Panel",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      child: Text('View All Users',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      onPressed: () {},
                      color: Colors.black,
                      child: Text('View All Items',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      onPressed: () {},
                      color: Colors.black,
                      child: Text('View Requests',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
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
