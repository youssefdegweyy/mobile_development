import 'package:flutter/material.dart';

class AdminViewRequests extends StatelessWidget {
  static const routeName = '/admin-view-requests';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: SafeArea(
            child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                border: TableBorder.all(width: 2),
                children: [
                  TableRow(children: [
                    Center(
                      child: Text(
                        "Image",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        "status",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("images/Logo.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Short Description"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Theme(
                                data: ThemeData(splashColor: Colors.green),
                                child: IconButton(
                                  color: Colors.green,
                                  onPressed: () {},
                                  icon: Icon(Icons.beenhere),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Theme(
                                data: ThemeData(splashColor: Colors.red),
                                child: IconButton(
                                  color: Colors.transparent,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ])
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
