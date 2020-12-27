import 'package:flutter/material.dart';

class AdminViewUsers extends StatelessWidget {
  static const routeName = '/admin-view-users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "All Users",
                  style: TextStyle(color: Colors.black, fontSize: 29),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                child: Table(
                  border: TableBorder.all(width: 2),
                  columnWidths: {
                    0: FractionColumnWidth(.4),
                    1: FractionColumnWidth(.4),
                    2: FractionColumnWidth(.2)
                  },
                  children: [
                    TableRow(children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Image",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("images/Logo.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "This is a short description of the zeby",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("20 USD"),
                      ),
                    ]),
                    TableRow(children: [
                      Image.asset("images/Logo.png"),
                      Text("This is a short description of the zeby"),
                      Text("20 USD"),
                    ]),
                    TableRow(children: [
                      Image.asset("images/Logo.png"),
                      Text("This is a short description of the zeby"),
                      Text("20 USD"),
                    ]),
                    TableRow(children: [
                      Image.asset("images/Logo.png"),
                      Text("This is a short description of the zeby"),
                      Text("20 USD"),
                    ]),
                    TableRow(children: [
                      Image.asset("images/Logo.png"),
                      Text("This is a short description of the zeby"),
                      Text("20 USD"),
                    ]),
                    TableRow(children: [
                      Image.asset("images/Logo.png"),
                      Text("This is a short description of the zeby"),
                      Text("20 USD"),
                    ]),
                    TableRow(children: [
                      Image.asset("images/Logo.png"),
                      Text("This is a short description of the zeby"),
                      Text("20 USD"),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
