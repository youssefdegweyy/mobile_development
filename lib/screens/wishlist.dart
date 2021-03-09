import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  static const routeName = '/wishlist';

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  String dropdownValue = 'Ascending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WishList"),
        leading: Padding(
          padding: EdgeInsets.only(left: 15, right: 9, top: 9, bottom: 9),
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Items Found: 52'),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Color(0xFF00af87)),
                underline: Container(
                  height: 2,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Ascending', 'Descending']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 22, left: 30, right: 30, bottom: 22),
            child: Column(
              children: [
                Container(
                  decoration: new BoxDecoration(
                      color: Color(0xFF222222),
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/noti.png",
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            "Test Item",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: null, child: Text('Add to cart')),
                          ],
                        ),
                        Expanded(
                          child: Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
