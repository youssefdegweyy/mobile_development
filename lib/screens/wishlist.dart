import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  static const routeName = '/wishlist';

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
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
                        Expanded(
                          child: Icon(Icons.favorite),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
