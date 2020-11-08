import 'package:flutter/material.dart';


class MyItem extends StatefulWidget {

  @override
  _MyItemState createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'images/1.jpg',
                  width: 411.4,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Tommy Hilfiger Watch',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Price: 500 EGP',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                // FlatButton(
                //   color: _hasBeenPressed ? Colors.blue : Colors.black,
                //   textColor: Colors.white,
                //   padding: EdgeInsets.all(8.0),
                //   splashColor: Colors.blueAccent,
                //   onPressed: () => {
                //     setState(() {
                //       _hasBeenPressed = !_hasBeenPressed;
                //     })
                //   },
                //   child: Text(
                //     "Add to cart",
                //     style: TextStyle(fontSize: 20.0),
                //   ),
                // ),
                RaisedButton(
                  child: _hasBeenPressed ? Text('Add To Cart') : Text('Item Added'),
                  textColor: Colors.white,
                  // 2
                  color: _hasBeenPressed ? Colors.blue : Colors.black,
                  // 3
                  onPressed: () => {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    })
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
